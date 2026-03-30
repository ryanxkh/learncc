# Official Claude Code Documentation Inventory

Source: https://code.claude.com/docs/en/

## Surfaces / Environments
- Terminal CLI (full-featured, auto-updates natively)
- VS Code Extension (inline diffs, @-mentions, plan review)
- Desktop App (visual diff review, multiple sessions, scheduled tasks, Dispatch)
- Web (claude.ai/code, no local setup, cloud infra, parallel tasks, iOS support)
- JetBrains Plugin (IntelliJ, PyCharm, WebStorm)

## CLI Reference (Key Commands)
- `claude` — start interactive
- `claude "query"` — start with prompt
- `claude -p "query"` — non-interactive/SDK mode
- `cat file | claude -p "query"` — piped content
- `claude -c` — continue most recent conversation
- `claude -r "<session>"` — resume by ID or name
- `claude --worktree feature-auth` — isolated git worktree
- `claude --bare -p "..."` — minimal mode, faster startup
- `claude --agent <name>` — run as named subagent
- `claude agents` — list all configured subagents

## Notable CLI Flags
- `--add-dir` — additional working directories
- `--allowedTools` / `--disallowedTools` — tool scoping
- `--append-system-prompt` / `--system-prompt` — prompt customization
- `--bare` — skip hooks, skills, plugins, MCP, auto memory
- `--effort` — low/medium/high/max (Opus 4.6 only)
- `--json-schema` — validated JSON output matching schema
- `--max-budget-usd` — dollar cap for API calls
- `--max-turns` — limit agentic turns
- `--model` — set model (aliases: sonnet, opus, haiku)
- `--output-format` — text/json/stream-json
- `--permission-mode` — start in specific mode
- `--enable-auto-mode` — unlock auto mode in Shift+Tab cycle
- `--worktree` / `-w` — isolated git worktree
- `--remote` — create web session on claude.ai
- `--remote-control` / `--rc` — enable remote control
- `--teleport` — resume web session in local terminal

## Settings (4 Scopes)
1. **Managed** — server/MDM/registry/managed-settings.json (highest priority)
2. **User** — `~/.claude/settings.json` (personal, all projects)
3. **Project** — `.claude/settings.json` (team-shared, committed)
4. **Local** — `.claude/settings.local.json` (personal, this repo only)

Precedence: Managed > CLI args > Local > Project > User
Array settings MERGE across scopes (not replaced)

## Hooks (24 Events)
Core events: SessionStart, UserPromptSubmit, PreToolUse, PostToolUse, PermissionRequest, Stop, StopFailure
Subagent events: SubagentStart, SubagentStop, TaskCreated, TaskCompleted
Context events: PreCompact, PostCompact, InstructionsLoaded, ConfigChange
File events: CwdChanged, FileChanged
Other: Notification, WorktreeCreate, WorktreeRemove, Elicitation, ElicitationResult, TeammateIdle, SessionEnd

Handler types: command, http, prompt, agent

## Memory (Two Systems)
1. **CLAUDE.md** — you write, instructions/rules, every session
2. **Auto memory** — Claude writes, learnings/patterns, per working tree

CLAUDE.md locations: managed policy, project (`./CLAUDE.md`), user (`~/.claude/CLAUDE.md`)
Import syntax: `@path/to/import` (max 5 hops)
Rules directory: `.claude/rules/` with optional path-specific YAML frontmatter
Target: under 200 lines per file

## Sub-Agents
Built-in: Explore (Haiku, read-only), Plan (read-only), General-purpose (all tools), Bash, statusline-setup, Claude Code Guide
Custom: `.claude/agents/` (project) or `~/.claude/agents/` (user)
Frontmatter: name, description, tools, model, permissionMode, maxTurns, skills, mcpServers, hooks, memory, isolation

## MCP Servers
Transport: HTTP (recommended), SSE (deprecated), stdio (local)
Scopes: local (default), project (.mcp.json), user
Management: `claude mcp add/list/get/remove`
In-session: `/mcp` for status and OAuth

## Best Practices (Official)
1. Give Claude a way to verify its work (THE #1 recommendation)
2. Explore first, then plan, then code (4-phase workflow)
3. Provide specific context
4. Use rich content (@, images, URLs, piped data)
5. Write effective CLAUDE.md
6. Configure permissions
7. Use CLI tools
8. Set up hooks
9. Create skills
10. Create custom subagents
11. Session management (course-correct early, manage context aggressively)

## Documentation Gaps
- Exact auto mode classifier logic
- CLAUDE.md adherence tuning (beyond "IMPORTANT" / "YOU MUST")
- Session compaction behavior (what's preserved vs dropped)
- Cost optimization guidance
- Context window size limits (token counts)
- The actual system prompt (unpublished)
- Performance benchmarks for context degradation
- Rate limiting behavior
