# Verification Findings: Features, Corrections, and Gaps

## Complete Slash Command List (60+ Commands)

/add-dir, /agents, /branch (/fork), /btw, /chrome, /clear (/reset, /new), /color,
/compact, /config (/settings), /context, /copy, /cost, /desktop (/app), /diff,
/doctor, /effort, /exit (/quit), /export, /extra-usage, /fast, /feedback (/bug),
/help, /hooks, /ide, /init, /insights, /install-github-app, /install-slack-app,
/keybindings, /login, /logout, /mcp, /memory, /mobile (/ios, /android), /model,
/passes, /permissions (/allowed-tools), /plan, /plugin, /pr-comments,
/privacy-settings, /release-notes, /reload-plugins, /remote-control (/rc),
/remote-env, /rename, /resume (/continue), /review (deprecated), /rewind (/checkpoint),
/sandbox, /schedule, /security-review, /skills, /stats, /status, /statusline,
/stickers, /tasks, /terminal-setup, /theme, /upgrade, /usage, /vim, /voice

Plus: MCP-exposed prompts as /mcp__<server>__<prompt>, bundled skills like /simplify, /loop, /debug, /batch

## Complete Keyboard Shortcuts

### General Controls
- Ctrl+C — Cancel current input or generation
- Ctrl+X Ctrl+K — Kill all background agents (press twice within 3 sec)
- Ctrl+D — Exit session
- Ctrl+G or Ctrl+X Ctrl+E — Open in text editor
- Ctrl+L — Clear terminal screen (keeps conversation)
- Ctrl+O — Toggle verbose output (transcript view)
- Ctrl+R — Reverse search command history
- Ctrl+V / Cmd+V (iTerm2) / Alt+V (Windows) — Paste image
- Ctrl+B — Background running tasks (Tmux: press twice)
- Ctrl+T — Toggle task list
- Left/Right arrows — Cycle through dialog tabs
- Up/Down arrows — Navigate command history
- Esc+Esc — Rewind or summarize
- Shift+Tab or Alt+M — Cycle permission modes
- Option+P (Mac) / Alt+P — Switch model
- Option+T (Mac) / Alt+T — Toggle extended thinking
- Option+O (Mac) / Alt+O — Toggle fast mode
- Hold Space — Push-to-talk voice (when enabled)

### Text Editing
- Ctrl+K — Delete to end of line
- Ctrl+U — Delete from cursor to line start
- Ctrl+Y — Paste deleted text
- Alt+Y (after Ctrl+Y) — Cycle paste history
- Alt+B — Move cursor back one word
- Alt+F — Move cursor forward one word

### Multiline Input
- \ + Enter — Quick escape newline
- Option+Enter — macOS default
- Shift+Enter — iTerm2, WezTerm, Ghostty, Kitty natively
- Ctrl+J — Control sequence newline

### Transcript Viewer
- Ctrl+E — Toggle show all content
- q / Ctrl+C / Esc — Exit transcript view
- / — Search transcript (navigate with n/N)

## Factual Corrections

1. Shift+Tab cycle: `default → acceptEdits → plan → auto` (auto conditional on Team plan + flag)
2. Plan mode context: offered as option, not automatic
3. Voice: built-in native feature since v2.1.69, not third-party only
4. 70/85/90 rule: community folklore, not official Anthropic data
5. ~80% CLAUDE.md adherence: anecdotal, not measured
6. /teleport: CLI flag (--teleport), not a slash command

## Missing Feature Areas (Full Details)

### Desktop App (Cowork)
- Visual diff review with comments
- Live app preview (embedded browser)
- Computer use (macOS screen control via Seatbelt sandbox)
- GitHub PR monitoring + auto-fix + auto-merge
- Auto git worktree isolation per session
- Dispatch integration (phone-to-Desktop task routing)
- Desktop scheduled tasks (survive restarts, 1-min minimum interval)
- SSH sessions to remote machines
- Cloud session push
- Connectors GUI (GitHub, Slack, Linear, Figma, Jira, etc.)

### Web App (claude.ai/code)
- Runs on Anthropic cloud infra, nothing local
- GitHub repo connection, auto-clone
- Creates ready-to-merge PRs
- Teleport to local CLI
- Mobile access (iOS/Android Claude app)
- Slack trigger (@Claude mention)
- Cloud scheduled tasks (1-hour minimum, no local access)

### VS Code Extension
- Inline diff review (Accept/Reject per file)
- Plan mode renders as full markdown document
- @-mentions with line ranges (Option+K inserts @file.ts#5-10)
- Multiple conversation tabs
- Resume remote sessions
- Chrome browser integration (@browser)
- Checkpoint rewind UI (hover message → Fork/Rewind)
- Graphical plugin manager
- Built-in IDE MCP server (getDiagnostics, executeCode)
- URI handler (vscode://anthropic.claude-code/open?prompt=...)

### Plugins & Marketplace
- Full marketplace system (marketplace.json in GitHub repos)
- Official Anthropic marketplace with 30+ plugins
- Categories: LSP (12+), integrations (GitHub, Slack, Linear, Figma, etc.), workflows, output styles, channels
- Three scopes: User, Project, Local
- /plugin TUI with Discover, Installed, Marketplaces, Errors tabs
- Creating plugins: GitHub repo + .claude-plugin/ structure

### Scheduling (Three Systems)
- Cloud: Anthropic infra, no machine needed, 1-hour min, no local access
- Desktop: Local machine, survives restarts, 1-min min, full local access
- /loop: Session-scoped, 1-min min, 3-day auto-expiry, inherits session context

### Sandbox Mode
- OS-level isolation (Seatbelt on macOS, bubblewrap on Linux)
- /sandbox to toggle
- 84% fewer permission prompts (Anthropic internal data)
- Configurable filesystem and network rules
- Open source: @anthropic-ai/sandbox-runtime

### Agent Teams (Experimental)
- Multiple Claude instances coordinating
- Team lead + teammates + shared task list + mailbox
- Teammates message each other directly (not just back to lead)
- Display: in-process or split panes (tmux/iTerm2)
- 3-5x token cost vs subagents
- Hooks: TeammateIdle, TaskCreated, TaskCompleted

### Status Line
- Configurable bottom bar, any shell script
- /statusline for guided setup
- Full JSON data: model, context %, cost, rate limits, session, vim mode, agent, worktree
- Multi-line, ANSI colors, OSC 8 links
- Community tools: ccstatusline, claude-statusline, starship-claude

### Channels (Research Preview)
- Telegram, Discord, iMessage push events into sessions
- Two-way: Claude can reply back
- fakechat localhost demo for testing
- Security: sender allowlists, pairing codes
- Distinct from Remote Control (push vs pull)

### Remote Control
- Steer CLI/VS Code sessions from phone/browser
- QR code for connection
- Full local file/MCP/tool access preserved
- Auto-reconnect on sleep/wake
- --spawn worktree for per-connection isolation

## Cross-Platform Feature Matrix

| Feature | CLI | VS Code | JetBrains | Desktop | Web |
|---|---|---|---|---|---|
| Core Claude coding | Yes | Yes | Yes | Yes | Yes |
| Visual diff review | No | Yes | Yes | Yes | Yes |
| Live app preview | No | No | No | Yes | No |
| Computer use | No | No | No | Yes | No |
| Dispatch | No | No | No | Yes | No |
| Remote Control | Yes | Yes | No | No | No |
| Channels | Yes | No | No | No | No |
| Agent teams | Yes | Via CLI | Via CLI | No | No |
| Sandbox mode | Yes | Via CLI | Via CLI | Yes | Auto |
| Status line | Yes | No | No | No | No |
| /loop scheduling | Yes | Yes | Via CLI | Yes | No |
| Fast mode | Yes | Yes | Via CLI | Yes | No |
| Plugins | Yes | Yes (GUI) | Via CLI | Yes | No |
| Git worktrees (auto) | Manual | Manual | Manual | Auto | N/A |
