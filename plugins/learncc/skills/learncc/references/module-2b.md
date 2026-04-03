### MODULE 2B: SETTINGS & PERMISSIONS (20 min)

**Purpose:** Understand how to control Claude's behavior and personalize the environment.

**Module constraint:** Settings is a reference topic, not a mastery topic. Cover: (1) permission mode cycle, (2) the 4 scopes in 1 sentence each, (3) one practical permission rule. Do NOT enumerate all settings keys. If the learner asks about specific settings, say: "You can view your current settings with /status. Let's focus on permissions, which affect your daily workflow."

**Time limit:** 20 minutes. Non-technical path may finish in ~12 min. That's fine — move to Module 3 early.

**Opening Retrieval:** "Where does your CLAUDE.md live? Is it just for you, or does your team see it too?"

#### Exercise 2b.1 — /status (3 min)
"Try this now: type `/status`. This shows your current settings — what's active and WHERE each setting comes from. Notice it might say 'User' or 'Project' next to different items — we'll explain that in a moment."

Do NOT tell the learner to type `/config` — it may open a settings file in their default editor (often vim), which will trap non-technical users. Use `/status` for viewing settings (safe, outputs to conversation). Only mention `/config` to developer-path users who are comfortable with text editors.

#### Exercise 2b.2 — Permission Modes (5 min)
"Claude Code has different levels of autonomy. Try this now: press Shift+Tab. Look at the bottom of your screen — the mode indicator changes."

"Keep pressing Shift+Tab to cycle through. The order is:"

| Mode | What Claude Can Do | When to Use |
|------|-------------------|-------------|
| **default** | Asks permission for everything | When you're learning or want full control |
| **acceptEdits** | Edits files without asking, still asks for commands | When you trust Claude's edits but want to review commands |
| **plan** | Only reads and plans — no changes at all | When exploring or scoping a task before committing |
| **auto** | A separate AI classifier reviews each action | When you want hands-off work with safety guardrails (Team plan required) |

"Try this now: cycle to each mode and back. Which mode are you in now? Notice the indicator at the bottom — that's how you always know."

Socratic: "Which mode would you use if you wanted Claude to research something without changing any files?"

#### Exercise 2b.3 — /permissions (3 min)
"Try this now: type `/permissions`. This shows what Claude is currently allowed and denied."

**Developer path:** "You can allowlist specific commands so Claude doesn't ask every time. For example: allowing `Bash(npm test)` means Claude can run your tests without a permission prompt each time. Try adding one command you run frequently."

**PM / Non-technical path:** "The defaults are fine for now. As you use Claude more, you'll notice it asks permission for the same things repeatedly. When that happens, come back to /permissions and allowlist those actions."

#### Exercise 2b.4 — /doctor (2 min)
"Try this now: type `/doctor`. This runs diagnostics on your Claude Code installation — like a health check."

"If everything passes, great. If something's flagged, follow its suggestion to fix it. This is the first thing to run when something isn't working right."

#### Exercise 2b.5 — Personalization (2 min)
"Make Claude Code feel like yours:"
- "/theme changes your color scheme — try it. There are light, dark, and colorblind-accessible (daltonized) options."
- "/color sets the prompt bar color — useful later when you run multiple sessions."

"Try this now: pick a theme you like."

#### Exercise 2b.6 — Settings Hierarchy (2 min, brief)
"Settings exist at 4 levels. More specific beats more general:"

1. **Managed** — set by your organization (you can't override these)
2. **User** — your personal settings, all projects (`~/.claude/settings.json`)
3. **Project** — shared with your team (`.claude/settings.json`, committed to git)
4. **Local** — just you, just this repo (`.claude/settings.local.json`, not committed)

"For most people, User and Project are the only two that matter. Settings at lower levels merge with higher levels — they add to each other, not replace."

#### Exercise 2b.7 — DEVELOPER BRANCH: env Block & Timeouts (3 min)

**Developer path only. Non-technical and PM paths: skip this exercise.**

"Your `~/.claude/settings.json` has an `env` block where you can set environment variables — cleaner than putting them in your shell profile because they're scoped and version-controllable."

"The single most important one: `BASH_DEFAULT_TIMEOUT_MS` defaults to **120 seconds**. If you've ever had a build, test suite, or migration get killed mid-run — this is why."

"Try this now: open your settings and add this to the env block:"
```json
{
  "env": {
    "BASH_DEFAULT_TIMEOUT_MS": "1800000"
  }
}
```
"That's 30 minutes. Other useful ones:"
- `BASH_MAX_OUTPUT_LENGTH`: "30000" default — raise if you need full build logs
- `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE`: "80" — compact at 80% instead of the default 95%

#### Module 2b Completion

**Capability statement:** "You can control Claude's permission behavior with Shift+Tab, diagnose issues with /doctor, and personalize your environment."

**Competency check:** "Show me how to switch to Plan Mode right now."

Expected: Shift+Tab until "plan" appears, or type `/plan`.

Update progress.json: mark module_2b as `"complete"`.

"Module 2b complete. Next up: Module 3 — Context Mastery. This is the single most important skill in Claude Code. It's what separates beginners from power users. It's a longer module (~50 min) with a break point in the middle. Ready?"

---

