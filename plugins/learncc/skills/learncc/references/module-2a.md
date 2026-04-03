### MODULE 2A: CLAUDE.MD & MEMORY (20 min)

**Purpose:** Plant the seed. Introduce CLAUDE.md as a lightweight starting point that grows over time — not a comprehensive setup exercise.

**Module constraint:** This module is SHORT. The learner creates a minimal CLAUDE.md (5-15 lines) and moves on. No critiquing. No rewriting. No @imports. No .claude/rules/. Those are Module 7 topics when the learner has real experience. If the learner wants to keep adding rules, say: "That instinct is right — and the best rules will come from actually using Claude Code over the next few modules. Let's keep moving."

**Time limit:** 20 minutes.

**Opening Retrieval:** "Quick recall from Module 1 — what did you learn about specificity? Why does giving Claude detailed context matter?"

#### Exercise 2a.1 — What Is CLAUDE.md? (3 min)

Explain what it is and why it matters. Connect to their work:

"CLAUDE.md is a file that Claude reads at the start of every session. It's standing instructions — context Claude can't figure out on its own. Things like your role, your preferences, your workflows, your tools."

"Right now, every time you start a new conversation with Claude, it starts from zero. It doesn't know what you do, how you like things formatted, or what tools you use. You end up repeating yourself. CLAUDE.md fixes that."

"The important thing: it starts light and grows over time. You don't write the whole thing today. You add to it as you work with Claude and discover what it needs to know. Think of it like onboarding notes — you write the basics now and add details as they come up."

#### Exercise 2a.2 — Generate a Starter (5 min)

"Try this now: type `/init`. Claude will scan your current directory and generate a starter CLAUDE.md."

If a CLAUDE.md already exists: "You already have one from a previous session — that's fine. Let's look at what's in it and build from there."

If /init generates code-focused content for a non-technical user: "That output is based on what's in this directory. We're going to replace it with content that matches YOUR work."

IMPORTANT: Do NOT tell the learner to cd anywhere, open a new session, or create a new directory. Work with whatever directory they're currently in. If they need a workspace later, that will happen naturally as they use Claude Code.

#### Exercise 2a.3 — Add Your Context (7 min)

This is the core exercise. The framing is NOT "what does Claude get wrong" — the learner hasn't used Claude enough to know that. The framing is: **what would Claude need to know about you and how you work to be useful from the first message?**

"Think about what Claude would need to know to help you without a lot of back-and-forth. This isn't about fixing mistakes — it's about giving Claude context it can't possibly guess."

"A few categories to think about:"
- **Who you are:** Your role, your domain, what you actually do day to day
- **How you work:** Tools you use, processes you follow, frameworks or conventions
- **Your preferences:** How you like things formatted, what tone to use, date formats, naming conventions
- **What you'd tell a new colleague:** The stuff that's obvious to you but not to someone who just joined

Role-adapted examples to spark thinking:
- Developer: "Your stack, your test runner, your branching convention, 'we use ESM not CommonJS'"
- PM: "Your PRD template structure, your stakeholder names, 'when I say competitive analysis I mean pricing + features + target market'"
- Non-technical: "Your date format, your file naming convention, 'when I say the report I mean the weekly safety compliance report'"

"Try this now: tell Claude what you want in your CLAUDE.md. You can say something like 'Update my CLAUDE.md with these things about how I work:' and list 3-5 things. Keep it short — 5 to 15 lines is perfect for a starting point. Pro tip: practitioners report that beyond ~100 lines, Claude starts ignoring instructions in the bottom half."

After they add their content: "That's a solid start. Here's the key thing to remember: this file grows over time. As you go through the rest of this course and start using Claude Code for real work, you'll notice moments where Claude doesn't know something it should. When that happens, add a line. Every few weeks, review it and cut anything that's not pulling its weight."

"For the most important rules, start the line with IMPORTANT: or YOU MUST — Claude follows those more reliably."

#### Exercise 2a.4 — Quick Look at Memory (3 min)

"One more thing. Claude also keeps its own notes about you — separate from your CLAUDE.md."

Do NOT tell the learner to type `/memory` — it opens a file editor (often vim) which will trap non-technical users. Instead, read the memory file yourself and show them what's there:

"Let me show you what Claude has remembered about you so far."

Read the auto memory files (check `~/.claude/projects/` for the relevant MEMORY.md) and summarize what's there. If nothing exists yet, say "Nothing yet — Claude will start building notes as you work together."

"The difference is simple: you write CLAUDE.md (your instructions to Claude). Claude writes memory (its notes about working with you). Both load every session. You control one, Claude controls the other. You'll see memory build up naturally as you use Claude Code — you don't need to do anything."

#### Module 2a Completion

**Capability statement:** "You have a working CLAUDE.md with your core context, and you know about auto memory. This file will get better the more you use Claude Code — we'll come back to advanced CLAUDE.md techniques in Module 7."

**Competency check:** "What's the difference between your CLAUDE.md and auto memory?"

Expected: CLAUDE.md is instructions you write. Memory is notes Claude writes. Both load every session.

Update progress.json: mark module_2a as `"complete"`.

"Module 2a complete. Next: Module 2b — permissions and settings. Quick module, about 20 minutes. This is where you control what Claude can and can't do without asking. Ready?"

---
