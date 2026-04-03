### MODULE 4: PLAN & VERIFY (45 min)

**Purpose:** The workflows that transform Claude Code from "helpful chatbot" to "structured work partner." Plan Mode, verification loops, and the interview pattern.

**Module constraint:** Time caps per exercise to prevent drift:
- Exercise 3 (Plan Mode practice): 12 min max
- Exercise 5 (Verification practice): 8 min max
- Exercise 6 (Interview pattern): 10 min max
If the learner is deep in real work, say: "This is great work — you can continue after the module. Let me make sure you've seen the verification pattern too, because it compounds with Plan Mode."

**Time limit:** 45 minutes. Within the adult attention span — no break point needed.

**Opening Retrieval:** "Without looking anything up — what does /compact do? And when would you use /btw instead of /clear?"

#### Exercise 4.1 — DO FIRST: Jump Straight In (5 min)
"Think of a multi-step task from your actual work — something with 3+ steps that Claude would need to figure out."

Role-adapted nudges:
- Developer: "Refactor a module into separate files, add tests, and update the imports."
- PM: "Create a competitive analysis of 5 tools — pricing, features, target market, and a recommendation."
- Non-technical: "Compare three vendor contracts on pricing, payment terms, insurance, and performance history."

"Try this now: ask Claude to do it directly. No planning. Just describe the task and hit Enter."

Let them work for 3-5 minutes. Then pull them back:
"Stop here. Let's look at what Claude produced."

#### Exercise 4.2 — Reflect (2 min)
"Did Claude nail it, or did it go off course? Specifically:"
- "Did it make assumptions you didn't intend?"
- "Did it miss steps or get the order wrong?"
- "Is the result what you'd actually use, or would you need to redo significant parts?"

"Most of the time, jumping straight in produces something 60-70% right. The last 30-40% is where Plan Mode pays for itself."

#### Exercise 4.3 — Plan Mode (5 min concept + 12 min practice, capped)
"Try this now: press Shift+Tab until you see 'plan' at the bottom of your screen."

"In Plan Mode, Claude reads, researches, and proposes — but it doesn't change anything. It's read-only exploration. Think of it like a blueprint review before breaking ground."

"Now ask the SAME task from Exercise 4.1. But this time, Claude will propose a plan instead of executing."

Interaction pattern — guide them through 2-3 refinement rounds:
"Look at Claude's plan. What would you change? Tell Claude — 'Actually, do X instead of Y' or 'Add a step for Z.' Go back and forth 2-3 times until the plan matches what you want."

**Ctrl+G — Open in Editor (developer path only):**
IMPORTANT: Only offer Ctrl+G to developer-path users. For PM and non-technical paths, skip this entirely — refining verbally works just as well and avoids the editor trap.

For developer path: "There's also Ctrl+G to open the plan in your text editor for direct annotation. Before trying it, check your editor: type `! echo $EDITOR`. If it says 'vim' or shows nothing, set it first:"
- Mac: `export EDITOR='open -t'` (opens TextEdit)
- Windows: `export EDITOR='notepad'`
"If that seems like too much setup, just skip it — refining the plan verbally works great."

"When you accept the plan, Claude will offer to clear the planning context for a clean implementation start. Usually say yes — it gives Claude a fresh window focused purely on execution."

After they accept and Claude implements:
"Compare this result to the Exercise 4.1 result. Notice the difference?"

#### Exercise 4.4 — The Comparison (3 min)
"You now have two versions of the same task: one without planning, one with."

Socratic: "What was different about the planned version? Was the extra time worth it?"

"Here's the rule of thumb: if a task touches 3+ files or has 3+ steps, Plan Mode is worth it. For single-file edits or one-step tasks, just ask directly."

#### Exercise 4.5 — Verification Loops (2 min concept + 8 min practice, capped)
"The single highest-leverage technique in Claude Code — giving Claude a way to check its own work."

"Without verification, Claude writes into the void. It produces plausible-looking output with no signal about whether it actually works. With verification, quality goes up 2-3x."

Role-adapted verification methods:
- Developer: "After implementing, run `npm test` (or your test command) and fix any failures. Keep iterating until all tests pass."
- PM: "After creating the analysis, verify each competitor's current pricing by checking their website. Flag anything that looks outdated."
- Non-technical: "After generating the report, check that every required section has data. Flag any sections that are empty or seem wrong. Verify the totals add up."

"Try this now: type /clear. Redo the SAME task from Exercise 4.1. But this time, include a verification instruction in your prompt. Start with the task description, then add: 'After you finish, [your verification method]. Fix anything that's wrong.'"

"Compare this result to the Plan Mode result. Notice the additional quality?"

#### Exercise 4.6 — The Interview Pattern (2 min concept + 10 min practice, capped)
"This pattern is especially powerful when you're starting something ambiguous — you know the goal but not all the details."

"Try this now: think of an upcoming project or task. Then say to Claude:"

"`I want to [describe your goal]. Interview me — ask me 5-10 clarifying questions about requirements, edge cases, and tradeoffs before you start anything.`"

"Claude will ask smart questions you might not have considered. Answer them honestly — 'I don't know' is a valid answer. After the interview, Claude generates a spec or plan based on your answers."

Role examples:
- Developer: "I want to add user authentication to this app. Interview me."
- PM: "I want to write a PRD for a notification system. Interview me."
- Non-technical: "I want to create a vendor evaluation process for our next contract renewal. Interview me."

"Review what Claude produced from the interview. This is structured brainstorming with an agent that asks good follow-up questions."

Socratic: "What question did Claude ask that you hadn't thought about?"

#### Exercise 4.7 — /plan and /diff (3 min)
"Two more commands for your toolkit:"

"`/plan` enters Plan Mode directly — alternative to pressing Shift+Tab multiple times. You can also include a description: `/plan redesign the onboarding flow`."

"`/diff` opens an interactive diff viewer. It shows what changed — not just the overall git diff, but per-turn diffs (what changed in each Claude response). Use left/right arrows to switch between views. Press `q` or Esc to exit back to your conversation."

**DEVELOPER BRANCH:**
"Two developer-specific commands: `/pr-comments` fetches GitHub PR review comments and loads them as context — Claude can then address each one. `/security-review` audits your pending changes for common security vulnerabilities."

#### Module 4 Completion

**Capability statement:** "You can now use Plan Mode for structured multi-step tasks, verification loops to 2-3x output quality, and the interview pattern to scope ambiguous projects. These three patterns compound — Plan Mode + verification + interviews is how power users work."

**Competency check:** "You have a brand new, complex task to tackle. Walk me through your approach from start to finish — which patterns would you use, in what order, and why?"

Expected: some form of "Plan Mode to scope → refine the plan → verify with [method] → iterate." Bonus if they mention the interview pattern for ambiguous requirements.

Update progress.json: mark module_4 as `"complete"`.

"Module 4 complete. This is the module every test user rated as the most valuable. The patterns you just learned will change how you work starting today. Next: Module 5a — Skills & Plugins. This is where you start building reusable capabilities into your workspace. Ready?"

---

