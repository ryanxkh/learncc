### WHAT'S NEW PATCH 1.7 (12-20 min, role-adapted)

**Purpose:** Catch graduates up on Claude Code features that shipped after they finished the course. This is NOT a new module — it's a focused patch covering only the deltas that change daily workflow.

**When to load this:** ONLY when the learner has `course_version_completed` set in progress.json AND `"1.7"` is NOT in their `patches_completed` array. Confirm before loading: "You finished the course at version [X]. A handful of useful things shipped since — want a quick walkthrough? About 12 minutes for you, focused on what actually changes your daily flow." If they decline, do NOT load this file.

**Time budget:**
- Non-technical path: ~12 min (skip exercises marked DEV)
- PM path: ~15 min (skip DEV-only exercises)
- Developer path: ~20 min (everything)

**Tone:** Treat them as a returning peer, not a new learner. Skip mental-model setup. Lead with "here's what changed and why it matters to you." Reference content from prior modules by name when relevant — they completed the course, so they have the foundation.

**Caveat to deliver upfront:**
"Some of these features may have shipped while you were originally taking the course — Claude Code releases fast. I'll cover them either way so you're current."

---

#### Patch 1.7.1 — /usage replaces /cost (1 min, all paths)

"Quick housekeeping: `/cost` and `/stats` are now tabs inside `/usage`. The shortcuts still work, but `/usage` is the canonical home for tokens, cost, and daily streaks."

"Try this now: type `/usage`. Notice the tabbed view."

#### Patch 1.7.2 — /recap: returning to a session (3 min, all paths) ★ HIGH VALUE

"Why this matters: when you come back to a session after a few hours (or a few days), you used to have to re-read your own conversation to remember where you were. Now Claude does it for you."

"Try this now: type `/recap`. Claude will summarize what happened in this session and where you left off."

"You can also configure recap to auto-fire when you reopen a session. Type `/config` and look under session settings."

Role-adapted framing:
- Developer: "Especially useful when you have multiple branches/PRs in flight and switch between them daily."
- PM: "Especially useful when a project spans multiple sessions over a week — you don't have to scroll back to remember which decisions you already made."
- Non-technical: "Especially useful if you take a break for a day or two and want to pick up where you left off without re-reading the whole conversation."

Pro tip: "Pairs perfectly with `/rename` (Module 3) — named sessions are easier to find, and `/recap` makes them faster to re-enter."

#### Patch 1.7.3 — /less-permission-prompts (3 min, all paths) ★ HIGH VALUE

"Why this matters: in Module 2b you learned about /permissions for allowlisting commands. The friction was that you had to know which commands to allowlist. Now there's a built-in skill that figures it out for you."

"Try this now: type `/less-permission-prompts`."

"This scans your recent session history, finds the read-only commands Claude has been asking you about repeatedly, and proposes an allowlist for `.claude/settings.json`. Review the proposal — it'll tell you exactly what it's adding and why."

Role-adapted:
- Developer: "Best run after a real working session where you've approved 10+ prompts. The skill clusters by tool type so you get sensible groupings."
- PM: "If you've been seeing the same permission prompts over and over while doing research or analysis, this will quiet most of them in one shot."
- Non-technical: "This is the single best fix for permission-prompt fatigue. If approving things has felt repetitive, run this. Just review what it suggests before accepting."

#### Patch 1.7.4 — /resume now defaults to current directory (1 min, all paths)

"Quick UX change: `claude --resume` and `/resume` used to show every session across every directory. Now they default to sessions in your current folder, which is usually what you want. To see all sessions across all directories, press **Ctrl+A** in the picker."

"No exercise needed — just know about Ctrl+A when the list looks shorter than expected."

#### Patch 1.7.5 — Effort defaults raised + interactive slider (2 min, all paths)

"In Module 3 we covered `/effort`. Two things changed:"

1. "Default level is now `high` for most plans (was `medium`). Anthropic raised the floor because higher effort produced noticeably better results in user testing. You'll see the difference in everyday work — Claude is doing more reasoning by default."
2. "There's a new top rung called `xhigh`, which is the default for Opus 4.7 (and the next exercise). On other models, `xhigh` falls back to `high`."
3. "`/effort` now opens an interactive slider rather than taking a level argument inline. Try it: `/effort` and drag."

"The full ladder, from light to heavy: low → medium → high → xhigh → max."

#### Patch 1.7.6 — Opus 4.7 with 1M context (3 min, all paths)

"Why this matters: in Module 3 you learned that context is finite and degrades quality as it fills. Opus 4.7 has a 1 million token context window — roughly 5x what Opus 4.6 had. For most users, 'context full' is no longer a daily concern."

"Try this now: type `/model` and switch to Opus 4.7 if it's available on your plan."

Role-adapted:
- Developer: "You can now load entire codebases or whole monorepos via `@` references without compaction. The verification patterns from Module 4 still apply — bigger context doesn't replace good prompts. But you can be less disciplined about /compact."
- PM: "You can dump entire research folders, multi-document analyses, or the full history of a long project into one session without losing fidelity. The interview pattern from Module 4 gets even better with this much context."
- Non-technical: "If you've been hitting context limits when working with longer documents or multiple files, Opus 4.7 mostly removes that problem. Worth switching to for heavier sessions."

"Important: Opus 4.7 also carries context across sessions in some cases — meaning your conversation can continue across day-to-day work without you having to re-paste background. /recap (above) leans on this."

#### Patch 1.7.7 — Auto mode is no longer flagged (1 min, all paths)

"Heads up on permission modes (Module 2b). The `--enable-auto-mode` flag is gone. Auto mode is now a standard option in the Shift+Tab cycle for Max subscribers on Opus 4.7, and available to all users on other models. No flags, no setup — just cycle to it."

"No exercise — just know it exists when you reach for it."

#### Patch 1.7.8 — /vim retired (30 sec, all paths)

"The `/vim` command was removed. If you used vim mode for input editing, it's now configured under `/config → Editor mode`. If you didn't, ignore this."

#### Patch 1.7.9 — /ultrareview (3 min, DEVELOPER PATH ONLY)

"Skip this if you're not on the developer path."

"In Module 4 you learned `/security-review` for security audits. There's a heavier sibling: `/ultrareview`. It runs a parallel multi-agent code review in the cloud — broader coverage than /security-review, takes longer, billed per run. Best saved for high-stakes changes (releases, large refactors, sensitive surfaces)."

"Try this now: `/ultrareview` (no args) reviews your current branch. `/ultrareview <PR#>` reviews a specific GitHub PR."

"Rule of thumb: /security-review for routine pre-merge checks, /ultrareview for the changes you'd ask a senior engineer to review if you had one available."

#### Patch 1.7.10 — Hook updates (2 min, DEVELOPER PATH ONLY)

"Skip this if you're not on the developer path."

"Two additions to the hooks system from Module 5b:"
- "**`PreCompact` event** — hooks can fire before compaction, and can block it. Useful if you have context you need preserved unconditionally."
- "**`mcp_tool` action type** — hooks can now invoke MCP tools directly, not just shell commands. This significantly broadens what hooks can do (e.g., post to Linear, query a database, write to Notion) without spawning a process."

"No exercise — file these for when you next reach for hooks."

---

#### Patch Completion

**Capability statement (role-adapted):**
- Developer: "You're current on /usage, /recap, /less-permission-prompts, the new effort defaults, Opus 4.7, and the new hooks/review tooling. Your existing workflows from Modules 1-7 still apply — these slot in alongside them."
- PM: "You're current on /usage, /recap, /less-permission-prompts, and Opus 4.7 — the four features that change daily flow most. Your CLAUDE.md and skills from earlier modules carry forward unchanged."
- Non-technical: "You're caught up. The biggest things to remember: /recap when you come back, /less-permission-prompts when you're tired of approving things, and /usage instead of /cost. Everything you built in earlier modules still works the same way."

**No competency check.** Graduates have already proven the underlying patterns — this patch was about awareness, not mastery.

**Update progress.json:**
1. Add `"1.7"` to the `patches_completed` array (read-modify-write).
2. Set `course_version_completed` to current plugin version if not already set.

"You're up to date. When new features ship, you'll see a notice like the one that brought you here, and we can do this again. Otherwise, /release-notes is the raw changelog anytime."

"Stop tutoring now. Respond normally as Claude Code going forward."

---
