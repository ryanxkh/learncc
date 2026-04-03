# CLAUDE.md

## Version Bumping
IMPORTANT: When pushing changes to the plugin (any file under `plugins/learncc/`), ALWAYS bump the version before committing:
1. Increment the patch version (e.g., 1.6.1 → 1.6.2) in BOTH files:
   - `plugins/learncc/.claude-plugin/plugin.json`
   - `.claude-plugin/marketplace.json`
2. Claude Code uses version numbers to detect updates. If the version doesn't change, users won't see the update.
3. Current version: 1.6.1

## Project Structure
- `plugins/learncc/` — the plugin (skills, hooks, agents, examples)
- `plugins/learncc/skills/learncc/SKILL.md` — course orchestrator (must stay under 500 lines, currently ~200)
- `plugins/learncc/skills/learncc/references/` — 12 module content files (loaded on demand, one at a time)
- `plugins/learncc/hooks/` — SessionStart context primer + SessionEnd backup
- `plugins/learncc/agents/learncc-validator.md` — Haiku-powered exercise validator
- `.claude-plugin/marketplace.json` — marketplace manifest
- `learncc-runner.md` — standalone all-in-one version (not used by plugin)
- `docs/` — design docs, research, brand guidelines, audits

## Validation
Run `claude plugin validate ./plugins/learncc` before every push. Must pass.

## Testing Changes
After pushing: user must remove and re-add the marketplace (`claude plugin marketplace remove ryanxkh-learncc` then `claude plugin marketplace add ryanxkh/learncc`), then start fresh session, `/plugin` → install learncc → exit → fresh session. Version caching is aggressive — just clicking "Update now" often doesn't pull the latest.

## Skill Invocation
The plugin skill is invoked as `/learncc:learncc` (namespaced: plugin-name:skill-name). NOT `/learncc`.

## Key Design Rules (learned from live testing)
These are rules embedded in SKILL.md that came from real user testing. Do not remove them:

1. **Never tell learners to leave the session.** No "cd into a directory," no "open a new terminal," no "start a new session." Use full file paths from the current session. Exceptions: Module 3 (teaching session resume) and Module 6a (parallel work).

2. **Why before what.** Before asking the learner to do something that might feel arbitrary, explain WHY it matters to their work in 1-2 sentences.

3. **Explain every file write.** Before writing ANY file, tell the learner what you're about to write and why. Non-technical users will deny the permission prompt if they don't understand it.

4. **Role classification is internal only.** The `role` field in progress.json (developer/pm/non-technical) is for exercise branching. NEVER show it to the user. Use their own words from the `domain` field when greeting them.

5. **Progress.json writes only on real progress.** Don't write just to update session_count or metadata. Every write creates a permission prompt that interrupts the learner.

6. **CLAUDE.md is iterative, not comprehensive.** Per Anthropic's official docs, CLAUDE.md starts light and grows over time. Module 2a plants the seed (20 min). Advanced CLAUDE.md work (pruning, @imports, .claude/rules/) lives in Module 7.

7. **The framing for CLAUDE.md content is "context Claude can't infer" not "things Claude gets wrong."** Users who are new haven't experienced mistakes yet. The prompt is: "What would Claude need to know about you to be useful from the first message?"

8. **No editor traps.** Never tell non-technical or PM users to run commands that open $EDITOR (vim). This includes /memory, /config, /keybindings, Ctrl+G. Use /status to view settings. Read files with the Read tool and show content. Gate editor commands to developer-path only with warnings.

9. **Never go idle after a slash command.** Slash commands (/doctor, /permissions, /plugin, etc.) run as built-ins and don't return a message to the tutor. Always follow "try this now" with "tell me what you see" or "say 'done' when ready" so the learner knows to message back.

10. **Exit instructions on every TUI.** Any command that opens a TUI (/plugin, /diff, /hooks, Ctrl+O) must include how to exit (q, Esc) BEFORE or alongside the command, not buried after.

## Content Accuracy
- Shift+Tab cycle: `default → acceptEdits → plan → auto` (auto requires Team plan + flag)
- Plan mode context clearing: OFFERED as an option, not automatic
- Voice (/voice): native built-in since v2.1.69, not third-party
- Community thresholds (70/85/90): community-reported, NOT official Anthropic metrics. Always attribute.
- /loop: bundled skill, not a native command
- /config: opens $EDITOR (vim trap) — use /status instead for non-technical users

## Brand Guidelines
Full Anthropic-adjacent brand guide at `docs/BRAND-GUIDELINES.md`. Key rule: never use pure white (#FFFFFF) or pure black (#000000). Use warm cream (#FAF9F5) and warm charcoal (#141413). Accent: terra cotta (#D97757).

## Website
- Landing page: learncc.xyz
- v0 project repo: github.com/ryanxkh/v0-learncc-ff (Next.js)
- Help page at /help with troubleshooting FAQ

## Marketplace Submission
Submitted to Anthropic official marketplace on 2026-03-30. Pending review. Self-hosted marketplace available now via `claude plugin marketplace add ryanxkh/learncc`.

## Status: Live Beta
The plugin is live and being tested by real users. Current priority is collecting user feedback and iterating on UX issues. Known limitations:
- Progress tracking within modules is advisory (tutor sometimes skips saves between exercises)
- Version caching requires marketplace remove/re-add to force updates
- The tutor occasionally improvises in ways the SKILL.md didn't intend (calling users by their role classification, telling them to open new sessions, not updating progress)
- Modules 3-7 have been simulation-tested but not yet fully tested by real humans end-to-end
