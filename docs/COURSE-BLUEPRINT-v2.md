# LearnCC: Course Blueprint v2

> The single source of truth for all module content, exercise sequences, role branching, and session guards.

---

## 1. Design Philosophy

### Pedagogical Foundations
1. **Do-before-explain** — every concept starts with a challenge, not a lecture
2. **1:4 ratio** — 1 min explanation : 3-5 min doing
3. **Problem-oriented** — "accomplish X" not "learn about X"
4. **Fading scaffolding** — heavy guidance early, minimal by Module 6+
5. **Socratic assessment** — "why did that work?" not quizzes
6. **Respect the adult** — senior colleague, never teacher. Skip what they can demonstrate
7. **Spaced retrieval** — each module opens with recall of prior concepts

### Narrative Throughline: "Build Your Workspace"
Every module adds to the learner's actual Claude Code environment. By the end they have: a tuned CLAUDE.md, custom skills, configured permissions, and a workflow tailored to their real work.

### Three Role Paths
| Path | Audience | Key Adaptations |
|------|----------|-----------------|
| **Developer** | Engineers, CS students | Show config files, assume terminal fluency, emphasize hooks/worktrees/headless |
| **PM / Product** | Product managers, analysts, designers | PRD/research/analysis scenarios, "ask Claude to create" for configs, Plan Mode emphasis |
| **Non-Technical** | Ops managers, writers, marketers, general | ALWAYS "ask Claude to create", /voice as primary input, skip piping/JSON/worktrees |

Role is identified in Module 0 and stored in progress.json. Exercises branch explicitly — not inferred.

---

## 2. Architecture: Option C Course Runner

### Format
One system prompt file (`learncc-runner.md`) containing:
- Orchestrator logic (session lifecycle, routing, progress tracking)
- All module content inline (exercises, role branches, session guards)
- Role adaptation rules

### How a User Starts
```bash
claude --append-system-prompt-file ./learncc-runner.md
```
Or: paste into a Claude Code session. Or: use in Desktop/Web as system prompt.

### Progress Tracking
State persisted to `~/.claude/learncc/progress.json`:
```json
{
  "version": 1,
  "learner": {
    "role": "pm",
    "domain": "b2b saas",
    "experience": "beginner",
    "surface": "cli"
  },
  "progress": {
    "module_0": { "status": "complete" },
    "module_1": { "status": "in_progress", "last_exercise": 4 }
  },
  "parking_lot": []
}
```
Written at EVERY exercise completion (not just module boundaries).

### Session Resumption
On start: read progress.json → greet by context → state where they left off → quick retrieval question → resume from last_exercise + 1. NEVER re-teach completed content.

---

## 3. Session Guards

### Anti-Drift (Every Module)
- **Scope Fence:** Stay in current module only. Future-module questions → parking lot
- **Brevity:** 300-word cap on explanations. 2-example max. "Got it" = move on
- **Next message after explanation MUST be a practice prompt**
- **Stuck Detection:** 3+ exchanges without progress → hint or move on
- **Exercise Time Caps:** Drift-risk exercises get hard limits (Plan Mode: 12 min, Interview: 10 min, hooks: 20 min)

### Tangent Protocol
- Future module question → "Noted — we cover that in Module N." Add to parking lot
- Previous module question → 1-sentence reminder, then back on track
- Off-course question → 1-sentence answer, then back on track
- Clarifying question about current exercise → answer fully

### Parking Lot
Out-of-scope questions saved to progress.json `parking_lot` array. At start of relevant module: "You asked earlier about X — we're covering that now." Validates the learner, prevents drift, triggers spaced retrieval.

### Break Points
| Module | Time | Break At | Hard Stop |
|--------|------|----------|-----------|
| 3 | 50 min | 30 min | 55 min |
| 6b | 50 min | 25 min | 55 min |
| 7 | 45-60 min | 30 min | 60 min |

All other modules are under 45 min (within research-backed adult attention span).

### Module Completion Signal (Every Module)
1. State what the learner can now DO (not what they learned)
2. Socratic competency verification question
3. Update progress.json
4. Preview next module

---

## 4. Module Structure Overview

| # | Module | Time | Scaffolding | Primary Archetype |
|---|--------|------|-------------|-------------------|
| 0 | Orientation + Surfaces | 10 min | — | Diagnostic |
| 0.5 | Terminal Basics | 17 min | Heavy | Guided (non-technical only) |
| 1 | First Contact + /voice | 30 min | Heavy | Guided Execution |
| 2a | CLAUDE.md & Memory | 40 min | Heavy → Medium | Guided → Constrained |
| 2b | Settings & Permissions | 20 min | Medium | Guided (dev branches) |
| 3 | Context Mastery | 50 min | Medium | Constrained Problem |
| 4 | Plan & Verify | 45 min | Medium | Constrained Problem |
| 5a | Skills & Plugins | 40 min | Medium → Light | Constrained |
| 5b | Hooks & Subagents | 40 min | Light | Constrained → Open |
| 6a | Parallel Work | 40 min | Light | Open-Ended |
| 6b | Integrations & Automation | 50 min | Light | Open-Ended (dev branches) |
| 7 | The Meta Game | 45-60 min | Minimal | Open-Ended Build |

Total: ~7-8 hours full path. ~5 hours with routing/skipping.

---

## 5. Module Details

### Module 0: Orientation + Surfaces (10 min)

**Purpose:** Assess the learner, show them their options, route them.

**Constraint:** ONLY collect profile and route. No teaching.

**Exercise Sequence:**
1. Ask role, domain, daily tools
2. Ask CC experience level (never / dabbled / daily)
3. If never-used-terminal → skip competency check, route to Module 0.5
4. Competency check (warm framing: "It's totally fine to say 'I don't know'"):
   - "What would you do if Claude's responses got worse mid-conversation?"
   - "How would you make Claude follow a rule every time?"
   - "What's the difference between /clear and /compact?"
5. Surfaces overview: "Claude Code runs on CLI, Desktop app, Web (claude.ai/code), and VS Code. Based on what you told me, [surface recommendation]."
6. Route:

| Correct Answers | Route To | Bridge |
|-----------------|----------|--------|
| Never used terminal | Module 0.5 | — |
| 0 of 3 | Module 1 | — |
| 1 of 3 | Module 1 (abbreviated) | Skip exercises they demonstrated |
| 2 of 3 | Module 2a | Brief /compact explanation |
| 3 of 3 | Module 4 | Quick reference card for Modules 2-3 |
| Self-ID power user | Module 5 | — |

**Completion:** "Based on your answers, I'm starting you at Module [N]. Here's what we'll cover and why."

---

### Module 0.5: Terminal Basics (17 min, non-technical only)

**Purpose:** Remove the terminal-literacy blocker. Not a terminal course — just enough to use CC.

**Constraint:** Cover exactly these 7 topics, nothing more. If learner asks about commands beyond these, say "You won't need that for Claude Code."

**Exercise Sequence:**
1. **What is a terminal?** (2 min) "It's where you type commands instead of clicking. Think of it as texting your computer."
2. **Anatomy of the prompt** (2 min) — `~` = home folder, `%` or `$` = waiting for input, blinking cursor
3. **How input works** (5 min) — Enter SENDS (unlike email/Word). Arrow keys browse history. Ctrl+C = cancel (NOT copy!). Copy = Cmd+V (Mac) or Ctrl+Shift+V
4. **Files and folders** (3 min) — directories, paths use `/`, `~` = home folder, `.` = current, `..` = parent. Files starting with `.` are hidden
5. **Keyboard shortcuts cheat sheet** (1 min) — Ctrl+C cancel, Ctrl+D exit, Ctrl+L clear screen, Tab autocomplete, Esc stop Claude
6. **Command flags** (2 min) — `--flagname` is an option. `claude --continue` = "start Claude AND continue where I left off." Don't memorize flags — the course tells you what to type
7. **Where are my files?** (2 min) — Claude sees LOCAL files only, not network drives or cloud storage. If files are on a shared drive, copy them locally first

**Completion:** "You know enough about the terminal to use Claude Code. Everything else, Claude can help you with."

---

### Module 1: First Contact + /voice (30 min)

**Purpose:** First productive conversation. Establish the mental model.

**Constraint:** After Exercise 1, redirect learner back to sequence. If they want to continue working: "Great start — let me show you controls that will make everything better."

**Opening Retrieval:** None (first module).

**Exercise Sequence:**

**Exercise 1 — DO FIRST** (5-7 min, capped)
"Tell Claude Code about a real problem you're working on right now. Don't overthink it — describe it like you'd tell a colleague."
- Dev: a bug, a feature, a refactor
- PM: a PRD, a research question, a decision
- Non-technical: a report, a task, a document

**Exercise 1b — /voice for non-technical profiles** (3 min)
Immediately after Exercise 1: "Before we continue — there's a faster way to talk to Claude. Type `/voice` to enable voice input, then hold Space and speak your next prompt. Try it now."
(Developer path: mention as sidebar. "You can also use /voice to dictate. Hold Space to record.")

**Exercise 2 — Reflect** (2 min)
"What surprised you about Claude's response?"

**Exercise 3 — Mental model** (2 min, max 300 words)
CC is a collaborator that can DO things on your computer. Not a search engine, not autocomplete. Your job: clear goals + good context.

**Exercise 4 — /help** (3 min)
"Type /help. The tutor highlights 3 commands most relevant to the learner's role." Don't let learner get lost in the full list.

**Exercise 5 — Specificity comparison** (5 min)
"Type /clear. Now describe the SAME problem but with specific details — names, file paths, constraints, expected outcomes. Compare the quality."
- Dev: include file names, test expectations, framework details
- PM: include stakeholders, template structure, success criteria
- Non-technical: include document names, format requirements, recipients

**Exercise 6 — The ! prefix** (2 min)
"Try `! date` — this runs a command on YOUR computer without Claude."
- Dev path: "Try `! ls` to see your project files, or `! git status`"
- Non-technical: "You probably won't use this often, but it's there if you need it"

**Exercise 7 — Emergency brake** (2 min)
"Ask Claude something, then press Esc mid-response. Notice: context is preserved. This is your undo button."

**Exercise 8 — /cost** (1 min)
"Type /cost. Tokens are roughly words. This shows your session usage."

**Exercise 9 — Multiline input** (2 min)
"Your prompts can have multiple lines. Press `\` then Enter to add a new line without sending. Try writing a 3-line prompt."

**Exercise 10 — Essential controls** (1 min)
"Three shortcuts: Ctrl+C cancels. Ctrl+D exits. Ctrl+L clears screen clutter (your conversation stays). In the terminal, Ctrl+C is NOT copy."

**Completion signal:** "You can now have a productive conversation, use /help to discover commands, /clear to reset, Esc to stop, and voice to dictate. Specificity drives quality."

**Competency check:** "If Claude's responses started getting worse during a long conversation, what would you try?"

---

### Module 2a: CLAUDE.md & Memory (40 min)

**Purpose:** Set up the learner's workspace foundation.

**Constraint:** Limit CLAUDE.md to TWO passes (draft + refine). Do NOT let creation consume more than 20 min.

**Opening Retrieval:** "What did you learn about specificity in Module 1? Why does it matter?"

**Exercise Sequence:**

**Exercise 1 — /init** (8 min)
"Type /init. Claude will scan your project and generate a starter CLAUDE.md. Read what it produced."
- Non-technical: "If /init generated code-focused rules, that's fine — we'll replace them with rules for YOUR work."
- If no project directory: "First, let's create a workspace: tell Claude 'Create a folder called my-workspace and move into it.'"

**Exercise 2 — Critique** (5 min)
"What did /init get right? What's missing? What doesn't apply to your work?"

**Exercise 3 — Best practices** (3 min, max 300 words)
- Under 200 lines (ideally under 100)
- WHAT (your domain, tools, context), WHY (purpose), HOW (commands, processes)
- Be specific: "Use MM/DD/YYYY format" not "Format dates properly"
- Use IMPORTANT or YOU MUST for critical rules — Claude follows these more reliably
- Don't include things Claude can figure out by reading your files
- Role-specific example (20-line starter):
  - Dev: tech stack, test commands, code style, build instructions
  - PM: team structure, templates, stakeholders, tools
  - Non-technical: file locations, formats, preferences, common tasks

**Exercise 4 — Rewrite** (7 min)
"Rewrite your CLAUDE.md applying these principles. For each line, ask: 'Would removing this cause Claude to make mistakes?' If not, cut it."

**Exercise 5 — Memory system** (3 min)
"Two systems: CLAUDE.md (you write instructions) vs auto memory (Claude writes notes to itself). Type /memory to see what Claude remembers."
Analogy: "CLAUDE.md = your onboarding doc for a new hire. Memory = that new hire's personal notes."

**Exercise 6 — @import** (3 min)
"You can split instructions into multiple files. Put `@filename.md` in your CLAUDE.md to include another file."
- PM: "Create a prd-template.md, then add `@prd-template.md` to your CLAUDE.md"
- Dev: "Import your code style guide or architecture doc"
- Non-technical: "Import a checklist or reference document you use often"
- Bridge: "Tell Claude: 'Create a [template/reference] file and add an @import for it to my CLAUDE.md.'"

**Exercise 7 — .claude/rules/** (2 min, brief mention)
"For larger projects, you can split rules into `.claude/rules/` directory files. Each can target specific file paths. We won't set this up now — just know it exists."

**Completion signal:** "You have a working CLAUDE.md tailored to your work. You understand auto memory and @imports."

**Competency check:** "What's the difference between your CLAUDE.md and auto memory? When would you edit one vs. the other?"

---

### Module 2b: Settings & Permissions (20 min)

**Purpose:** Understand permission controls and basic configuration.

**Constraint:** Settings is reference, not mastery. Cover the Shift+Tab cycle, the concept of scopes, one practical permission rule. Don't enumerate all settings.

**Opening Retrieval:** "Where does your CLAUDE.md live? What scope is it in?"

**Exercise Sequence:**

**Exercise 1 — /config and /status** (3 min)
"Type /config to see settings. Type /status to see what's active and where it comes from."

**Exercise 2 — Permission modes** (5 min)
"Press Shift+Tab. Notice the mode changes. The cycle is: default → acceptEdits → plan → auto."
- **default:** Claude asks before doing anything
- **acceptEdits:** Claude edits files without asking (faster)
- **plan:** Claude only researches and plans, no changes (safest)
- **auto:** A separate classifier reviews each action (Team plan required)
"Try cycling through them now. Which mode are you in?"

**Exercise 3 — /permissions** (3 min)
"Type /permissions. You can allowlist specific commands so Claude doesn't ask every time."
- Dev: "Allow `Bash(npm test)` and `Bash(npm run build)`"
- PM/Non-technical: "For now, the defaults are fine. You can adjust later."

**Exercise 4 — /doctor** (2 min)
"Type /doctor. This diagnoses your Claude Code setup. Fix anything it flags."

**Exercise 5 — Personalization** (2 min)
"/theme changes your color scheme. /color sets the prompt bar color. Make it yours."

**Exercise 6 — Settings hierarchy** (2 min, brief)
"Settings exist at 4 levels: Managed (org) > User (you, everywhere) > Project (team) > Local (you, this repo). More specific wins. You mostly only need User and Project."

**Exercise 7 — DEVELOPER BRANCH: env block + timeouts** (3 min)
"Your settings.json has an `env` block for environment variables — cleaner than shell exports. The most important one: `BASH_DEFAULT_TIMEOUT_MS` defaults to 120 seconds. If your builds time out, raise it."
```json
{ "env": { "BASH_DEFAULT_TIMEOUT_MS": "1800000" } }
```
(Non-technical path: skip this exercise entirely.)

**Completion signal:** "You can control Claude's permission behavior and know where settings live."

**Competency check:** "Show me how to switch to Plan Mode right now."

---

### Module 3: Context Mastery (50 min)

**Purpose:** The single highest-leverage skill in Claude Code.

**Constraint:** 11 exercises, none exceeding 7 min. Force checkpoint at 45 min.

**Opening Retrieval:** "Where does your CLAUDE.md live, and what's the difference between it and auto memory?"

**BREAK POINT at 30 min** (after Exercise 6): "Good stopping point. We've covered the most important context skills. Take a break if needed."

**Exercise Sequence:**

**Exercise 1 — /context first** (2 min)
"Type /context. This shows your context window — how full it is, what's using space, and optimization suggestions. Think of it as a fuel gauge."

**Exercise 2 — Experience degradation** (5 min)
"Have 5-6 back-and-forths on a topic, then ask something unrelated. Notice any quality change."
(Caveat: "You might not see degradation in a short conversation. It shows up after 15+ exchanges or large file loads.")

**Exercise 3 — The concept** (2 min, max 300 words)
"Context is finite. As it fills, Claude gets worse. Community users report noticeable precision drops around 70%, with more issues above 85%. These are rough thresholds, not official metrics — but the pattern is real. Run /context to see where you are."

**Exercise 4 — /compact** (5 min)
"Type `/compact`. Your conversation history compresses. Now try: `/compact Focus on [your main topic], discard the rest`. Notice how targeted instructions control what survives."
Power tip: "Add a `# Compact instructions` section to your CLAUDE.md to guide auto-compaction behavior."

**Exercise 5 — /btw** (5 min)
"Type `/btw [quick question]`. The answer appears in an overlay and disappears — it never enters your conversation history."
Key detail: "/btw works WHILE Claude is already processing a response. You don't have to wait."
- PM: "/btw What's the market size for CSV export tools?"
- Dev: "/btw What's the syntax for Array.flatMap?"
- Non-technical: "/btw What's the OSHA requirement for scaffold inspections?"

**Exercise 6 — Practice /btw** (2 min)
"Ask Claude something complex. While it's working, type /btw with a side question. Notice it doesn't interrupt."

--- BREAK POINT ---

**Exercise 7 — Session management** (5 min)
- "/rename [descriptive name]" — name your sessions for easy retrieval
- "Exit with Ctrl+D or /exit. Resume with `claude --continue` (most recent) or `claude --resume` (picker)"
- "Esc+Esc opens the rewind menu — restore conversation, code, or both to any checkpoint"
Practice: "Name this session with /rename. Exit. Resume with --continue."

**Exercise 8 — @ file references** (5 min)
"Point Claude at specific files with @. This adds their content precisely."
- PM: "`@meeting-notes.md` summarize and create action items"
- Dev: "`@src/auth.ts` explain how authentication works here"
- Non-technical: "`@budget.csv` what's the total spend for Q2?"
"You can reference multiple files: `@file1 and @file2`"
Note: "Claude sees LOCAL files only. Network drives and cloud docs need MCP (Module 6b)."

**Exercise 9 — Piping (OPTIONAL)** (3 min)
DEVELOPER PATH: "Pipe data directly into Claude: `git diff | claude -p 'review for bugs'` or `cat error.log | claude 'explain this error'`"
NON-TECHNICAL PATH: Skip. "@ references do the same job. Piping is a power-user shortcut we can skip."

**Exercise 10 — /effort and extended thinking** (3 min)
"/effort controls how hard Claude thinks. Try `/effort max` and ask a complex question. Compare with `/effort low`."
"Option+T (Mac) / Alt+T toggles thinking on/off. Use high effort for complex analysis, low for quick tasks."

**Exercise 11 — Utility commands** (3 min)
- "/copy copies Claude's last response. /copy 3 gets three back. Press 'w' in the picker to write to file"
- "/export saves the whole conversation as a file"
- "Ctrl+O toggles transcript view. Press / to search within it"

**Completion signal:** "You can manage context proactively (/compact, /clear, /btw), navigate sessions, reference files, and control thinking depth."

**Competency check:** "You're 30 minutes into a conversation and Claude's getting vague. Walk me through what you'd do."

---

### Module 4: Plan & Verify (45 min)

**Purpose:** The workflows power users swear by.

**Constraint:** Time caps: Plan Mode practice 12 min, verification 8 min, interview 10 min.

**Opening Retrieval:** "Without looking — what's /compact do? When would you use /btw vs /clear?"

**Exercise Sequence:**

**Exercise 1 — DO FIRST: No planning** (5 min)
"Think of a multi-step task from your work. Ask Claude to do it directly — no planning."
- Dev: "Refactor this module into separate files, add tests, update imports"
- PM: "Create a competitive analysis of 5 tools with pricing, features, and recommendations"
- Non-technical: "Compare three vendor contracts on pricing, terms, and performance"

**Exercise 2 — Reflect** (2 min)
"Did Claude nail it? Where did it diverge from what you wanted?"

**Exercise 3 — Plan Mode** (5 min concept + 12 min practice)
"Press Shift+Tab until you see 'plan'. In Plan Mode, Claude researches and proposes — but doesn't change anything."
- "Go back and forth 2-3 times to refine the plan"
- "Ctrl+G opens the plan in your text editor for direct annotation"
  - WARNING: "First check your editor: `! echo $EDITOR`. If it says 'vim' or is empty, set it: `export EDITOR='open -t'` (Mac) or `export EDITOR='notepad'` (Windows)"
- "When you accept, Claude offers to clear planning context for clean implementation. Usually say yes."

**Exercise 4 — Compare** (3 min)
"Take the SAME task. This time use Plan Mode. Compare the result."

**Exercise 5 — Verification Loop** (2 min concept + 8 min practice)
"Give Claude a way to check its own work. This 2-3x's output quality."
- Dev: "After implementing, run `npm test` and fix any failures"
- PM: "After creating the analysis, verify each competitor's pricing by checking their website"
- Non-technical: "After generating the report, check that every section has data and flag anything missing"
Practice: "Redo your task with an explicit verification instruction. Compare quality."

**Exercise 6 — "Interview Me" pattern** (2 min concept + 10 min practice)
"Say: 'I want to [accomplish X]. Interview me — ask 5-10 clarifying questions before you start.' Claude asks about edge cases, tradeoffs, and things you haven't considered. Review the resulting spec."

**Exercise 7 — /plan and /diff** (3 min)
- "/plan enters plan mode directly (alternative to Shift+Tab)"
- "/diff shows an interactive diff viewer — what changed, turn by turn"
- DEVELOPER BRANCH: "/pr-comments pulls GitHub PR feedback as context. /security-review audits for vulnerabilities."

**Completion signal:** "You can use Plan Mode for multi-step tasks, verification loops for quality, and the interview pattern for scoping."

**Competency check:** "You have a new complex task. Walk me through your approach from start to finish."

---

### Module 5a: Skills & Plugins (40 min)

**Purpose:** Add reusable capabilities to your workspace.

**Constraint:** Create ONE skill and install ONE plugin. Not two. Not five. Time caps: skill 15 min, plugin 10 min.

**Opening Retrieval:** "Walk me through how you'd approach a multi-step task now."

**Exercise Sequence:**

**Exercise 1 — Framework** (3 min)
Four ways to extend Claude Code:
- **Skills** = on-demand expertise (loaded when triggered, like calling a specialist)
- **Hooks** = automatic actions (always run, like safety systems)
- **Subagents** = parallel workers (separate context, like delegation)
- **Plugins** = community extensions (pre-built packages from a marketplace)
"Today we focus on Skills and Plugins. Hooks and Subagents are next module."

**Exercise 2 — Create a skill** (15 min)
"What's something you do repeatedly that Claude could help with?"
Role-specific suggestions:
- Dev: code review checklist, test generation, PR description writer
- PM: PRD from template, competitive analysis, sprint summary
- Non-technical: weekly report generator, document formatter, checklist runner

Bridge: "Tell Claude: 'Create a skill called [name] that [does what you want]. Save it to .claude/skills/.'" Claude creates the file.

"Now invoke it: type /[skill-name]. Watch it work."

**Exercise 3 — Understand the skill file** (3 min)
"Ask Claude to show you the skill file it created. Notice: the `---` section at top is metadata (name, description). Everything below is instructions in plain English. You can edit this anytime."

**Exercise 4 — Plugins & marketplace** (10 min)
"Type /plugin. Browse the Discover tab."
- Dev: look for language-specific LSP plugins (TypeScript, Python, Go, Rust)
- PM: look for Linear, Notion, Jira, or Figma plugins
- Non-technical: browse what's available, install anything interesting
"Install one plugin relevant to your work. Try it."

**Exercise 5 — Management commands** (2 min)
"/skills lists your skills. /plugin shows installed plugins. /reload-plugins refreshes without restarting."

**Completion signal:** "You have a working skill and discovered the plugin ecosystem."

**Competency check:** "Invoke your skill right now and show me it works."

---

### Module 5b: Hooks & Subagents (40 min)

**Purpose:** Automate behavior and delegate work.

**Constraint:** Hooks are the highest quit-risk moment. Non-technical path: skip hooks, focus on subagents only. Developer path: create ONE hook with copy-paste template. Max 20 min on hooks, 20 min on subagents.

**Opening Retrieval:** "What's the difference between a skill and a plugin?"

**Exercise Sequence:**

**Exercise 1 — Hooks concept** (3 min)
"Hooks are automatic actions that run every time a specific thing happens. Unlike CLAUDE.md rules (which Claude follows most of the time), hooks ALWAYS run."
- Analogy: "Smoke detectors check for smoke constantly. You don't tell them to."

NON-TECHNICAL PATH: "Hooks are powerful but require configuration. For now, know they exist — you or someone on your team can set them up later. Let's skip to subagents, which you can use right away." → Jump to Exercise 5.

**Exercise 2 — DEVELOPER PATH: Create a hook** (12 min)
"Tell Claude: 'Create a PostToolUse hook that runs [your formatter/linter] after every file edit. Add it to my settings.json.'"
Claude creates the hook configuration. The learner verifies it fires.

Alternatively, provide copy-paste template:
```json
{
  "hooks": {
    "PostToolUse": [{
      "matcher": "Write|Edit",
      "hooks": [{ "type": "command", "command": "npx prettier --write \"$CLAUDE_FILE_PATH\"" }]
    }]
  }
}
```

**Exercise 3 — DEVELOPER PATH: Hook features** (5 min)
"Four handler types: command (run a script), http (call a webhook), prompt (ask Claude to evaluate), agent (spawn a subagent to decide)."
Power features:
- `updatedInput` — modify what Claude does before it does it (e.g., force --dry-run)
- `suppressOutput` — inject context Claude sees but the user doesn't
- `async: true` — fire-and-forget (don't block)
- `once: true` — run only once per session

**Exercise 4 — DEVELOPER PATH: Verify** (2 min)
"Type /hooks to see your configured hooks. Trigger your hook by editing a file. Confirm it ran."

**Exercise 5 — Subagents concept** (3 min)
"Subagents are Claude instances that work in their OWN context window. The #1 reason to use them: they don't pollute your main conversation."
- Analogy: "Sending a team member to research something while you keep working."
Built-in subagents: Explore (fast, read-only), Plan (research only), General-purpose (full tools).

**Exercise 6 — Use a built-in subagent** (5 min)
"Say: 'Use a subagent to [investigate/research/explore] [topic].' Notice: the research happens in a separate context. Only the summary comes back to you."

**Exercise 7 — Create a custom subagent** (7 min)
"Tell Claude: 'Create a subagent called [name] that [does what]. Give it [read-only / full] access. Save it to .claude/agents/.'"
- Dev: code reviewer with read-only access
- PM: research analyst, fact-checker
- Non-technical: document reviewer, proofreader

**Exercise 8 — Context isolation demo** (3 min)
"Ask your subagent to read 5-6 files and summarize them. Then check /context on your main conversation. Notice: your context didn't grow. The subagent did the heavy lifting in its own window."

**Completion signal:** "You understand hooks (automatic) and subagents (delegated). You've set up at least one."

**Competency check:** "What's the key difference between a hook and a skill? When would you use each?"

---

### Module 6a: Parallel Work (40 min)

**Purpose:** Work on multiple things simultaneously.

**Constraint:** Git worktrees are DEVELOPER-ONLY. Non-technical path: parallel terminal tabs only (~25 min).

**Opening Retrieval:** "What's the difference between a skill, a hook, and a subagent?"

**Exercise Sequence:**

**Exercise 1 — Parallel sessions concept** (3 min)
"You can run multiple Claude sessions simultaneously. Each has its own independent context — like having multiple assistants working on different things."
"Open a new terminal window (Cmd+N on Mac, Ctrl+Shift+N on Linux/Windows)."

**Exercise 2 — /branch** (5 min)
"Type /branch. This forks your current conversation — you now have two versions from the same starting point."
"Explore approach A in one branch, approach B in the other. Compare."

**Exercise 3 — DEVELOPER BRANCH: Git worktrees** (10 min)
"`claude --worktree feature-name` creates an isolated copy of your repo on a new branch."
"Try it: `claude -w experiment`. Do some work. Exit. The worktree auto-cleans if you made no changes."
Tip: "Add `.claude/worktrees/` to your .gitignore. Use `.worktreeinclude` to copy .env files to worktrees."
Rule: "NEVER parallelize the same problem space. Two Claude instances on overlapping files = confusion."

**Exercise 4 — /color** (2 min)
"/color blue in one session, /color green in another. Visual distinction when you have multiple windows."

**Exercise 5 — Background work** (5 min)
"Ctrl+B backgrounds a running task. Ctrl+T shows your task list. Start a long task, press Ctrl+B, start a new conversation while it runs."

**Exercise 6 — Writer/Reviewer pattern** (10 min)
"Session A writes something. Session B reviews it from fresh context (no bias from writing it)."
- Dev: Session A writes code, Session B reviews for bugs
- PM: Session A writes the PRD, Session B reviews for completeness
- Non-technical: Session A drafts the report, Session B checks for errors
Practice: "Try it now with something real."

**Completion signal:** Developer: "You can run parallel sessions in worktrees with writer/reviewer." Non-technical: "You can run multiple sessions on different tasks."

**Competency check:** "Why is a fresh-context review better than self-review?"

---

### Module 6b: Integrations & Automation (50 min)

**Purpose:** Connect Claude to your tools and automate workflows.

**Constraint:** Connect ONE MCP server. Write ONE headless command. 5-min troubleshooting cap on MCP. Break at 25 min.

**Opening Retrieval:** "When would you use a subagent instead of doing the research yourself?"

**BREAK POINT at 25 min** (after Exercise 3): "Good stopping point. We've covered integrations. Next: automation."

**Exercise Sequence:**

**Exercise 1 — MCP concept** (3 min)
"MCP connects Claude to your other tools — Slack, GitHub, Notion, Linear, databases. Once connected, Claude can read from and write to those tools directly."
"If you installed a plugin for your tool in Module 5a, you may already have this."

**Exercise 2 — Connect an MCP server** (12 min)
- If learner's tool has a plugin: "You're already connected via your plugin."
- If not, try the guided path: `claude mcp add --transport http [name] [url]`
- Fallback: "If your tools don't have MCP servers yet, try the filesystem MCP for file organization, or skip this and revisit later."
- Non-technical: "If this requires an API key you don't have, ask an engineer. Setup takes them 5 minutes."
- 5-min troubleshooting cap: "If it doesn't work in 5 min, note it for later and move on."

**Exercise 3 — /sandbox** (5 min)
"Type /sandbox. This enables OS-level isolation — Claude's commands run in a sandbox. Reduces permission prompts by ~84%."

--- BREAK POINT ---

**Exercise 4 — Model selection** (5 min)
"Press Option+P (Mac) / Alt+P or type /model. Three tiers:"
- Opus: smartest, slowest, most expensive. Complex analysis, multi-step reasoning.
- Sonnet: balanced. Daily driver for most tasks.
- Haiku: fastest, cheapest. Quick questions, formatting, simple tasks.
"/fast toggles fast mode (2.5x speed, higher cost). Use Option+O to toggle."

**Exercise 5 — Headless mode** (8 min)
DEVELOPER PATH: "`claude -p 'query'` runs Claude non-interactively."
- `git diff | claude -p "review for bugs"` — pipe and process
- `--allowedTools "Read,Bash(npm test)"` — scope permissions for automation
- `--max-budget-usd 5.00` — hard cost cap
- `--bare` — skip hooks/plugins for maximum speed in CI
NON-TECHNICAL PATH: "`claude -p 'What day is January 1, 2030?'` runs Claude for a quick answer without starting a conversation. Useful for one-off questions."

**Exercise 6 — Scheduling** (5 min)
"/loop checks something on a recurring basis: `/loop 10m check if the deployment finished`"
"/schedule creates tasks that run even when Claude isn't open."
Practice: "Set up a simple /loop for something useful."

**Exercise 7 — Surfaces deep dive** (5 min)
Quick overview of what's unique to each surface:
- Desktop: live app preview, computer use, Dispatch (phone-to-desktop tasks), auto-worktrees
- Web: cloud infrastructure, mobile access, teleport to local
- VS Code: inline diffs, @-mentions with line ranges, graphical plugin manager
- CLI: status line, channels, agent teams, most slash commands
"/desktop continues your session in the Desktop app. /remote-control lets you steer from your phone."

**Completion signal:** "You can connect tools via MCP, choose the right model, and automate with headless mode and scheduling."

**Competency check:** "Give me a scenario where you'd use headless mode instead of interactive."

---

### Module 7: The Meta Game (45-60 min, expanded)

**Purpose:** Continuous improvement, hidden gems, compound workflows, forward path.

**Constraint:** Every concept → concrete action. No philosophy without practice. Force checkpoint at 55 min.

**Opening Retrieval:** "List the 5 Claude Code features that have changed how you work most."

**BREAK POINT at 30 min** (after Exercise 4): "Good pause point before the hidden gems tour."

**Exercise Sequence:**

**Exercise 1 — CLAUDE.md as living document** (7 min)
"Add a rule every time Claude makes a mistake. Prune every few weeks. The compound effect is real."
Practice: "Review your CLAUDE.md now. Add 2-3 rules from mistakes you've seen. Cut anything that's not pulling its weight."

**Exercise 2 — Prompt craft** (8 min)
Key patterns:
- Specificity: names, paths, constraints, expected outcomes
- Reference patterns: "Look at @existing-doc.md for the format, then create a new one following that structure"
- The three-attempt framework: first attempt = context building (often rough). Second = nuances. Third = workable. That's expected, not failure.
Practice: "Take a prompt you've used before. Rewrite it with these techniques. Compare."

**Exercise 3 — Built-in voice** (3 min)
"/voice enables push-to-talk. Hold Space, speak, release. 20 languages supported. This is built into Claude Code — no third-party tools needed."
Practice: "Dictate your next prompt. Notice how spoken prompts tend to be more detailed than typed ones."

**Exercise 4 — When NOT to use CC** (5 min)
"Delegate grunt work (boilerplate, data processing, formatting). Stay hands-on with core thinking (design decisions, strategy, critical analysis)."
- Student addition: "If you're a student, using CC for learning means understanding what it produces — not just submitting it. Use CC to explain concepts, check your work, and explore alternatives. Don't use it to bypass the thinking your assignments are designed to teach."
Practice: "Name one task you'll keep doing manually and one you'll delegate to Claude."

--- BREAK POINT ---

**Exercise 5 — Hidden gems tour** (15 min)
"Let's rapid-fire through features most users never discover. Try each one:"
1. `/btw` works while Claude is processing — try it now
2. `/context` shows optimization suggestions — run it and read the suggestions
3. `/copy 2 w` writes response #2 to a file (useful over SSH)
4. The `env` block in settings.json: cleaner than shell exports for env vars
5. PR status in your footer: color-coded (green/yellow/red) if you're on a branch with a PR
6. `--debug "api,hooks"` filters debug output by category. `!prefix` excludes
7. `CLAUDE_CODE_TASK_LIST_ID=myproject` shares a task list across sessions
8. Add `"$schema": "https://json.schemastore.org/claude-code-settings.json"` to settings.json for autocomplete
9. Settings auto-backup: 5 most recent copies kept silently. Your config is recoverable.
Role-branch additions:
- Dev: `--from-pr 123` resumes PR-linked sessions. `--bare` for CI scripts. Output styles ("Explanatory", "Learning")
- PM: `/insights` for usage analytics. `/stats` for session patterns. Output style "Explanatory" for educational mode
- Non-technical: `/stickers` exists. `/mobile` shows QR for phone app

**Exercise 6 — Compound workflow** (10 min)
"Put it all together. Take a real task from your work. Use Plan Mode to scope it, a skill to structure it, /btw for side lookups, verification to check quality, and /compact when context gets heavy."
Practice: "Do this now on something real. I'll observe and give feedback."

**Exercise 7 — /insights, /statusline, /release-notes** (3 min)
"/insights shows how you've been using Claude. /statusline customizes your info bar. /release-notes shows what's new — check it after updates."

**Exercise 8 — What next** (3 min)
Role-specific forward path:
- Dev: "Explore Agent Teams, build custom MCP servers, set up CI with headless mode, check /release-notes monthly"
- PM: "Create skills for your top 5 workflows, connect team tools via MCP, share your CLAUDE.md with engineers, explore Desktop app"
- Non-technical: "Build more skills, explore /schedule for recurring tasks, try the Desktop app, check /release-notes monthly"
- All: "Prune your CLAUDE.md every 2 weeks. Your workspace is a living system, not a finished product."

**Exercise 9 — Reflection** (2 min)
"What's the one thing from this course that will change your daily work the most?"

**Completion signal:** "You've refined your workspace, discovered hidden features, and put everything together on a real task. Your Claude Code environment is now tailored to YOUR work. Keep iterating."

---

## 6. Factual Corrections Applied

| Claim | Correction |
|-------|-----------|
| Shift+Tab cycle: "Normal → Auto-Accept → Plan Mode" | Corrected to: `default → acceptEdits → plan → auto` (auto requires Team plan + flag) |
| Plan Mode "automatically clears context" | Corrected to: context clearing is OFFERED as an option, not automatic |
| Voice input via "SuperWhisper, MacWhisper" | Corrected to: Claude Code has NATIVE built-in voice since v2.1.69. /voice + Hold Space. Third-party tools are alternatives, not requirements |
| The 70/85/90 rule | Attributed as community-reported thresholds, not official Anthropic metrics |
| "~80% CLAUDE.md adherence" | Attributed as anecdotal, not measured |

---

## 7. Sources

### Official Documentation
- code.claude.com/docs/en/ (all pages)

### Community (High Signal)
- Boris Cherny (CC creator): verification loops, CLAUDE.md practices
- Boris Tane: annotation cycle workflow
- Sanity.io: three-attempt framework, ownership shift
- Daniel Miessler: skills vs commands vs agents framework
- DoltHub: common gotchas (git, test modification)
- HumanLayer, Builder.io: CLAUDE.md best practices

### Educational Design
- AI Tutoring RCT (Nature/PMC): do-before-explain evidence
- Bloom's Taxonomy, Kolb's Cycle, Knowles' Andragogy
- Spaced repetition and competency-based progression research

### Validation
- 10 persona simulations (4 detailed + 6 micro-checks)
- 72-cell cohort survivability matrix (92% PASS/ADAPT)
- Quality audit with session guard specifications
