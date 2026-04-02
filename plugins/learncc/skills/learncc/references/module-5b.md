### MODULE 5B: HOOKS & SUBAGENTS (40 min)

**Purpose:** Automate deterministic behavior with hooks and delegate work to parallel agents.

**Module constraint:** This is the highest quit-risk module for non-technical users. Apply role adaptation strictly:
- **Non-technical path:** Skip hooks entirely (Exercises 1-4). Focus on subagents only (Exercises 5-8). Total time: ~20 min.
- **PM path:** Brief hooks concept, skip config details, "ask Claude to create" for everything. Full subagents. Total time: ~30 min.
- **Developer path:** Full hooks with copy-paste template + power features. Full subagents. Total time: ~40 min.

Max 20 min on hooks. Max 20 min on subagents. If hook config doesn't work in 3 attempts: "Let's move to subagents and come back to hooks later."

**Time limit:** 40 minutes.

**Opening Retrieval:** "What's the difference between a skill and a plugin? When would you use each?"

#### Exercise 5b.1 — Hooks: The Concept (3 min)

"Hooks are automatic actions that fire every time a specific event happens. Unlike CLAUDE.md rules (which Claude follows most of the time), hooks are **deterministic** — they ALWAYS run, no exceptions."

Analogies by role:
- Developer: "Like git hooks or CI pipelines — triggered automatically by events."
- PM: "Like Zapier automations — when X happens, always do Y."
- Non-technical: "Like a smoke detector — it checks for smoke constantly, you don't have to remind it."

**NON-TECHNICAL PATH BRANCH:**
"Hooks are powerful but they require JSON configuration — essentially a settings file in a specific format. This is more technical than what we've been doing. Here's what to know: hooks exist, they can automate things like 'format every file Claude edits' or 'run a check before every commit.' When you're ready to set one up, you or someone technical on your team can do it — or you can ask Claude to create one for you."

"For now, let's focus on subagents, which you can start using immediately."
→ **Jump to Exercise 5b.5**

**PM PATH:** Continue with Exercise 5b.2 but use "ask Claude to create" exclusively.

**DEVELOPER PATH:** Continue with full exercise sequence.

#### Exercise 5b.2 — Create a Hook (12 min, developer + PM paths)

**DEVELOPER PATH:**
"Let's create a hook that auto-formats files after Claude edits them."

"Option 1 — Ask Claude:"
"Tell Claude: 'Create a PostToolUse hook that runs prettier (or your formatter) on any file after Claude writes or edits it. Add it to my settings.json.'"

"Option 2 — Copy-paste template:"
"Add this to your `~/.claude/settings.json`:"
```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "npx prettier --write \"$CLAUDE_FILE_PATH\"",
            "statusMessage": "Formatting..."
          }
        ]
      }
    ]
  }
}
```
"Modify the command to match your formatter. Then edit any file to trigger it."

**PM PATH:**
"Tell Claude: 'Set up a hook that [describe what you want to happen automatically]. Have it run after [event].' Claude will create the configuration for you."

Role-adapted hook ideas for PMs:
- "After Claude creates any document, add a 'Last updated: [date]' line at the top"
- "Before Claude finishes a task, check that the output follows our template structure"

#### Exercise 5b.3 — Hook Power Features (5 min, developer path only)

**Developer path only. PM path: skip to Exercise 5b.4.**

"Hooks have four handler types:"

| Type | What It Does | Use Case |
|------|-------------|----------|
| `command` | Runs a shell command | Formatting, linting, notifications |
| `http` | POSTs to a URL | Webhooks, Slack alerts, logging services |
| `prompt` | Asks Claude to evaluate a condition | Nuanced allow/deny decisions |
| `agent` | Spawns a subagent to investigate before deciding | Complex verification before allowing an action |

"Four power features most users never discover:"
- **`updatedInput`** — A PreToolUse hook can modify the tool's input BEFORE it runs. Example: force `--dry-run` on dangerous commands, inject environment context, rewrite file paths
- **`suppressOutput: true`** — Hook output goes to Claude but ISN'T shown to the user. Inject hidden context — system state, team conventions, project metadata — that Claude uses but that doesn't clutter your conversation
- **`async: true`** — Fire-and-forget. The hook runs in the background without blocking Claude. Perfect for logging, notifications, metrics
- **`once: true`** — Hook runs only on the first matching event per session, then deactivates. Good for session-start checks

#### Exercise 5b.4 — Verify Your Hook (2 min, developer + PM paths)
"Try this now: type `/hooks`. You should see your new hook listed with its event, matcher, and handler."

"Now trigger it — edit a file and confirm the hook ran. You should see the statusMessage in the spinner."

**Validation checkpoint (developer path):** Invoke the learncc-validator agent to check the hook config: "Let me check your hook configuration." Relay any findings.

If it didn't work: "Check /hooks for errors. Common issues: JSON syntax errors, wrong file path, missing tool. If it doesn't work in 3 tries, let's move on — you can debug it later."

#### Exercise 5b.5 — Subagents: The Concept (3 min)

"Subagents are Claude instances that work in their **own context window**. This is the #1 reason to use them: they don't pollute your main conversation."

"When you ask Claude to research something — read 10 files, explore a codebase, analyze data — all of that fills YOUR context window. A subagent does the same research in a SEPARATE context and returns just the summary."

Analogies:
- Developer: "Like spawning a worker process — it does its job and returns the result."
- PM: "Like sending an analyst to research something — they come back with a summary, not every paper they read."
- Non-technical: "Like sending a team member to investigate — they do the legwork and report back the findings."

"Three built-in subagents:"
| Name | Speed | Tools | Best For |
|------|-------|-------|----------|
| **Explore** | Fast (uses Haiku) | Read-only | Quick file searches, codebase exploration |
| **Plan** | Normal | Read-only | Research during planning, no accidental changes |
| **General-purpose** | Normal | All tools | Complex tasks needing both reading and writing |

#### Exercise 5b.6 — Use a Built-In Subagent (5 min)
"Try this now: ask Claude to use a subagent for research."

Role-adapted prompts:
- Developer: "Use a subagent to explore the authentication module and summarize how login flow works."
- PM: "Use a subagent to read through our last 3 meeting notes and create a consolidated action item list."
- Non-technical: "Use a subagent to review the files in my Documents folder and tell me what's there."

"Notice: the research happened in a separate context. Check /context — your main conversation barely grew. Only the summary came back to you."

Socratic: "Why is this better than just asking Claude to do the research directly?"
Expected: Direct research fills your context with all the file contents. A subagent keeps that in its own window and returns only the summary.

#### Exercise 5b.7 — Create a Custom Subagent (7 min)
"You can create specialized subagents with their own instructions, tool access, and even different AI models."

"Try this now: tell Claude:"

Role-adapted:
- Developer: "'Create a subagent called code-reviewer that has read-only access, reviews code for security issues and performance problems, and returns a structured report. Save it to .claude/agents/.'"
- PM: "'Create a subagent called research-analyst that has read-only access, specializes in competitive research, and returns findings in a structured format. Save it to .claude/agents/.'"
- Non-technical: "'Create a subagent called document-checker that has read-only access, reviews documents for completeness and errors, and returns a summary of issues found. Save it to .claude/agents/.'"

"Once created, you can invoke it by name: 'Use the code-reviewer agent to check this file.'"

**Validation checkpoint:** Invoke the learncc-validator agent to check the subagent file: "Let me validate your subagent." Relay any findings.

#### Exercise 5b.8 — Context Isolation Demo (3 min)
"Let's prove context isolation works."

"Try this now: ask your custom subagent to read 5-6 files and summarize them. Then immediately run /context."

"Your main context window should show minimal growth — the subagent read those files in its own context. This is why power users delegate all investigation to subagents and keep their main conversation for implementation."

#### Module 5b Completion

**Capability statement:** "You understand hooks (deterministic automation) and subagents (delegated work in separate contexts). You've set up at least one, and you know when to use each."

**Competency check:** "What's the key difference between a hook and a skill? When would you use each?"

Expected: A hook runs automatically every time a condition is met (deterministic). A skill runs on demand when you invoke it (on-demand). Use hooks for rules that must ALWAYS be enforced. Use skills for workflows you want to trigger selectively.

Update progress.json: mark module_5b as `"complete"`.

"Module 5b complete. You've now covered all four extension mechanisms: skills, plugins, hooks, and subagents. Next: Module 6a — Parallel Work. This is about running multiple Claude sessions simultaneously and using patterns like writer/reviewer. Ready?"

---

