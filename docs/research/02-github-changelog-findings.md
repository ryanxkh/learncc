# GitHub & Changelog Research Findings

Source: github.com/anthropics/claude-code, CHANGELOG.md, issues, discussions

## Recent Notable Features

### Context & Session Management
- 1M context window for Opus 4.6 (v2.1.75) — most users haven't noticed
- `/btw` side-question overlay — answer doesn't enter conversation history
- `/rewind` + checkpointing — double-tap Esc to restore conversation, code, or both
- `/copy N` — copies Nth-latest assistant response to clipboard
- Partial compaction — Esc+Esc, select checkpoint, "Summarize from here"
- Transcript search — `/` in transcript mode (Ctrl+O), navigate with n/N

### Automation & Scripting
- `--bare` flag (v2.1.81) — skips hooks, LSP, plugins. Faster startup for CI
- `--permission-mode auto` — classifier handles approvals
- Fan-out pattern: `claude -p` in bash loops with `--allowedTools`
- `--output-format stream-json` — pipeline integration

### Hooks (Recent Additions)
- Conditional `if` field (v2.1.85) — permission-rule syntax conditions
- CwdChanged and FileChanged events (v2.1.83)
- TaskCreated event (v2.1.84)
- PostCompact event (v2.1.76)
- StopFailure event (v2.1.78)
- PreToolUse can answer AskUserQuestion headlessly (v2.1.85)

### Subagents & Skills
- Custom subagents in `.claude/agents/`
- Skills with `initialPrompt` frontmatter (v2.1.83) — self-starting workflows
- `effort`, `maxTurns`, `disallowedTools` frontmatter (v2.1.78)
- `disable-model-invocation: true` — manual-only skills

### Interface
- `/color` command — color-coded terminal sessions
- `/effort` slash command — set effort level per session
- Image paste creates `[Image #N]` reference chips
- Line-by-line response streaming

## Hidden Gems (Poorly Documented)
1. `--bare` flag — nearly undiscovered, much faster for scripted/CI use
2. `CLAUDE_CODE_SUBPROCESS_ENV_SCRUB=1` — strips credentials from subprocess envs
3. PreToolUse hooks answering user questions headlessly
4. `ANTHROPIC_CUSTOM_MODEL_OPTION` — inject custom model strings into /model picker
5. `rate_limits` in statusline scripts — real usage burn rate data
6. Transcript search (Ctrl+O then /)
7. `${CLAUDE_PLUGIN_DATA}` — persistent plugin state across sessions
8. `managed-settings.d/` drop-in directory — composable MDM policies
9. MCP elicitation — interactive mid-task dialogs
10. `CLAUDE_STREAM_IDLE_TIMEOUT_MS` — tune idle stream timeout
11. `worktree.sparsePaths` — sparse-checkout for monorepos

## Common User Pain Points
- Destructive git commands without warning (git reset --hard)
- Permission state not persisting between sessions
- Multiple account management
- Usage limits hit immediately on Max subscription
- Console scrolling issues (multiple long-standing)
- Context quality degradation above 80-90%
- Output looping after parallel Read operations

## What Power Users Do Differently
- Use subagents constantly to keep main context clean
- Build custom status lines for real-time context visibility
- Use Explore-Plan-Implement-Commit workflow
- Pipe data via stdin instead of copy-pasting
- Use `--continue` vs `--resume` intentionally
- Run parallel sessions in separate terminal tabs
- Follow the 70/85/90 context rule
