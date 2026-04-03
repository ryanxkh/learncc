# CLAUDE.md

## Version Bumping
IMPORTANT: When pushing changes to the plugin (any file under `plugins/learncc/`), ALWAYS bump the version before committing:
1. Increment the patch version (e.g., 1.2.0 → 1.2.1) in BOTH files:
   - `plugins/learncc/.claude-plugin/plugin.json`
   - `.claude-plugin/marketplace.json`
2. Claude Code uses version numbers to detect updates. If the version doesn't change, users won't see the update even after pushing to GitHub.

## Project Structure
- `plugins/learncc/` — the plugin (skills, hooks, agents, examples)
- `.claude-plugin/marketplace.json` — marketplace manifest pointing to the plugin
- `learncc-runner.md` — standalone all-in-one version
- `docs/` — design docs, research, audits (not shipped with plugin)
