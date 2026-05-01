#!/bin/bash
# LearnCC: Session Start Context Primer
#
# Emits a passive notice based on the learner's state. Three cases:
#
#   1. No progress file        → silent (user hasn't started the course)
#   2. Course in progress      → "course in progress" notice
#   3. Course complete + patch → "new since you finished" notice (for graduates
#                                who haven't done the latest patch yet)
#   4. Course complete, current → silent (no nag)
#
# This hook fires globally because the plugin is enabled at the user level. It
# stays passive on purpose — it does NOT inject progress data or instruct
# Claude to auto-resume. Resumption happens only when the learner explicitly
# invokes /learncc:learncc.

PROGRESS_FILE="$HOME/.claude/learncc/progress.json"
BACKUP_FILE="$HOME/.claude/learncc/progress.backup.json"

# Available patches (keep in sync with the AVAILABLE PATCHES list in SKILL.md).
# Order matters: list newest last so the offered patch is always the most recent.
AVAILABLE_PATCHES=("1.7")

# No progress file → user hasn't started the course. Stay silent.
if [ ! -f "$PROGRESS_FILE" ]; then
    exit 0
fi

# Empty or non-JSON → try restoring from backup, else stay silent.
if [ ! -s "$PROGRESS_FILE" ] || ! head -c 1 "$PROGRESS_FILE" | grep -q '{'; then
    if [ -f "$BACKUP_FILE" ] && [ -s "$BACKUP_FILE" ] && head -c 1 "$BACKUP_FILE" | grep -q '{'; then
        cp "$BACKUP_FILE" "$PROGRESS_FILE"
    else
        exit 0
    fi
fi

# Use jq if available for robust parsing; fall back to grep otherwise.
COURSE_COMPLETED_VERSION=""
PATCHES_COMPLETED_RAW=""
if command -v jq >/dev/null 2>&1; then
    COURSE_COMPLETED_VERSION=$(jq -r '.course_version_completed // empty' "$PROGRESS_FILE" 2>/dev/null)
    PATCHES_COMPLETED_RAW=$(jq -r '.patches_completed // [] | join(",")' "$PROGRESS_FILE" 2>/dev/null)
else
    # Tolerant grep-based extraction. Matches "course_version_completed": "X.Y.Z"
    COURSE_COMPLETED_VERSION=$(grep -o '"course_version_completed"[[:space:]]*:[[:space:]]*"[^"]*"' "$PROGRESS_FILE" 2>/dev/null \
        | sed -E 's/.*"course_version_completed"[[:space:]]*:[[:space:]]*"([^"]*)".*/\1/')
    # Matches "patches_completed": ["1.7", "1.8"] — extracts inner contents
    PATCHES_COMPLETED_RAW=$(grep -o '"patches_completed"[[:space:]]*:[[:space:]]*\[[^]]*\]' "$PROGRESS_FILE" 2>/dev/null \
        | sed -E 's/.*\[(.*)\].*/\1/' | tr -d ' "')
fi

# Find the newest available patch the learner has NOT completed.
PATCH_TO_OFFER=""
for patch in "${AVAILABLE_PATCHES[@]}"; do
    case ",${PATCHES_COMPLETED_RAW}," in
        *",${patch},"*) ;;  # already done
        *) PATCH_TO_OFFER="$patch" ;;  # candidate; keep iterating to land on newest
    esac
done

# State-based notice.
if [ -n "$COURSE_COMPLETED_VERSION" ]; then
    # Graduated learner.
    if [ -n "$PATCH_TO_OFFER" ]; then
        echo "[LearnCC] You finished the course at v${COURSE_COMPLETED_VERSION}. New features have shipped since — type /learncc:learncc for a short walkthrough of just the deltas. Otherwise ignore this notice and proceed with the user's request."
    fi
    # All caught up → stay silent. No nag for current graduates.
    exit 0
fi

# In-progress learner.
echo "[LearnCC] You have a course in progress. Run /learncc:learncc to resume. Otherwise ignore this notice and proceed with the user's request."
