# Complete Tactical Feature Inventory

Source: Final audit pass across all official docs pages, env vars, settings, community configs.

## Module Placement Map (52 Missing Features → Where They Go)

### Module 1 (5 additions)
- /cost — cost awareness from Day 1
- /exit (Ctrl+D) — basic exit
- Ctrl+C, Ctrl+L — basic controls
- Multiline input (\ + Enter, Option+Enter, Shift+Enter, Ctrl+J)
- /feedback (/bug) — brief mention

### Module 2 (9 additions)
- /init (with CLAUDE_CODE_NEW_INIT=true) — REPLACE current Module 2 opening exercise
- /config (/settings) — companion to settings hierarchy
- /memory — manage auto memory
- /permissions (/allowed-tools) — manage tool allowlists
- Permission modes: full Shift+Tab cycle (default → acceptEdits → plan → auto)
- .claude/rules/ directory — alternative to large CLAUDE.md
- /doctor — diagnostics
- /theme, /color — personalization
- /terminal-setup — fix display issues

### Module 3 (8 additions)
- /context — visualize context window (THE companion to context mastery)
- /effort + Option+T — extended thinking control
- /copy N — clipboard management
- /export — conversation export
- /stats — usage metrics
- Ctrl+O — transcript view + search
- Ctrl+R — reverse search history
- Esc+Esc — explicitly teach double-tap for rewind

### Module 4 (4 additions)
- /plan — command alternative to Shift+Tab
- /diff — interactive diff viewer for verification
- /pr-comments — pull PR feedback as context
- /security-review — vulnerability audit

### Module 5 (5 additions)
- Plugins & marketplace (/plugin, /reload-plugins) — MAJOR gap, add as 4th section
- /hooks — manage configured hooks
- /skills — list available skills
- /agents — manage subagents
- Agent Teams — advanced sidebar mention

### Module 6 (split into 6a + 6b, 10 additions)
- /sandbox — OS-level isolation (84% fewer prompts)
- /model + Option+P — model selection
- /fast + Option+O — speed/cost tradeoff
- /branch (/fork) — conversation forking
- --bare, --json-schema flags — headless deep dive
- /schedule, /loop — scheduling systems
- /remote-control — remote session control
- /tasks + Ctrl+T — task management
- Ctrl+B — background tasks
- Surfaces overview (Desktop/Web/VS Code/JetBrains)

### Module 7 (6 additions)
- Built-in voice (/voice, Hold Space) — FIX third-party attribution
- /insights — usage analysis for self-improvement
- /keybindings — customize shortcuts
- /release-notes — staying current
- /statusline — status bar customization
- /usage, /extra-usage — billing awareness

## Essential Environment Variables (Top 15)

1. BASH_DEFAULT_TIMEOUT_MS (120s) — THE most common pain point
2. BASH_MAX_TIMEOUT_MS (600s) — hard ceiling for slow commands
3. BASH_MAX_OUTPUT_LENGTH (30k chars) — truncation for build logs
4. CLAUDE_AUTOCOMPACT_PCT_OVERRIDE (95%) — lower to compact early
5. CLAUDE_CODE_DISABLE_GIT_INSTRUCTIONS — frees ~2K system prompt tokens
6. CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC — air-gapped environments
7. ANTHROPIC_SMALL_FAST_MODEL — control background model
8. CLAUDE_CODE_SUBAGENT_MODEL — different model for subagents
9. MAX_THINKING_TOKENS — cap thinking token budget
10. CLAUDE_CODE_MAX_OUTPUT_TOKENS (32k, max 64k) — response length
11. MCP_TIMEOUT (30s) — MCP server connection timeout
12. CLAUDE_STREAM_IDLE_TIMEOUT_MS (90s) — streaming watchdog
13. MAX_MCP_OUTPUT_TOKENS (25k) — MCP result truncation
14. CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY (10) — parallel tool limit
15. CLAUDE_CODE_TASK_LIST_ID — share task list across sessions

## Essential Settings.json Keys (Top 15)

1. permissions.allow/deny/ask — tool permission rules
2. permissions.defaultMode — default permission mode per session
3. env block — embed env vars in settings (cleaner than shell exports)
4. effortLevel — persist thinking depth
5. model — override default model
6. attribution.commit/pr — customize or remove Claude attribution
7. autoUpdatesChannel: "stable" — skip buggy releases
8. $schema — autocomplete in VS Code
9. language — force response language
10. cleanupPeriodDays — session retention
11. outputStyle — "Explanatory" or "Learning" built-in styles
12. statusLine — custom status bar command
13. plansDirectory — store plans with repo
14. worktree.symlinkDirectories — avoid duplicating node_modules
15. sandbox.enabled — OS-level bash isolation

## Hidden Gems Summary (Top 20)

1. /btw works WHILE Claude is processing
2. /context shows optimization suggestions, not just usage
3. /init interactive mode (CLAUDE_CODE_NEW_INIT=true) sets up skills+hooks+memory
4. /copy N with 'w' key writes to file (useful over SSH)
5. /diff shows per-turn diffs, not just current git diff
6. Prompt suggestions appear after responses (Tab to accept, nearly free)
7. PR status color-coded in footer (auto-updates every 60s)
8. $schema in settings.json enables autocomplete
9. BASH_DEFAULT_TIMEOUT_MS is only 120s (most common pain point)
10. env block in settings.json replaces shell exports
11. # Compact instructions section in CLAUDE.md guides compaction behavior
12. CLAUDE_CODE_DISABLE_GIT_INSTRUCTIONS frees ~2K tokens
13. Output styles: "Explanatory" and "Learning" built-in
14. Settings auto-backup (5 most recent, silent)
15. --debug "api,mcp" category filtering (!prefix to exclude)
16. --from-pr 123 resumes PR-linked sessions
17. transcript_path available in hooks and statusline
18. hook suppressOutput: true — inject hidden context
19. CLAUDE_CODE_TASK_LIST_ID shares tasks across sessions
20. tmux needs allow-passthrough on for notifications to work

## Shell Aliases (Recommended)

```bash
alias cc='claude'
alias ccc='claude --continue'
alias ccr='claude --resume'
alias ccp='claude -p'
alias ccb='claude --bare -p'       # fast scripting
alias ccsafe='claude --permission-mode plan'
alias cco='claude --model opus --effort max'
```

## Terminal-Specific Notes

- iTerm2: Shift+Enter native, enable notification center alerts
- Ghostty: Everything works out of box, GPU-accelerated
- WezTerm: Shift+Enter native, OSC 8 links, Lua scriptable
- Kitty: Shift+Enter native, notifications work
- VS Code: run /terminal-setup, set macOptionIsMeta
- tmux: MUST set allow-passthrough on for notifications
- CLI_WIDTH env var overrides terminal width detection
