### MODULE 6A: PARALLEL WORK (40 min)

**Purpose:** Work on multiple things simultaneously using parallel sessions, conversation forking, and the writer/reviewer pattern.

**Module constraint:** Git worktrees are DEVELOPER-ONLY. Non-technical path teaches parallel terminal tabs only and completes in ~25 min. If the non-technical path finishes early, move to Module 6b.

**Time limit:** 40 minutes.

**Opening Retrieval:** "What's the difference between a skill, a hook, and a subagent? Quick — one sentence each."

#### Exercise 6a.1 — Parallel Sessions Concept (3 min)
"Up to now, you've been working in one Claude session at a time. But you can run multiple sessions simultaneously — each with its own independent context."

"Think of it as having multiple assistants in separate rooms. They don't share notes, they don't interfere with each other, and they can all work at the same time."

"This is one of the few exercises in the course where you'll leave this conversation briefly. To run parallel sessions, you need a second terminal window. Don't worry — this session stays exactly where it is."

"Try this now: open a new terminal window."
- Mac: Cmd+N (or Cmd+T for a new tab)
- Windows/Linux: Ctrl+Shift+N
- VS Code: click the + in the terminal panel

"In the new window, type `claude`. You now have two completely independent Claude sessions. Switch between them — this one is still here."

"Switch between the windows. Notice: they have no idea about each other. Different context, different conversation, different state."

#### Exercise 6a.2 — /branch: Fork a Conversation (5 min)
"Sometimes you want to explore two directions from the same starting point — without losing either."

"Try this now: in your main session, type `/branch` (or `/fork`). Claude creates a copy of your current conversation."

"Now you have two conversation branches from the same point:"
- In one branch: explore approach A
- In the other: explore approach B
- Compare results and pick the better path

Role-adapted examples:
- Developer: "Branch and try two different architectures for the same feature."
- PM: "Branch and explore two different positioning strategies."
- Non-technical: "Branch and try two different formats for the same report."

Pro tip: "After branching, `/color` each branch differently (e.g., `/color blue` vs `/color green`) so you always know which approach you're looking at."

#### Exercise 6a.3 — DEVELOPER BRANCH: Git Worktrees (10 min)

**Developer path only. PM and non-technical: skip to Exercise 6a.4.**

"Worktrees take parallel sessions further — each session gets its own isolated copy of your entire repo on a separate git branch."

"Try this now: `claude --worktree experiment` (or `claude -w experiment`)."

"This creates:"
- A new directory at `.claude/worktrees/experiment/`
- A new git branch called `worktree-experiment`
- A fresh Claude session operating in that isolated copy

"Do some work in the worktree. When you exit:"
- If you made no changes → the worktree auto-deletes (clean)
- If you made changes → Claude asks if you want to keep or remove it

"Tips for worktree power users:"
- Add `.claude/worktrees/` to your `.gitignore`
- Create a `.worktreeinclude` file to copy `.env` and other gitignored files into worktrees automatically
- `/color red` in one worktree, `/color blue` in another — visual distinction at a glance

"The golden rule: **NEVER parallelize the same problem space.** Two Claude instances working on overlapping files creates confusion that compounds quickly. One feature per worktree."

#### Exercise 6a.4 — /color: Visual Distinction (2 min)
"When running multiple sessions, color-coding prevents confusion."

"Try this now: in one session, type `/color blue`. In another session, type `/color green`."

"Available colors: red, blue, green, yellow, purple, orange, pink, cyan, or any hex value."

"Pick a color for your main session and a different one for experimental work."

#### Exercise 6a.5 — Background Work (5 min)
"You can send a running task to the background and keep working in the same session."

"Try this now: ask Claude to do something that takes a moment — read several files, generate something lengthy. While Claude is working, press **Ctrl+B**."

"The task moves to the background. You can now type a new prompt. Press **Ctrl+T** to see your task list — running, completed, and pending tasks."

"This is useful when you don't need to watch Claude work — start a task, background it, do something else, check back when it's done."

#### Exercise 6a.6 — Writer/Reviewer Pattern (10 min)
"This is the most powerful parallel pattern: one session creates, another reviews from a clean perspective."

"The key insight: a session that WROTE something has inherent bias toward its own output. A fresh session reviewing the same work catches things the author missed — because it has no emotional investment and no context pollution from the creation process."

"Try this now:"
1. "In Session A: create something from your work — a document, some code, an analysis, a proposal"
2. "In Session B (fresh): ask Claude to review what Session A created. Reference the file with @."

Role-adapted:
- Developer: "Session A writes a function. Session B reviews it for bugs, edge cases, and performance."
- PM: "Session A writes a PRD. Session B reviews it for completeness, missing edge cases, and unclear requirements."
- Non-technical: "Session A drafts a report. Session B reviews it for errors, missing sections, and unclear language."

"Compare Session B's review to what you would have caught yourself. The fresh-context review is almost always sharper."

Socratic: "Why is a fresh-context review better than asking the same session to review its own work?"

#### Module 6a Completion

**Capability statement:**
- Developer: "You can run parallel sessions in isolated worktrees, fork conversations to explore alternatives, background tasks, and use the writer/reviewer pattern for quality."
- PM / Non-technical: "You can run multiple sessions on different tasks, fork conversations to explore alternatives, and use the writer/reviewer pattern to get unbiased reviews."

**Competency check:** "Why is a fresh-context review better than self-review in the same session?"

Expected: The reviewing session has no bias from having written the work, and its context isn't polluted with the creation process. It approaches the work like a new reader would.

Update progress.json: mark module_6a as `"complete"`.

"Module 6a complete. Next: Module 6b — Integrations & Automation. This is about connecting Claude to your other tools, choosing the right model for each task, and automating workflows. Longer module (~50 min) with a break point. Ready?"

---

