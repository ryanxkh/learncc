#!/bin/bash
# LearnCC: Session Start Context Primer
# Reads progress.json and outputs it for Claude to parse.
# No external dependencies — just bash and cat.

PROGRESS_FILE="$HOME/.claude/learncc/progress.json"
BACKUP_FILE="$HOME/.claude/learncc/progress.backup.json"

if [ ! -f "$PROGRESS_FILE" ]; then
    echo "[LearnCC] New learner. No progress file found. Start with Module 0 (Orientation)."
    exit 0
fi

# Check if file is non-empty and looks like JSON (starts with {)
if [ ! -s "$PROGRESS_FILE" ] || ! head -c 1 "$PROGRESS_FILE" | grep -q '{'; then
    # File is empty or corrupt — try backup
    if [ -f "$BACKUP_FILE" ] && [ -s "$BACKUP_FILE" ] && head -c 1 "$BACKUP_FILE" | grep -q '{'; then
        cp "$BACKUP_FILE" "$PROGRESS_FILE"
        echo "[LearnCC] Progress file was corrupted. Restored from backup."
    else
        echo "[LearnCC] Progress file is corrupted and no valid backup exists. Start fresh with Module 0."
        exit 0
    fi
fi

echo "[LearnCC Session Context] Returning learner. Progress data:"
cat "$PROGRESS_FILE"
echo ""
echo "[End LearnCC Context] Read this file with the Read tool to confirm, then resume where the learner left off."
