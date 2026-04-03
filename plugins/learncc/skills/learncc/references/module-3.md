### MODULE 3: CONTEXT MASTERY (50 min)

**Purpose:** The single highest-leverage skill in Claude Code. Context management is what separates beginners from power users.

**Module constraint:** 11 exercises, NONE exceeding 7 minutes. The core insight is "context is finite, manage it proactively." If the learner drifts into implementation details (how compaction works internally, exact token counts), redirect: "The exact mechanics change with each release. What matters is the BEHAVIOR: when context fills, quality drops. Let's focus on what you DO about it."

**Time limit:** 50 minutes. Force checkpoint at 45 min.

**BREAK POINT after Exercise 6 (at ~30 min):** "Good stopping point. We've covered the most important context skills — /compact, /btw, and /context. Take a break if you need one. When you're ready, we'll cover session management and data input."

**Opening Retrieval:** "Quick recall — what's the difference between your CLAUDE.md and auto memory? When would you edit one vs. the other?"

#### Exercise 3.1 — /context: See Your Fuel Gauge (2 min)
"Try this now: type `/context`."

"This visualizes your context window — how much is used, what's consuming space, and optimization suggestions. Think of it as a fuel gauge for your conversation."

"Notice the percentage. Remember this number — we'll come back to it."

#### Exercise 3.2 — Experience Degradation (5 min)
"Try this now: have 5-6 back-and-forth exchanges with Claude on a topic — go deep. Then, WITHOUT clearing, ask something completely unrelated."

"Notice anything about the quality of that last response? It might reference your earlier topic, give a less focused answer, or just feel... less sharp."

Caveat (deliver even if they don't notice): "You might not see obvious degradation in a short conversation. It becomes very noticeable after 15+ exchanges, or when you've loaded large files with @. The pattern is real — the longer the conversation, the worse Claude performs. Run /context again and compare the percentage to before."

#### Exercise 3.3 — The Core Concept (2 min, max 300 words)
"Here's the most important thing in this entire course:"

"Claude's context window is finite. Every message, every file it reads, every tool it uses — all of it fills the same bucket. As that bucket fills, quality degrades. Community users report noticeable precision drops around 70% capacity, with more serious issues above 85%. These are rough thresholds from practitioners, not official metrics — but the pattern is well-documented."

"Three things you can do about it:"
1. **/compact** — shrink the conversation without losing it (next exercise)
2. **/clear** — nuclear option, start completely fresh
3. **/btw** — ask side questions that never enter the context at all

"Master these three and you'll outperform 90% of Claude Code users."

#### Exercise 3.4 — /compact with Targeted Instructions (5 min)
"Try this now: type `/compact`."

"Your conversation history just compressed. But here's the power move — you can CONTROL what survives:"

"Try this now: type `/compact Focus on [your main topic from Exercise 3.2], discard the unrelated tangent.`"

"Notice how targeted instructions produce a more useful summary. You're telling Claude what matters."

**Power tip:** "You can automate this. Tell Claude: 'Add a Compact instructions section to my CLAUDE.md that says to always preserve the current task goal and discard tangents.' Claude will edit the file for you."

Socratic: "When would you /compact vs /clear? What's the tradeoff?"

#### Exercise 3.5 — /btw: The Side Question That Doesn't Cost Context (5 min)
"This is one of the most useful features most users never discover."

"Try this now: type `/btw What year was the Declaration of Independence signed?`"

"Notice: the answer appeared in an overlay and disappeared. It NEVER entered your conversation history. Your context didn't grow at all."

"Key detail: **/btw works WHILE Claude is already processing a response.** You don't have to wait. If Claude is in the middle of generating something and you have a quick question — /btw."

Role-adapted practice:
- Developer: "/btw What's the correct TypeScript syntax for a generic constraint?"
- PM: "/btw What's the current market cap of Salesforce?"
- Non-technical: "/btw What's the standard margin size for a business letter?"

#### Exercise 3.6 — Practice /btw While Claude Works (2 min)
"Try this now: ask Claude a complex question that will generate a long response. While Claude is writing, type /btw with a quick side question."

"Notice: your side question got answered without interrupting Claude's work. This is how you look things up without polluting your main conversation."

---

**>>> BREAK POINT <<<**
"Good stopping point. You now know the three most important context skills: /context to monitor, /compact to manage, and /btw for side questions. These alone will transform your Claude Code experience."

"Take a break if you need one. When you're ready, we'll cover session management — how to organize, save, and resume your work."

---

#### Exercise 3.7 — Session Management (5 min)
"Claude Code conversations are called sessions. You can name them, exit, and come back."

"Try this now: type `/rename` followed by a descriptive name for this session. Example: `/rename learncc-module-3`"

"Your session now has a name — visible in the prompt bar. Three ways to get back to sessions:"
- `claude --continue` (or `claude -c`) — picks up the most recent session in this directory
- `claude --resume` (or `claude -r`) — shows a picker of all your sessions. Search, filter, select
- `/resume` from inside Claude Code — switch to a different session

"The rewind feature: press **Esc+Esc** (double-tap Escape). This opens a menu where you can restore your conversation, your code, or both to any previous checkpoint. Every time you send a message, Claude creates a checkpoint. They persist even if you close the terminal."

Practice: "Let's try the full cycle. First, /rename this session to something memorable."

"Now I'm going to have you exit Claude Code and come back — this is the ONE exercise in the course that requires leaving. When you press Ctrl+D, your terminal will go back to the normal command line (the one with `%` or `$` from the beginning). Don't worry — your conversation is saved and your files are untouched."

"Try this now: press Ctrl+D to exit. You'll see your regular terminal prompt. Make sure you're in the same folder, then type `claude --continue` to pick up right where you left off."

(Wait for them to complete the exit/resume cycle.)

#### Exercise 3.8 — @ File References (5 min)
"You can point Claude at specific files by typing `@` followed by the filename. This adds their content to the conversation precisely — no guessing, no exploration needed."

Role-adapted examples:
- Developer: "`@src/auth/login.ts` explain how authentication works here"
- PM: "`@meeting-notes-march.md` summarize the key decisions and create action items"
- Non-technical: "`@budget-q2.csv` what's the total spend for Q2? Which vendor is highest?"

"Try this now: type `@CLAUDE.md` followed by 'summarize what's in this file.' Claude will read your CLAUDE.md and respond based on its contents."

"If you have other files in your workspace — documents, spreadsheets, notes — you can reference those too. Just type `@` followed by the filename."

"You can reference multiple files: `@file1.md and @file2.md compare these two documents`"

"You can reference a folder to see its contents: `@src/components/` lists everything in that directory."

Important note: "Claude sees LOCAL files only — files on your computer. Network drives and cloud documents (Google Docs, Notion) can't be referenced with @ directly. We'll cover connecting to cloud tools in Module 6b."

#### Exercise 3.9 — Piping Data In (3 min)

**DEVELOPER PATH:**
"You can pipe data directly into Claude from the command line:"
- `git diff | claude -p "review this diff for bugs"`
- `cat error.log | claude "explain this error and suggest a fix"`
- `npm test 2>&1 | claude -p "analyze these test failures"`

"The `|` (pipe) sends the output of one command as input to Claude. Much faster than copy-pasting."

"Try this now: pipe something into Claude. `ls -la | claude -p 'describe these files'` is a simple one to start with."

**PM PATH:**
"You can send file contents directly to Claude: `cat report.csv | claude 'summarize the key findings'`. This is faster than @ for quick one-off analysis. But for most PM work, @ references are simpler."

**NON-TECHNICAL PATH:**
Skip this exercise. Say: "There's a technique called piping for sending data to Claude from other commands. It's a power-user shortcut — @ references do the same job in a friendlier way. We'll skip this for now."

#### Exercise 3.10 — /effort and Extended Thinking (3 min)
"Claude can think harder on complex problems. The `/effort` command controls this."

"Try this now: type `/effort max`. Then ask a complex reasoning question — something with multiple factors to weigh."

"Now type `/effort low` and ask the same question. Notice the difference in depth?"

| Level | Best For | Speed | Cost |
|-------|---------|-------|------|
| low | Quick formatting, simple lookups | Fastest | Lowest |
| medium | Standard daily work | Balanced | Balanced |
| high | Multi-step analysis, debugging | Slower | Higher |
| max | Complex reasoning, architecture decisions (Opus only) | Slowest | Highest |

"You can also toggle thinking with Option+T (Mac) / Alt+T (Win/Linux). Use high effort when quality matters, low when speed matters. Note: higher effort levels use more of your usage allowance. Switch back to medium when you're done experimenting."

#### Exercise 3.11 — Utility Commands (3 min)
"Three quick tools for getting stuff out of Claude Code:"

**`/copy`** — "Copies Claude's last response to your clipboard. `/copy 3` gets the third-most-recent response."
(Developer path only: "Bonus: press `w` in the picker to write directly to a file — useful over SSH.")

**`/export`** — "Saves the entire conversation as a text file. Great for creating handoff documents or archiving useful sessions."

**`Ctrl+O`** — "This opens a full-screen transcript view. Press `q` to get back to your conversation. While in there, press `/` to search for something specific, and `n`/`N` to jump between matches. This is how you find that thing Claude said 20 messages ago."

"Try one of these now."

#### Module 3 Completion

**Capability statement:** "You can now manage context proactively with /compact and /clear. You can use /btw for side questions that don't cost context. You can navigate sessions, reference files precisely, control thinking depth, and extract Claude's output. Context mastery is the single biggest differentiator between a beginner and a power user — and you have it."

**Competency check:** "Scenario: You're 30 minutes into a deep conversation and Claude's responses are getting vague and repetitive. Walk me through exactly what you'd do."

Expected answer should include some combination of:
- Check /context to see usage percentage
- /compact with targeted instructions to preserve what matters
- If very high: /clear and start fresh with a better initial prompt
- Use /btw for side questions to avoid future context bloat
- Consider using subagents for research (preview of Module 5b)

If they mention /clear only: "That works but you lose everything. /compact lets you keep going while freeing space. Even better: check /context first to see if you actually need to act."

Update progress.json: mark module_3 as `"complete"`.

"Module 3 complete. You've now covered the foundations — workspace setup and context management. Next: Module 4 — Plan & Verify. This is where Claude Code transforms from 'helpful chatbot' to 'structured work partner.' It's the module every simulation persona rated as the best in the course. Ready?"

---

