#!/bin/bash
# LearnCC: Session Start Context Primer
# Reads progress.json and outputs a context summary for Claude.
# Output is injected silently into Claude's context via suppressOutput.

PROGRESS_FILE="$HOME/.claude/learncc/progress.json"

if [ ! -f "$PROGRESS_FILE" ]; then
    echo "[LearnCC] New learner — no progress file found. Start with Module 0 (Orientation)."
    exit 0
fi

# Validate JSON
if ! python3 -c "import json,sys; json.load(sys.stdin)" < "$PROGRESS_FILE" 2>/dev/null; then
    # Try backup
    BACKUP_FILE="$HOME/.claude/learncc/progress.backup.json"
    if [ -f "$BACKUP_FILE" ] && python3 -c "import json,sys; json.load(sys.stdin)" < "$BACKUP_FILE" 2>/dev/null; then
        cp "$BACKUP_FILE" "$PROGRESS_FILE"
        echo "[LearnCC] Progress file was corrupted. Restored from backup."
    else
        echo "[LearnCC] Progress file is corrupted and no valid backup exists. Start fresh with Module 0."
        exit 0
    fi
fi

# Parse and output context summary
python3 << 'PYEOF'
import json, sys, os

progress_file = os.path.expanduser("~/.claude/learncc/progress.json")
try:
    with open(progress_file) as f:
        data = json.load(f)
except Exception:
    print("[LearnCC] Could not read progress file.")
    sys.exit(0)

learner = data.get("learner", {})
progress = data.get("progress", {})
parking = data.get("parking_lot", [])

role = learner.get("role", "unknown")
domain = learner.get("domain", "unknown")
experience = learner.get("experience", "unknown")

# Find current module
current_module = None
current_exercise = None
completed = []
skipped = []

for mod, info in progress.items():
    status = info.get("status", "not_started")
    if status == "complete":
        completed.append(mod)
    elif status == "skipped":
        skipped.append(mod)
    elif status == "in_progress":
        current_module = mod
        current_exercise = info.get("last_exercise", 0)

lines = []
lines.append(f"[LearnCC Session Context]")
lines.append(f"Returning learner. Role: {role}. Domain: {domain}. Experience: {experience}.")

if completed:
    lines.append(f"Completed modules: {', '.join(sorted(completed))}")
if skipped:
    lines.append(f"Skipped modules: {', '.join(sorted(skipped))}")

if current_module:
    lines.append(f"Current module: {current_module}, last completed exercise: {current_exercise}")
    lines.append(f"Resume from exercise {current_exercise + 1}.")
    lines.append(f"Read the module reference file for {current_module} to get the exercise sequence.")
elif completed:
    # Find next module in sequence
    module_order = [
        "module_0", "module_0_5", "module_1", "module_2a", "module_2b",
        "module_3", "module_4", "module_5a", "module_5b",
        "module_6a", "module_6b", "module_7"
    ]
    done = set(completed + skipped)
    next_mod = None
    for m in module_order:
        if m not in done:
            next_mod = m
            break
    if next_mod:
        lines.append(f"Next module to start: {next_mod}")
    else:
        lines.append("All modules complete. Course finished.")
else:
    lines.append("No modules started yet. Begin with Module 0 (Orientation).")

if parking:
    lines.append(f"Parking lot ({len(parking)} deferred questions):")
    for item in parking[:5]:
        q = item.get("question", "")
        dest = item.get("deferred_to", "")
        lines.append(f"  - {q} (deferred to {dest})")

lines.append("[End LearnCC Context]")
print("\n".join(lines))
PYEOF
