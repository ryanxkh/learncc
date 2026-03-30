### MODULE 6B: INTEGRATIONS & AUTOMATION (50 min)

**Purpose:** Connect Claude to external tools, choose the right model for each task, and automate workflows.

**Module constraint:** Connect ONE MCP server (or confirm plugin coverage). Write ONE headless command. 5-minute troubleshooting cap on MCP — if it doesn't work, move on. Headless mode and fan-out patterns are DEVELOPER BRANCH only.

**Time limit:** 50 minutes. Break at 25 min (after MCP + sandbox). Hard stop at 55 min.

**BREAK POINT after Exercise 3 (~25 min):** "Good pause point. We've covered integrations and sandboxing. Next: model selection, automation, and surfaces."

**Opening Retrieval:** "When would you use a subagent instead of doing the research yourself in the main conversation?"

#### Exercise 6b.1 — MCP: Connecting Your Tools (3 min concept)
"MCP (Model Context Protocol) connects Claude to your other tools. Once connected, Claude can read from and write to those tools directly — no copy-pasting between apps."

"If you installed a plugin in Module 5a that connects to one of your tools (GitHub, Linear, Notion, etc.), you may already have an MCP connection. Type `/mcp` to check."

"MCP connections show up as additional tools Claude can use — like adding new senses."

#### Exercise 6b.2 — Connect an MCP Server (12 min, with 5-min troubleshooting cap)

**If they already have a plugin-based connection:**
"You're already connected via your plugin. Type `/mcp` to see the status. Try asking Claude something that requires your connected tool — 'Show me the open issues in [project]' or 'What's in my Notion workspace.'"

**If they don't have a connection yet:**

Role-adapted guidance:
- Developer: "Try connecting GitHub: `claude mcp add --transport http github https://mcp.github.com/mcp`. Or if you have a database: `claude mcp add --transport stdio postgres -- npx -y @modelcontextprotocol/server-postgres`"
- PM: "Try connecting Notion: `claude mcp add --transport http notion https://mcp.notion.com/mcp`. Or check if your project management tool has an MCP server."
- Non-technical: "Let's try connecting a tool you use. What are your main work tools? Tell Claude: 'Connect me to [tool name] via MCP' and it will walk you through the setup. If it requires an API key you don't have, ask someone technical on your team — the setup takes them about 5 minutes."

If their tools don't have MCP servers: "The MCP ecosystem is growing but doesn't cover every tool yet. That's okay — you can revisit this when your tools add support. For now, know that MCP exists and what it enables: Claude reading from and writing to your tools directly."

**5-minute troubleshooting cap:** If the connection doesn't work after 5 minutes of attempting: "MCP setup can be finicky — auth requirements, network configuration, and version compatibility all play a role. Let's note this for later and move on. You can debug it outside the course or ask someone technical to help."

#### Exercise 6b.3 — /sandbox: Isolated Execution (5 min)
"Try this now: type `/sandbox`."

"Sandbox mode puts Claude's commands in an OS-level isolation container. This means:"
- Claude can read and write files in your project without affecting anything outside it
- Network access is restricted to approved domains
- Permission prompts drop by about 84% — less interruption, same safety

"This is especially useful if you're running Claude on a codebase where you want guardrails against accidental destructive operations."

"Toggle it on and try running a task. Notice how many fewer permission prompts you get."

---

**>>> BREAK POINT <<<**
"Good stopping point. You've covered integrations (MCP) and safety (sandbox). Take a break if needed. Next up: model selection, automation, and a tour of Claude Code's surfaces."

---

#### Exercise 6b.4 — Model Selection (5 min)
"Claude Code can use different AI models — each with different strengths."

"Try this now: press Option+P (Mac) / Alt+P (Win/Linux) or type `/model`."

| Model | Strength | Speed | Cost | Best For |
|-------|----------|-------|------|----------|
| **Opus** | Smartest, deepest reasoning | Slower | Highest | Complex analysis, architecture, multi-step tasks |
| **Sonnet** | Strong all-around | Balanced | Moderate | Daily driver. Most tasks |
| **Haiku** | Fast, lightweight | Fastest | Lowest | Quick questions, formatting, simple lookups |

"The heuristic: Opus for hard problems, Sonnet for normal work, Haiku for quick tasks."

"/fast toggles fast mode — same Opus model but 2.5x faster at higher cost. Toggle with Option+O (Mac) / Alt+O. Best for rapid iteration when time matters more than cost."

"Try this now: switch to a different model, ask the same question, switch back. Notice the quality/speed tradeoff."

#### Exercise 6b.5 — Headless Mode (8 min)

**DEVELOPER PATH — full exercise:**
"Claude Code can run non-interactively — no conversation, just input → output. This is how you integrate Claude into scripts, CI pipelines, and automation."

"Try this now: `claude -p 'What day of the week is January 1, 2030?'`"

"Claude answers and exits. No session, no conversation. Just the result."

"Power flags for headless mode:"
| Flag | What It Does |
|------|-------------|
| `--allowedTools "Read,Bash(npm test)"` | Pre-approve specific tools (no prompts) |
| `--max-budget-usd 5.00` | Hard cost cap — stops if exceeded |
| `--max-turns 10` | Hard turn limit |
| `--output-format json` | Structured output for pipeline processing |
| `--bare` | Skip hooks, plugins, MCP — fastest startup for CI |
| `--json-schema '{...}'` | Enforce output matches a specific JSON schema |

"Try this now: pipe something real into Claude:"
`git diff | claude -p "review this diff for issues" --allowedTools "Read"`

"Fan-out pattern for batch processing:"
```bash
for file in src/components/*.tsx; do
  claude -p "Add TypeScript strict types to $file" --allowedTools "Edit" --max-turns 5
done
```
"Test on 2-3 files first. Then scale."

**PM PATH — abbreviated:**
"Claude can run as a one-shot tool: `claude -p 'Summarize the key themes from this quarter'`"
"This runs Claude, gets the answer, and exits — useful for quick automation. More advanced scripting is a developer pattern."

**NON-TECHNICAL PATH — brief mention:**
"There's a way to run Claude for quick one-off questions without a full conversation: `claude -p 'your question'`. You probably won't need this often, but it exists for automation."

#### Exercise 6b.6 — Scheduling (5 min)
"Claude can run tasks on a schedule — checking things, generating reports, monitoring status."

"Try this now: type `/loop 10m check if there are any new files in my project folder and tell me what you find`"

"This sets up a recurring task that runs every 10 minutes. Other examples:"
- `/loop 1h summarize any changes to the main branch`
- `/loop 30m check my inbox for urgent items` (if email MCP is connected)

"Three scheduling systems exist:"
| System | Runs On | Survives Restart | Best For |
|--------|---------|-----------------|----------|
| `/loop` | Your session | No | Quick recurring checks while you work |
| Desktop scheduled tasks | Your machine | Yes | Regular local tasks (daily reports) |
| Cloud scheduled tasks (`/schedule`) | Anthropic cloud | Yes | Tasks that run even when your computer is off |

"Start with /loop for simple things. Explore /schedule later for more robust automation."

#### Exercise 6b.7 — Surfaces Overview (5 min)
"Claude Code runs on multiple surfaces. Here's what's unique to each:"

**CLI (what you're using now):**
- Full command set (60+ slash commands)
- Status line customization
- Agent teams, channels
- Most powerful, most control

**Desktop App (Cowork):**
- Visual diff review with comments
- Live app preview (embedded browser)
- Dispatch — send tasks from your phone, they run on your desktop
- Computer use — Claude can interact with macOS apps directly
- Auto git worktree isolation per session

**Web (claude.ai/code):**
- Runs on Anthropic's cloud — nothing runs locally
- Works from any browser, including mobile
- Use `--teleport` to pull a web session to your local terminal

**VS Code / JetBrains:**
- Inline diff review with Accept/Reject
- @-mentions with line ranges (`@file.ts#5-10`)
- Multiple conversation tabs
- Graphical plugin manager

"Try these now: `/desktop` opens the Desktop app. `/remote-control` lets you steer this session from your phone (scan the QR code). `/mobile` shows a QR for the Claude phone app."

#### Module 6b Completion

**Capability statement:** "You can connect Claude to external tools via MCP, isolate execution with sandbox, choose the right model for each task, and automate workflows with headless mode and scheduling."

**Competency check:** "Give me a scenario where you'd use headless mode instead of interactive mode."

Expected: batch processing, CI/CD pipelines, one-off questions, scheduled automation — any case where you don't need back-and-forth conversation.

Update progress.json: mark module_6b as `"complete"`.

"Module 6b complete. One module left: Module 7 — The Meta Game. This is about continuous improvement, hidden features most users never discover, and putting everything together. It's the capstone. Ready?"

---

