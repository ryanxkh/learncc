#!/bin/bash
# LearnCC: Session Start Context Primer
#
# Emits a passive notice when a learncc course is in progress, so the learner
# can opt into resuming via /learncc:learncc. Does NOT instruct Claude to
# auto-resume — that hijacks unrelated sessions in other directories, since
# the plugin is enabled at the user level and this hook fires globally.
#
# When no progress file exists, exit silently — the user hasn't started the
# course, so there's nothing to surface in unrelated projects.

PROGRESS_FILE="$HOME/.claude/learncc/progress.json"
BACKUP_FILE="$HOME/.claude/learncc/progress.backup.json"

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

# Passive notice only. No imperative to read the file or resume — the slash
# command handler in SKILL.md reads progress.json directly when invoked.
echo "[LearnCC] You have a course in progress. Run /learncc:learncc to resume. Otherwise ignore this notice and proceed with the user's request."
