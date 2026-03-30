# Course Simulation Synthesis

Four personas walked through every module. Here's what we learned.

## Personas

| Name | Role | CC Experience | Terminal Skill | Key Need |
|------|------|---------------|----------------|----------|
| Roberto | Construction Ops Manager | Zero | Zero | Automate reports |
| Sarah | SaaS Product Manager | 1 day | Basic (cd, ls) | PRDs, research, analysis |
| Marcus | Full-Stack Developer | 3 weeks | Expert | Go deeper on CC features |
| Priya | Senior Platform Engineer | 4 months daily | Expert | Hidden gems, advanced patterns |

## Universal Findings (All Personas Agree)

### 1. Module 4 (Plan & Verify) is the strongest module
Every persona rated it highly. Plan Mode maps to universal mental models: project scoping (Roberto), tech spec review (Sarah), development workflow (Marcus), architecture planning (Priya). The do-before-explain structure works perfectly here.

### 2. Hooks are a hard block for non-technical users
Sarah's #1 quit risk. Roberto's fatal wall. JSON configuration is the problem, not the concept. Fix: "Ask Claude to create this for you" or defer for non-technical paths.

### 3. Module 5 crams too much
4 systems (Skills + Hooks + Subagents + Plugins) in 60 min. Every persona flagged pacing issues. Marcus: "too fast, hooks will break." Sarah: "I can't complete hooks without JSON knowledge." Priya: "skills exercise is wasted on me, hooks need more depth."

### 4. /btw is universally loved
Roberto: "best thing I've learned." Sarah: "like Slack threads for Claude." Marcus: "I've been opening new terminals for side questions." Priya: "didn't know it works while Claude is processing."

### 5. Module 7 needs to be longer
Priya: covers only 37-58% of hidden gems. Marcus: "no concrete what-to-learn-next path." 30 min is insufficient for its stated purpose.

### 6. Surfaces overview comes too late
Marcus: "I've been using VS Code and CLI without knowing the differences for the entire course." Sarah: "The Desktop app might have been easier." Roberto: "I should have been told about the Desktop app in Module 0." Currently in Module 6b — should be Module 0.

### 7. Voice (/voice) should come much earlier
Roberto: "Move it to Module 1. This is the wheelchair ramp." Sarah: "SO much faster than typing." Currently in Module 7. For non-technical users, voice eliminates the #1 barrier (typing in an unfamiliar interface).

## Module-by-Module Ratings

| Module | Roberto | Sarah | Marcus | Priya |
|--------|---------|-------|--------|-------|
| 0: Orientation | NEEDS-HELP | OK (1/5 quit) | OK | SKIP |
| 1: First Contact | NEEDS-HELP | Good (1/5) | Boredom trap (8/10) | SKIP |
| 2a: CLAUDE.md | NEEDS-HELP | Stall risk (2/5) | Good | SKIP |
| 2b: Settings | FAIL | Irrelevant parts (2/5) | Mixed | SKIP |
| 3: Context Mastery | NEEDS-HELP | Excellent (1/5) | Best module (1/10 bore) | SKIP |
| 4: Plan & Verify | PASS | Excellent (1/5) | Best module (1/10 bore) | SKIM |
| 5: Extending CC | NEEDS-HELP | Quit risk at hooks (3/5) | Confusion at hooks (7/10) | ESSENTIAL |
| 6a: Parallel Work | FAIL | Good (1/5) | Good | SKIM |
| 6b: Integrations | FAIL | MCP risk (2/5) | Too fast (6/10 confuse) | WORTH IT |
| 7: Meta Game | PASS | Good (1/5) | Good | WORTH IT (but gaps) |

## The 5 Highest-Impact Fixes

### 1. Move /voice to Module 1
For non-technical users (Roberto, Sarah), voice input eliminates the primary barrier. Roberto talks for a living. Sarah thinks in narrative form. Burying voice in Module 7 means they struggle with typing in an unfamiliar interface for the entire course before discovering the solution.

### 2. Split Module 5
**5a: Skills + Plugins (40 min)** — both are "add capability" patterns. Skills are written in English (accessible). Plugins have a GUI (/plugin).
**5b: Hooks + Subagents (40 min)** — both are "automate behavior" patterns. Hooks need more time for config walkthrough. Subagents need more time for custom creation.

### 3. Add "Ask Claude to create this" instruction at every config step
Roberto and Sarah cannot write JSON, YAML, or config files. But they CAN ask Claude to write them. Every exercise involving file creation should include: "Tell Claude: 'Create a [skill/hook/subagent/config] that [does X].' Claude will create the file for you." This single bridge pattern makes the entire course accessible.

### 4. Move Surfaces overview to Module 0
All four personas would benefit from knowing what's available on their surface BEFORE starting the course. Roberto should be told about the Desktop app. Marcus should know VS Code differences. Sarah should know about the web interface. Priya should know about IDE features.

### 5. Define explicit Module 0 routing criteria
Currently undefined. Should be:
- 0 correct → Terminal Basics micro-module → Module 1
- 1 correct → Module 1 (abbreviated, skip exercises they demonstrated)
- 2 correct → Module 2a (with /compact bridge from Module 0)
- 3 correct → Module 4 (with Module 2-3 quick reference card)
- Self-identified power user → Module 5

## Quit Risk Moments (Ranked)

| Risk | Module | Persona | Severity | Fix |
|------|--------|---------|----------|-----|
| JSON config for hooks | 5 | Sarah, Roberto | CRITICAL | "Ask Claude to create it" + defer for non-technical |
| Terminal startup | Pre-0 | Roberto | CRITICAL | Terminal Basics micro-module |
| `! ls` exercise | 1 | Roberto | HIGH | Replace with `! date`, make terminal commands optional |
| Ctrl+G opens vim | 4 | Sarah | HIGH | Check $EDITOR first, provide fallback instructions |
| CLAUDE.md blank page | 2a | Sarah | HIGH | Provide role-specific starter templates |
| Module 1 boredom | 1 | Marcus | HIGH | Better routing from Module 0, skip criteria |
| MCP setup JSON | 6b | Sarah, Roberto | MEDIUM | Step-by-step for one tool, or "ask your engineer" |
| Settings hierarchy | 2b | Sarah, Roberto | MEDIUM | Developer-only branch, 2-sentence summary for PMs |
| Network drive files | 3 | Roberto | MEDIUM | Explain "local files only" limitation |
| Piping exercise | 3 | Roberto | MEDIUM | Already optional, good |

## Terminal Basics Micro-Module (For Roberto and Similar)

Required content (17 min):
1. What is a terminal? (2 min)
2. Anatomy of the prompt — `~`, `%`, blinking cursor (2 min)
3. Enter SENDS (not newline), arrow keys browse history, Ctrl+C ≠ copy (5 min)
4. Files and folders — directories, paths, `~/`, hidden files (3 min)
5. Keyboard shortcuts cheat sheet (1 min)
6. Command flags — what `--` means (2 min)
7. Where are my files? — local only, not network drives (2 min)

## Role-Specific Content Needs

### PM Path (Sarah)
- PM-specific CLAUDE.md starter template (20 lines)
- PM verification examples ("compare against template", "check pricing is current")
- PM examples throughout (PRDs, competitive analysis, research synthesis)
- Skip: settings hierarchy depth, env vars, piping, /diff, /pr-comments
- Add: "teach your team" guidance, privacy mention, plugin auth explanation

### Non-Technical Path (Roberto)
- Terminal Basics micro-module
- /voice in Module 1
- "Ask Claude to create it" at every config step
- Surfaces overview in Module 0 (might route to Desktop app)
- Skip: ! commands beyond `! date`, piping, JSON config, headless mode, git worktrees
- File path explanations at every @ reference

### Developer Path (Marcus)
- Copy-paste templates for hooks, MCP, subagent configs
- "When to use which" decision matrices (parallelism patterns, context strategies)
- Git worktree prerequisites sidebar
- VS Code vs CLI differences earlier
- Debugging workflows

### Power User Path (Priya)
- Skip Modules 1-3 via routing
- Deep hooks content (composition, debugging, security)
- All hidden gems surfaced explicitly
- Agent Teams as real exercise, not mention
- Power User Speedrun track option

## Hidden Gems Coverage Gap (from Priya's Audit)

19 features checked. Course covers 7 confirmed, 4 uncertain, 8 missing.

Missing entirely:
- /btw works while Claude is processing
- /context with optimization suggestions
- /copy N with 'w' to write to file
- env block in settings.json
- PR status color-coded in footer
- --debug category filtering
- CLAUDE_CODE_TASK_LIST_ID (shared task lists)
- $schema for settings autocomplete
- Settings auto-backup

## Updated Module Structure (Recommended)

```
Module 0:   Orientation + Surfaces Overview (10 min)
Module 0.5: Terminal Basics (17 min, non-technical only)
Module 1:   First Contact + /voice (30 min)
Module 2a:  CLAUDE.md & Memory (40 min)
Module 2b:  Settings & Permissions (20 min, with developer branches)
Module 3:   Context Mastery (50 min, +/context, +auto-compact env var)
Module 4:   Plan & Verify (45 min)
Module 5a:  Skills & Plugins (40 min)
Module 5b:  Hooks & Subagents (40 min, with "ask Claude to create" bridge)
Module 6a:  Parallel Work (40 min)
Module 6b:  Integrations & Automation (50 min, with developer branches)
Module 7:   The Meta Game (45-60 min, expanded for hidden gems)
```

Total: ~7-8 hours full path, ~5 hours with routing/skipping.

## What Each Persona Would Say After the Course

**Roberto (if fixed):** "I saved 3 hours every Friday on my safety report. I use /voice for everything. Plan Mode is how I scope projects now. I have skills for my top 3 workflows."

**Sarah (if fixed):** "Plan Mode and the Interview pattern changed how I do product work. I have skills for PRDs, competitive analysis, and research synthesis. My CLAUDE.md is dialed in. I got my engineers using some of these patterns."

**Marcus (if fixed):** "Context management (/compact, /btw) and Plan Mode were the biggest wins. I set up hooks for auto-formatting and test validation. I use subagents for codebase exploration. Worktrees let me juggle 3 PRs at once."

**Priya (if fixed):** "Module 5 alone justified the course — hooks with prompt/agent types and updatedInput changed how I build team tooling. The hidden gems Module 7 surfaced BASH_DEFAULT_TIMEOUT_MS, /context, and the env block. I have a power user cheat sheet I reference weekly."
