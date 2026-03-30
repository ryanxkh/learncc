# LearnCC Verification Report

> Honest assessment of what's solid, what's wrong, and what's missing.

---

## Verdict: Strong Foundation, Significant Gaps

The strategic layer is solid — workflows, mindsets, educational design, community wisdom. But the tactical feature coverage has massive holes, several claims are factually wrong, and the "role-agnostic" promise isn't yet fulfilled. The blueprint also needs rearchitecting for Option C.

---

## 1. FACTUAL ERRORS (Must Fix)

### Wrong: Shift+Tab Cycle
- **We said:** "Normal → Auto-Accept → Plan Mode"
- **Actually:** `default → acceptEdits → plan → auto` (auto only with Team plan + `--enable-auto-mode`)
- **Additional modes exist:** `bypassPermissions` (appears in cycle if enabled at startup), `dontAsk` (never in cycle)
- We used informal names and missed auto mode entirely

### Wrong: Plan Mode Auto-Clears Context
- **We said:** "When you accept: context clears automatically for clean implementation" (attributed to Boris Cherny)
- **Actually:** The docs say context clearing is *offered as an option* when you accept a plan, not automatic. Each approve option "also offers to clear the planning context first" — it's a prompt, not a default.

### Wrong: Voice Input Attributed to Third-Party Tools Only
- **We said:** "SuperWhisper, MacWhisper, fn x fn on macOS"
- **Actually:** Claude Code has NATIVE built-in voice dictation since v2.1.69. `/voice` toggles it on. Hold Space to record. 20 languages. No third-party tool required. This is a first-party feature we completely missed.

### Misleading: The 70/85/90 Rule
- **We presented as:** established knowledge
- **Actually:** Zero mention in any official Anthropic documentation. Pure community folklore. The concept (context degrades as it fills) is real and documented. The specific percentages are community-invented and should be attributed as "community-reported thresholds, not official metrics."

### Misleading: "~80% CLAUDE.md Adherence"
- Same situation. Anecdotal community figure, not an official metric.

### Misleading: Boris Tane Called a "Founder"
- We called him "Boris Tane (founder)" without specifying founder of what. Could be misleading. The blog (boristane.com) confirms the name but not the title context.

---

## 2. FEATURE COVERAGE GAPS (Major)

### Completely Missing from Blueprint

| Feature Area | What We Missed | Impact |
|---|---|---|
| **60+ slash commands** | We covered ~15. Missing: /branch, /diff, /export, /insights, /doctor, /context, /schedule, /sandbox, /theme, /stats, /usage, /mobile, /plan, /plugin, /stickers, /keybindings, /color, /desktop, /security-review, /pr-comments, /privacy-settings, /extra-usage, /release-notes, and more | HIGH — a course about CC that doesn't cover most commands |
| **Full keyboard shortcuts** | Missing: Ctrl+B (background), Ctrl+T (tasks), Option+P (model), Option+O (fast), Ctrl+G (editor), Ctrl+L (clear screen), and more | HIGH |
| **Desktop App (Cowork)** | Live app preview, computer use, GitHub PR monitoring, auto-worktree isolation, Dispatch, SSH sessions, cloud sessions, connectors GUI. Practically a separate product | HIGH — many users are on Desktop |
| **Web App (claude.ai/code)** | Cloud sandboxed, teleport to local, Slack triggers, mobile access, no local file access | HIGH — many users start here |
| **VS Code Extension** | Inline diff review, plan as markdown doc, @-mentions with line ranges, multiple tabs, checkpoint rewind UI, graphical plugin manager, IDE MCP server, URI handler | HIGH — huge user base |
| **Plugins & Marketplace** | Full marketplace system, 30+ official plugins (LSP, GitHub, Slack, Linear, Figma, etc.), creating plugins, plugin scopes | HIGH — major extensibility system |
| **Built-in Voice** | Native push-to-talk, /voice, Hold Space, 20 languages | MEDIUM — QoL feature |
| **Fast Mode** | /fast, 2.5x speed, higher cost, Option+O toggle, research preview | MEDIUM |
| **Sandbox Mode** | OS-level isolation, /sandbox, Seatbelt/bubblewrap, 84% fewer permission prompts | MEDIUM |
| **Scheduled Tasks** | Three systems (cloud, desktop, /loop), wildly different capabilities | MEDIUM |
| **Extended Thinking** | /effort, ultrathink, adaptive reasoning, interleaved thinking | MEDIUM |
| **Agent Teams** | Multi-instance coordination, shared task list, teammate messaging, experimental | MEDIUM — advanced |
| **Status Line** | Customization, JSON data available, community tools | MEDIUM |
| **Channels** | Telegram/Discord/iMessage push events into sessions | LOW — research preview |
| **Remote Control** | Steer sessions from phone/browser, QR code, cross-device sync | MEDIUM |
| **Dispatch** | Phone-to-Desktop task routing, push notifications | MEDIUM — Desktop-only |
| **Chrome Extension** | Browser automation, live debugging, design verification, session recording | MEDIUM |

### Under-Covered in Blueprint

| Area | What's Thin | What's Needed |
|---|---|---|
| Permission modes | Only cover Plan. Don't cover auto, dontAsk, bypassPermissions | Full mode comparison, when to use each |
| /init command | Mentioned once | Should be in Module 2 (CLAUDE.md creation) |
| .claude/rules/ directory | Not covered | Alternative to CLAUDE.md for larger projects |
| Multiple surfaces | Course assumes CLI only | At minimum, acknowledge Desktop/Web/IDE and note differences |
| Cost awareness | /cost mentioned nowhere | Should be in fundamentals — understanding token usage |
| Model selection | /model barely covered | When to use Opus vs Sonnet vs Haiku, fast mode |

---

## 3. NON-TECHNICAL ACCESSIBILITY (From Bias Audit)

### By the Numbers
- **9 Hard Blocks** — exercises that cannot be completed without specific technical knowledge
- **11 Soft Biases** — exercises that alienate through developer-centric framing
- **28 Jargon Issues** — unexplained technical terms

### Worst Offenders
1. **Module 1, Exercise 4:** `! ls` and `! pwd` — Unix commands meaningless to non-technical users
2. **Module 2, Exercise 1:** "Create a CLAUDE.md in your project root" — assumes project directory knowledge
3. **Module 3, Exercise 6:** Piping (`cat error.log | claude`) — Unix concept
4. **Module 5, Exercise 2:** All three hook examples are developer-specific
5. **Module 6:** Three of four exercises are hard blocks (worktrees, MCP transport types, headless bash)

### Structural Fixes Needed
1. Add **Terminal Basics micro-module** (Module 0.5) for non-technical users
2. Every exercise needs **explicit role-branching** written into the prompt (developer path, PM path, general path)
3. **Default examples must be universally understandable** — developer examples as labeled branches
4. Add a **glossary** of terms (file path, directory, flag, pipe, root) in every module
5. Module 6 needs complete restructuring around universal concepts

---

## 4. OPTION C ARCHITECTURE (Course Runner)

The blueprint was designed for Option B (standalone module prompts). Option C requires rethinking:

### Viable Architecture
```
User runs: claude --append-system-prompt-file ./learncc-runner.md
```

**The runner prompt contains:**
- Orchestrator logic (reads progress, routes to next module, tracks state)
- Learner profile (populated during orientation, persisted)
- All module content inline or via @imports
- Pedagogical rules
- Role-branching instructions

**State persistence:**
- Progress file at `~/.claude/learncc/progress.json` — modules completed, learner profile, current position
- Runner reads this on every session start and routes accordingly
- Written by Claude at module completion checkpoints

### Key Constraints
- @import syntax works in CLAUDE.md but may not work in `--append-system-prompt-file`. Needs testing.
- If all module content is inline: ~400-700 lines. Large but feasible with 1M context.
- Cross-session persistence via progress file is the cleanest approach.
- Each module should still be a separate session for context hygiene, but the runner should gracefully handle "continue from where I left off."

### Alternative: Skill-Based Architecture
- Runner is a CLAUDE.md
- Each module is a skill in `.claude/skills/`
- Runner invokes the appropriate skill based on progress
- Cleaner separation but requires the user to have the repo as their working directory

### Recommendation
Start with the **inline runner** approach (one file, all content, progress file). Test it. If the prompt is too long or unwieldy, refactor to skill-based architecture. Ship the simplest thing that works, iterate.

---

## 5. ALIGNMENT WITH ORIGINAL INTENT

Checking against Ryan's original message:

| Intent | Status | Notes |
|---|---|---|
| "Ins and outs" of CC | PARTIAL | Strategy is covered well. Tactical features have major gaps |
| "Pro tips and QoL buried in changelog" | GOOD | Changelog mining was thorough. Hidden gems section is strong |
| "Slash commands" | WEAK | Only covered 15 of 60+. This was explicitly called out |
| "Proper sub agent creation" | GOOD | Module 5 covers this well |
| "What hooks are" | GOOD | Module 5 covers this, though examples need role-branching |
| "Fundamentals" | GOOD | Modules 1-3 cover this |
| "Pro tips / I wish I knew" | GOOD | Context mastery, /btw, verification loops, plan mode |
| "Educational best practices" | EXCELLENT | Deep research, well-applied principles |
| "Proper progression" | GOOD | Bloom's taxonomy, fading scaffolding, competency-based |
| "System prompt anyone can use" | NEEDS REARCHITECTING | Currently Option B, user chose Option C |
| "Agnostic to all roles" | FAILING | 9 hard blocks, 11 soft biases, developer-default voice |
| "Use CC for non-code tasks" | PARTIAL | Hackathon story, PM use cases in research. Not reflected in exercises |
| "Exact same prompts and exercises" | GOOD for Option C | Runner approach supports reproducibility |

### The Core Gap
The research phase captured non-engineering use cases brilliantly (hackathon winners, Teresa Torres, TransformerNews). But **none of this translated into the exercise design**. The exercises were written by a developer brain for developer users. The research told us the audience is broader; the blueprint didn't follow through.

---

## 6. WHAT'S SOLID (Don't Throw Away)

1. **Educational design research** — Excellent. The pedagogical principles are well-chosen and directly applicable. Do-before-explain, fading scaffolding, Socratic assessment, 1:4 ratio, Kolb cycle, Bloom's taxonomy — all backed by real evidence.

2. **Community wisdom** — The practitioner quotes, workflow patterns, common mistakes, and "aha moments" are genuinely valuable teaching material. Boris Cherny's verification loop, Boris Tane's annotation cycle, the three-attempt framework, the Sanity.io ownership shift.

3. **The 7-module progression** — The sequence (foundations → workspace → context → workflows → extensions → advanced → mastery) is pedagogically sound. The specific content in each module needs updating, but the arc is right.

4. **"Build your workspace" throughline** — Validated by adult learning theory. Immediately useful, relevant to every role, forces application to own domain.

5. **The overall concept** — A system prompt that turns CC into its own tutor is a genuinely novel distribution mechanism. No one else has done this well.

---

## 7. WHAT NEEDS TO HAPPEN BEFORE BUILDING

### Must-Do (Blocks Everything)
1. **Fix factual errors** — Shift+Tab cycle, plan mode context clearing, voice attribution, 70/85/90 sourcing
2. **Rearchitect for Option C** — Design the runner prompt, progress tracking, and session management
3. **Expand feature inventory** — Incorporate the 15+ missing feature areas into appropriate modules
4. **Write role-branching for every exercise** — Developer, PM, and general paths with explicit alternatives

### Should-Do (Improves Quality Significantly)
5. **Add Terminal Basics micro-module** for non-technical onboarding
6. **Add "Surfaces" section** — acknowledge CLI/Desktop/Web/IDE differences, at least at overview level
7. **Add glossary** — define technical terms used across modules
8. **Create cross-platform feature matrix** — so learners know what's available on their surface

### Could-Do (Nice to Have)
9. **Add plugin discovery exercise** — the marketplace is a major feature
10. **Add scheduling section** — /loop, desktop tasks, cloud tasks
11. **Add quick-start cheat sheet** — 1-page version for people who won't do the full course
12. **Benchmark against ccforpms.com** — understand what they do well

---

## 8. COMPETING LANDSCAPE

| Resource | Format | Cost | Audience | Our Differentiation |
|---|---|---|---|---|
| ccforpms.com | Interactive (inside CC) | Free | PMs specifically | We're broader + deeper on CC itself |
| Anthropic Skilljar courses | Video | Free | Developers | We're hands-on, not video-based |
| Frank Kane (Udemy) | Video | ~$20 | Developers | We're inside the tool, not watching |
| Maven "CC for PMs" | Live cohort | Paid | PMs | We're free and self-paced |
| Builder.io 50 tips | Blog post | Free | Developers | We're structured progression, not a list |
| ykdojo 45 tips | GitHub repo | Free | Developers | We're pedagogically designed, not tips |

Our unique angle: **role-agnostic, taught inside the tool, pedagogically designed, free, open-source system prompt.**

No one else has: an educational experience that adapts to the learner's role AND follows research-backed pedagogy AND distributes as a single system prompt.

---

## SOURCES (All Verification)

### Official Documentation (Verified)
- Built-in Commands: code.claude.com/docs/en/commands
- Interactive Mode: code.claude.com/docs/en/interactive-mode
- Permission Modes: code.claude.com/docs/en/permission-modes
- Voice Dictation: code.claude.com/docs/en/voice-dictation
- Fast Mode: code.claude.com/docs/en/fast-mode
- Chrome Integration: code.claude.com/docs/en/chrome
- Desktop App: code.claude.com/docs/en/desktop
- Plugins: code.claude.com/docs/en/discover-plugins
- Scheduled Tasks: code.claude.com/docs/en/scheduled-tasks
- Channels: code.claude.com/docs/en/channels
- Remote Control: code.claude.com/docs/en/remote-control
- Agent Teams: code.claude.com/docs/en/agent-teams
- Status Line: code.claude.com/docs/en/statusline
- Sandboxing: code.claude.com/docs/en/sandboxing
- VS Code Extension: code.claude.com/docs/en/vs-code

### Third-Party (For Competing Landscape)
- ccforpms.com
- Anthropic Skilljar: anthropic.skilljar.com
- Scrimba's course list: scrimba.com/articles/best-claude-code-tutorials-and-courses-in-2026
