# LearnCC: Master Claude Code

A structured, hands-on Claude Code mastery course delivered as a system prompt. Load it into Claude Code and it becomes your tutor — adapting to your role, tracking your progress, and teaching through practice, not lectures.

## Who This Is For

Everyone. The course adapts to your role:
- **Developers** — hooks, worktrees, headless mode, CI integration
- **Product Managers** — PRDs, research synthesis, competitive analysis, Plan Mode
- **Non-Technical Users** — voice input, report automation, skills, document workflows
- **Students** — learning-focused usage with academic integrity guidance
- **Power Users** — hidden gems, advanced hooks, compound workflows

No coding experience required. If you've never opened a terminal, the course starts with a 17-minute terminal orientation.

## What You'll Learn

| Module | What You'll Be Able To Do After |
|--------|-------------------------------|
| First Contact | Have productive conversations, use voice input, navigate basic controls |
| Your Workspace | Configure CLAUDE.md, manage memory, set up your environment |
| Context Mastery | Manage context proactively, use /btw and /compact, handle sessions |
| Plan & Verify | Use Plan Mode, verification loops, and the interview pattern |
| Skills & Plugins | Create custom skills, discover and install plugins |
| Hooks & Subagents | Automate actions with hooks, delegate work to subagents |
| Parallel Work | Run multiple sessions, fork conversations, use writer/reviewer pattern |
| Integrations | Connect tools via MCP, choose models, automate with headless mode |
| The Meta Game | Continuous improvement, hidden features, compound workflows |

Total: ~5-8 hours depending on your experience (the course skips what you already know).

## Quick Start

### Install from Plugin Marketplace (Recommended)
Once accepted into the official marketplace:
1. Open Claude Code and type `/plugin`
2. Search `learncc` in the Discover tab
3. Press Space to install, Esc to close
4. Type `/learncc` to start the course

### Install from GitHub (Available Now)
```bash
# Add the marketplace source (one time, in your terminal BEFORE starting Claude Code)
claude plugin marketplace add ryanxkh/learncc
```
Then start Claude Code and:
1. Type `/plugin`
2. Search `learncc` in the Discover tab
3. Press Space to install, Esc to close
4. Type `/learncc` to start the course

### Manual (without plugin install)
```bash
git clone https://github.com/ryanxkh/learncc.git
cd learncc
claude --append-system-prompt-file ./learncc-runner.md
```
Then say "start."

## Token Usage Note

This course uses additional tokens beyond normal Claude Code usage. Each module loads its content on demand (not all at once), but expect higher-than-normal token consumption during active learning sessions. The course is designed for efficiency — module content loads only when you reach that module, and completed modules are never re-loaded.

## How It Works

The course is an **Option C "Course Runner"** — a single system prompt that turns Claude Code into a structured tutor. It:

1. **Assesses you** — asks about your role, experience, and tools
2. **Routes you** — skips what you already know, starts where you'll learn most
3. **Adapts to you** — developer, PM, and non-technical paths with different examples and exercises
4. **Tracks progress** — saves to `~/.claude/learncc/progress.json` after every exercise
5. **Resumes cleanly** — come back tomorrow and pick up exactly where you left off
6. **Stays on track** — built-in guardrails prevent rambling, over-explaining, and tangents

## Course Design

Built on research-backed educational principles:
- **Do-before-explain** — you try things before getting the explanation
- **1:4 ratio** — 1 minute of explanation for every 4 minutes of practice
- **Role-adapted** — every exercise uses examples from YOUR work domain
- **Socratic assessment** — "why did that work?" not quizzes
- **Spaced retrieval** — each module starts with recall of prior concepts
- **Session guards** — break points, time caps, and anti-drift mechanisms

## Files

```
learncc/
├── .claude-plugin/
│   └── plugin.json               # Plugin manifest
├── skills/
│   └── learncc/
│       ├── SKILL.md              # Course orchestrator (166 lines)
│       └── references/
│           ├── module-0.md       # Orientation + Surfaces
│           ├── module-0.5.md     # Terminal Basics (non-technical)
│           ├── module-1.md       # First Contact + Voice
│           ├── module-2a.md      # CLAUDE.md & Memory
│           ├── module-2b.md      # Settings & Permissions
│           ├── module-3.md       # Context Mastery
│           ├── module-4.md       # Plan & Verify
│           ├── module-5a.md      # Skills & Plugins
│           ├── module-5b.md      # Hooks & Subagents
│           ├── module-6a.md      # Parallel Work
│           ├── module-6b.md      # Integrations & Automation
│           └── module-7.md       # The Meta Game
├── examples/
│   ├── claude-md-developer.md    # Starter CLAUDE.md for developers
│   ├── claude-md-pm.md           # Starter CLAUDE.md for PMs
│   ├── claude-md-general.md      # Starter CLAUDE.md for non-technical
│   ├── example-skill.md          # Template skill file
│   ├── example-hook.json         # Template hook configuration
│   └── example-subagent.md       # Template subagent file
├── learncc-runner.md             # Standalone version (all-in-one system prompt)
├── README.md                     # This file
├── LICENSE                       # MIT
├── CHANGELOG.md                  # Version history
└── docs/                         # Design and research (for contributors)
    ├── COURSE-BLUEPRINT-v2.md    # Design document
    ├── QUALITY-AUDIT.md          # UX audit specs
    ├── VERIFICATION-REPORT.md    # Research verification
    └── research/                 # Source research (9 files)
```

## Progress Tracking

Your progress is saved to `~/.claude/learncc/progress.json`. This file tracks:
- Your role and domain
- Which modules you've completed
- Where you left off mid-module
- Questions you asked that belong in later modules (the "parking lot")

To reset your progress and start over:
```bash
rm ~/.claude/learncc/progress.json
```

## Privacy

The course saves your progress to `~/.claude/learncc/progress.json` on your local machine. This file stores your role, domain, module progress, and deferred questions. It is never transmitted anywhere — it stays on your computer. To delete it: `rm ~/.claude/learncc/progress.json`

## Feature Availability

Claude Code ships new features frequently. Specific commands, keyboard shortcuts, and features referenced in this course are accurate as of v2.1.85+ (March 2026). If something doesn't work as described, check `/release-notes` for changes. The course teaches patterns and workflows that remain stable across versions, even if specific command names change.

## Contributing

This course is open source. To improve it:
1. Check `COURSE-BLUEPRINT-v2.md` for the design specs
2. Check `research/` for the underlying research
3. For the plugin version: module content lives in `skills/learncc/references/`. For the standalone version: `learncc-runner.md`
4. Test changes against diverse personas (the research includes 10 test personas)

## Credits

Built with research from:
- Anthropic's official Claude Code documentation
- Community practitioners: Boris Cherny, Boris Tane, Daniel Miessler, Simon Willison, and many others
- Educational design research: Bloom's Taxonomy, Kolb's Cycle, Knowles' Andragogy, AI Tutoring RCTs
- Validated against 10 diverse learner personas from marketing coordinators to Linux sysadmins
