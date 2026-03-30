# LearnCC Quality Audit: Session Discipline, UX, Cohort, & Goal State

> Final pre-build audit. Every recommendation is concrete and implementable.

---

## Table of Contents

1. [Module-by-Module Analysis (A-E)](#module-by-module-analysis)
2. [System-Level Concerns (F-H)](#system-level-concerns)
3. [Recommended System Prompt Language](#recommended-system-prompt-language)
4. [Priority Matrix](#priority-matrix)

---

## Module-by-Module Analysis

### Module 0: Orientation + Surfaces (10 min)

**A. Session Discipline Risks**

- **Drift risk: LOW.** This module is diagnostic, not instructional. The main danger is the learner volunteering a long backstory about their career ("Let me tell you about my whole setup...") and the tutor engaging with it instead of routing.
- **Off-track question:** "Can you explain what Claude Code actually is?" — This belongs in Module 1, not here.
- **Guardrail needed:** The tutor must collect exactly 3 data points (role, experience, competency answers) and route. No teaching happens here.

*System prompt language:*
```
MODULE 0 CONSTRAINT: Your ONLY job is to collect the learner's profile and route them.
Do NOT teach, explain features, or answer "how do I..." questions. If the learner
asks a feature question, say: "Great question — we'll cover that in [Module N].
Let me finish getting to know you first so I can tailor the course."
Collect: (1) role/domain, (2) CC experience level, (3) competency check answers.
Then route. Total time: under 10 minutes.
```

**B. Time Management**

- 10 minutes is realistic if the tutor stays disciplined. Risk is over-explaining the routing decision. The tutor should state the routing in 1-2 sentences, not justify it.
- **Maximum time before forced checkpoint: 12 minutes.** After 12 min, the tutor should say: "Let me route you now based on what I've heard."

**C. Clear Completion Signals**

- Completion signal: "Based on your answers, I'm starting you at Module [N]. Here's what we'll cover and why."
- The tutor should NOT ask "Does that sound right?" — just route. The learner can object if they want to.

**D. Diverse Cohort Handling**

- **Critical adaptation:** The competency check questions assume familiarity with CC terminology. "What's the difference between /clear and /compact?" means nothing to someone who has never opened CC.
- **Fix:** Frame the competency check as "I'll ask a few questions — it's totally fine to say 'I don't know.'" Score 0 "I don't know" answers as beginner. Do not make the learner feel tested.
- **Non-technical routing:** If the learner says they've never used a terminal, route to Module 0.5 immediately. Don't ask the competency questions — they're irrelevant.

**E. Goal State Verification**

- After Module 0, the learner knows: where they're starting, what the course covers, and which surface they should use (CLI, Desktop, Web, VS Code).
- This is not measurable in the traditional sense — it's a routing checkpoint. Verification = the learner confirms they're ready to proceed.

---

### Module 0.5: Terminal Basics (17 min, non-technical only)

**A. Session Discipline Risks**

- **Drift risk: MEDIUM.** The learner may ask questions about what each command does, what other commands exist, etc. The tutor must teach only the 7 items listed (terminal anatomy, Enter sends, arrow keys, files/folders, shortcuts, flags, local files) and nothing more.
- **Off-track pull:** "What's the difference between Terminal and Command Prompt?" or "Should I use zsh or bash?" These are valid questions but tangential. Park them.
- **Guardrail:** The tutor must not teach Unix commands beyond what's needed for CC. This is not a terminal course — it's terminal literacy for CC.

*System prompt language:*
```
MODULE 0.5 CONSTRAINT: You are teaching ONLY enough terminal knowledge to use
Claude Code. Do NOT teach shell scripting, Unix commands, or terminal customization.
If the learner asks about commands beyond what's listed here, say: "That's useful
to know eventually, but for Claude Code you won't need it. Let's keep going."
Cover exactly these 7 topics, then move to Module 1. Target: 17 minutes.
```

**B. Time Management**

- 17 minutes is tight but achievable. The risk is the learner getting stuck on "what is a file path" — which could eat 5+ minutes.
- **Built-in checkpoint at 15 min:** "We've covered enough for you to work with Claude Code. You can always ask Claude to explain terminal things as you go. Let's move on."

**C. Clear Completion Signals**

- "You now know enough about the terminal to use Claude Code. Everything else, Claude can help you with. Let's start Module 1."
- No formal competency check — this module is about removing a blocker, not building mastery.

**D. Diverse Cohort Handling**

- This module only exists for non-technical users. The system prompt should verify it's needed: "Before we start, have you used a terminal before?" If yes, skip or abbreviate.
- **Windows users:** The module should note that Terminal/PowerShell is the equivalent. The tutor should detect the OS from context if possible.

**E. Goal State Verification**

- After this module, the learner can: open a terminal, navigate to a directory, understand what Claude Code will look like when it runs. Verified by having them run `claude` and confirm they see the interface.

---

### Module 1: First Contact + /voice (30 min)

**A. Session Discipline Risks**

- **Drift risk: HIGH.** This is the "explore" module. The learner's first real conversation with CC can go anywhere — they might get excited and want to do 10 things, or they might hit a wall and start asking meta-questions about AI.
- **Off-track pulls:**
  - "How does Claude Code actually work under the hood?" (tangent)
  - "Can Claude Code do [advanced thing]?" (Module 5-6 territory)
  - "What's the best way to set it up?" (Module 2)
  - The learner starts a real project and wants to finish it (scope creep)
- **Critical guardrail:** After the first free-form conversation (Exercise 1), the tutor must pull the learner back. The first exercise is deliberately unstructured, but everything after it is guided.

*System prompt language:*
```
MODULE 1 CONSTRAINT: After Exercise 1 (free exploration), gently redirect
the learner back to the exercise sequence. If they want to continue working
on something, say: "That's a great start — we'll come back to real tasks later.
For now, let me show you a few essential controls that will make everything
you just did work better." If the learner asks about CLAUDE.md, settings,
or advanced features, say: "That's Module [N] — we'll get there.
Right now, let's nail the basics."
```

- **Voice (/voice) timing:** The simulation data says to introduce /voice early for non-technical users. The tutor should introduce it RIGHT AFTER Exercise 1 for non-technical profiles, and as a sidebar mention for technical profiles.

**B. Time Management**

- 30 minutes is realistic for 7 exercises. However, Exercise 1 (free conversation) can eat 10+ minutes if the learner gets into it. The tutor should cap Exercise 1 at 5-7 minutes.
- **Checkpoint at 25 min:** "We're wrapping up the basics. Let me make sure you've got the essentials before we move on."
- Risk: Exercise 5 (rewrite the same prompt with more specificity) could be redundant for experienced users. The tutor should abbreviate or skip for technical profiles.

**C. Clear Completion Signals**

- "You can now have a productive conversation with Claude Code, use /help to discover commands, /clear to reset, Esc to stop, and you know that specificity drives quality. That's Module 1. Ready for Module 2?"
- **Competency verification:** Ask "Before we move on — if Claude's responses started getting worse during a long conversation, what would you try?" The answer should include /clear or starting fresh. If they can't answer, briefly revisit.

**D. Diverse Cohort Handling**

- **Non-technical:** Replace `! ls` and `! pwd` with `! date` or `! echo hello`. The concept (running your own commands) is the same; the commands are universally understandable.
- **Experienced developers (Marcus profile):** Exercises 1-3 may feel slow. The tutor should detect confidence and compress: "Sounds like you're comfortable with the basics. Let me show you the three things most people miss." Then jump to /voice, Esc, and the specificity comparison.
- **PM profile:** Exercise 1 prompt should be about their actual PM work: "Describe a product decision you're wrestling with."
- **Critical:** /voice introduction needs role-branching. For Roberto-type users, frame it as the primary input method. For developers, frame it as a speed boost for complex prompts.

**E. Goal State Verification**

- **Measurable:** The learner can start a conversation, describe a task clearly enough to get a useful response, and use /clear, Esc, and /help.
- **Demonstration:** The "rewrite with specificity" exercise (Exercise 5) IS the competency demonstration. The quality difference between their first and second attempt shows learning.

---

### Module 2a: CLAUDE.md & Memory (40 min)

**A. Session Discipline Risks**

- **Drift risk: HIGH.** CLAUDE.md is a rabbit hole. The learner will want to make it perfect, ask about every possible rule, and debate best practices. The tutor must enforce "good enough now, iterate later."
- **Off-track pulls:**
  - "What should I put in my CLAUDE.md for [specific technology]?" (too detailed for this module)
  - "How does auto memory actually work technically?" (implementation detail, not relevant)
  - "Can I see an example of a really good CLAUDE.md?" (fine to show briefly, but don't let it become a 15-minute discussion)
  - "What about .claude/rules/?" (valid, but keep it brief — it's an alternative, not the focus)
- **Guardrail:** The tutor should limit CLAUDE.md iteration to TWO passes: first draft, then refinement. Not three. Not five.

*System prompt language:*
```
MODULE 2a CONSTRAINT: The learner will want to perfect their CLAUDE.md.
Limit them to TWO passes: (1) first draft with no guidance, (2) refinement
after best practices. If they want to keep iterating, say: "Your CLAUDE.md
is a living document — you'll refine it throughout the course and beyond.
What you have now is solid enough to move forward." Do NOT let CLAUDE.md
creation consume more than 20 minutes of the 40-minute module.
```

**B. Time Management**

- 40 minutes for 9 exercises is tight. The breakdown:
  - Exercise 1-2 (CLAUDE.md creation + review): 15 min
  - Exercise 3-4 (best practices + rewrite): 10 min
  - Exercise 5-6 (settings hierarchy + /status): 7 min
  - Exercise 7-8 (memory + @import): 5 min
  - Exercise 9 (practice @import): 3 min
- **Risk:** Settings hierarchy (Exercise 5) is abstract and can drag. For non-developers, keep it to "there are 4 levels, project settings override personal ones, you mostly only care about two." Don't teach all 4 scopes in depth.
- **Checkpoint at 35 min:** If they're still on CLAUDE.md, skip to the @import concept and wrap up.

**C. Clear Completion Signals**

- "You now have a working CLAUDE.md tailored to your work. You understand that Claude remembers things via auto memory, and you know about @imports for organizing instructions. Module 2a complete."
- **Verification:** "Without looking — what's the difference between your CLAUDE.md and auto memory? When would you edit one vs. the other?"

**D. Diverse Cohort Handling**

- **Non-technical (Roberto):** "Create a file called CLAUDE.md in your project root" is a blocker. He doesn't know what a project root is, or how to create a file. The tutor MUST either (a) have Claude create the file for him, or (b) walk him through it step by step.
- **Fix for all non-technical users:** Replace "Create a file called CLAUDE.md" with "Tell Claude: 'Create a CLAUDE.md file for me with some starter rules for [my domain].' Then we'll review and refine what it made."
- **PM (Sarah):** Provide a PM-specific starter template (20 lines) as a reference. Don't just tell her to "write rules" — she doesn't know what rules are relevant.
- **Developer (Marcus):** Can write CLAUDE.md from scratch. The tutor should focus on the pruning discipline: "What in your CLAUDE.md does Claude already know from reading the code?"

**E. Goal State Verification**

- **Measurable:** The learner has a CLAUDE.md file in their project. It contains role-specific rules. They can explain the difference between CLAUDE.md and auto memory.
- **Demonstration:** The CLAUDE.md exists. The tutor can read it and verify it's not empty, not overly generic, and not a copy-paste.

---

### Module 2b: Settings & Permissions (20 min, developer branches)

**A. Session Discipline Risks**

- **Drift risk: MEDIUM.** Settings are boring but deep. The tutor could get pulled into explaining every setting key. The learner might ask "what does this one do?" for 15 different settings.
- **Off-track pull:** "How do I set up permissions for my team?" (valid but can become a 20-minute tangent about organizational policy)
- **Guardrail:** Cover the Shift+Tab cycle, the concept of 4 scopes, and permission allow/deny rules. That's it. Everything else is reference material.

*System prompt language:*
```
MODULE 2b CONSTRAINT: Settings is a reference topic, not a mastery topic.
Cover: (1) permission mode cycle (Shift+Tab), (2) the 4 scopes (1 sentence each),
(3) one practical permission rule the learner would actually use.
Do NOT enumerate all settings keys. If the learner asks about specific settings,
say: "That's in the settings reference — you can explore it anytime. Let's focus
on the permissions setup that will affect your daily workflow."
Target: 20 minutes maximum.
```

**B. Time Management**

- 20 minutes is generous for the core content, which is really about 12 minutes of material. The extra 8 minutes is buffer for questions.
- **Risk of running short:** If the learner is a non-technical user, they may not care about settings at all. The tutor should detect this and compress: "The main thing to know is that Shift+Tab changes how much Claude asks permission for. Try it now. That's the most useful setting."
- **Checkpoint at 18 min:** Move on regardless.

**C. Clear Completion Signals**

- "You know how to control Claude's permission behavior and where settings live. Module 2b complete."
- **Minimal verification:** "Show me how you'd switch Claude to Plan Mode right now." (Shift+Tab)

**D. Diverse Cohort Handling**

- **Non-technical:** The 4-scope hierarchy is irrelevant. Teach only: "Shift+Tab changes Claude's behavior. That's the one thing to remember." Skip managed settings, env blocks, and JSON config.
- **Developer:** This is where they care. Cover permission allow/deny rules, the env block in settings.json, and project vs. local settings.
- **PM:** Brief. "Settings let you control how much Claude asks before doing things. The default is fine for now."
- **Role-branching is critical here** — this module is half the time for non-technical users (10 min) and full time for developers (20 min).

**E. Goal State Verification**

- **Measurable:** The learner can cycle permission modes with Shift+Tab and understands that settings exist in multiple scopes.
- **Demonstration:** They cycle through modes and identify which mode they're in.

---

### Module 3: Context Mastery (50 min)

**A. Session Discipline Risks**

- **Drift risk: HIGH.** Context management is the deepest conceptual module. The learner might want to:
  - Debate the 70/85/90 thresholds (which are community folklore, not hard science)
  - Experiment endlessly with /compact to see what survives
  - Get into session management edge cases ("What if I resume a session from 3 weeks ago?")
  - Ask about token counting, context window sizes, pricing
- **Off-track pulls:**
  - "How does compaction actually work?" (implementation detail)
  - "What's the exact context window size?" (varies by model, not actionable)
  - "Can I see how much context I'm using?" (actually /context — teach it, it's in the module)
- **Guardrail:** The core insight is "context is finite, manage it proactively." Everything else supports that one idea. If discussion drifts to implementation details, redirect to behavior.

*System prompt language:*
```
MODULE 3 CONSTRAINT: This module has 11 exercises. Do NOT let any single exercise
exceed 7 minutes. The core skill is proactive context management. If the learner
wants to explore implementation details (how compaction works, exact token counts,
context window internals), say: "The exact mechanics change with each release.
What matters is the BEHAVIOR: when context fills up, quality drops. Let's focus
on what you DO about it." Keep the ratio: brief concept, then practice.
Force a checkpoint at 45 minutes.
```

**B. Time Management**

- 50 minutes for 11 exercises is the tightest pacing in the course. Breakdown:
  - Exercise 1-2 (experience degradation + reflect): 8 min
  - Exercise 3-4 (70/85/90 rule + /compact practice): 8 min
  - Exercise 5-6 (/btw concept + practice): 6 min
  - Exercise 7-8 (session management + practice): 10 min
  - Exercise 9 (@references): 5 min
  - Exercise 10-11 (piping concept + practice): 8 min
  - Buffer: 5 min
- **Risk of running long:** Exercise 1 (experience degradation firsthand) requires 5-6 back-and-forths. This could take 10+ minutes. The tutor should set expectations: "Have 5-6 exchanges, then try something unrelated. Don't spend more than 5 minutes on this."
- **Risk of running long #2:** Session management (Exercise 7-8) involves exiting and re-entering CC. This breaks the tutoring session. The tutor needs to account for this.
- **Built-in break point at 30 min:** After /btw practice (Exercise 6). "Good stopping point if you need a break. We've covered the most important context skills. The next section covers session management and data input."

**C. Clear Completion Signals**

- "You can now manage context proactively (/compact, /clear), use /btw for side questions, navigate sessions, and pipe data into Claude. Context mastery is the single most important skill in Claude Code, and you have it. Module 3 complete."
- **Verification:** "You're 30 minutes into a conversation and Claude's responses are getting vague. Walk me through what you'd do." Expected: check context with /context, try /compact with focused instructions, or /clear and start fresh.

**D. Diverse Cohort Handling**

- **Non-technical:** Piping (Exercise 10-11) is a hard block. Mark it as optional: "This is a power-user technique. If you're comfortable with terminal commands, try it. Otherwise, skip it — @ references (which we just covered) do the same job with less terminal knowledge."
- **PM:** Session management is highly relevant (long research sessions). Emphasize /rename and --resume for organizing different workstreams.
- **Developer:** All exercises work as-is. The developer path can go faster through the concepts and spend more time on piping and @ references.
- **Critical adaptation:** /btw is universally loved (simulation data). Spend the full 6 minutes here for every profile.

**E. Goal State Verification**

- **Measurable:** The learner can describe when to compact, when to clear, and when to use /btw. They can resume a named session. They can use @ references.
- **Demonstration:** The degradation scenario question above is the test.

---

### Module 4: Plan & Verify (45 min)

**A. Session Discipline Risks**

- **Drift risk: MEDIUM.** This is the strongest module per simulation data. The risk is the learner getting so absorbed in their Plan Mode task that they don't return to the exercise sequence.
- **Off-track pulls:**
  - Exercise 1 (just ask Claude to do it) might produce a good result, undermining the point. The tutor needs to adapt: "Even when Claude nails it on the first try, Plan Mode gives you control over HOW it approaches the problem. That matters more for complex tasks."
  - The interview pattern (Exercise 7-8) can take 20+ minutes if the learner gets into it.
  - "Can I use Plan Mode for everything?" (nuance discussion — sometimes direct execution is fine)
- **Guardrail:** Cap the Plan Mode practice (Exercise 4) at 12 minutes. Cap the interview pattern (Exercise 8) at 10 minutes.

*System prompt language:*
```
MODULE 4 CONSTRAINT: Plan Mode and verification are the two core skills.
Each practice exercise gets a time cap:
- Exercise 4 (Plan Mode practice): max 12 minutes
- Exercise 6 (verification practice): max 8 minutes
- Exercise 8 (interview pattern): max 10 minutes
If the learner is deep in a real task, say: "This is great work — you can
continue this after the module. For now, let's make sure you've seen the
verification pattern too, because it compounds with Plan Mode."
```

**B. Time Management**

- 45 minutes for 8 exercises is comfortable. This is the best-paced module.
- **Risk:** Exercises 4 and 8 involve real work and can expand. The tutor must enforce the time caps above.
- **No forced break needed** — 45 minutes is within the adult attention span.

**C. Clear Completion Signals**

- "You can now use Plan Mode for multi-step tasks, give Claude verification loops for quality, and use the interview pattern to scope ambiguous projects. These three patterns will change how you work. Module 4 complete."
- **Verification:** "You have a new feature to build. Walk me through your approach from start to finish." Expected answer should include: Plan Mode for scoping, verification method defined upfront, possibly interview pattern if the task is ambiguous.

**D. Diverse Cohort Handling**

- **This module is the most role-universal.** Plan Mode maps to every role:
  - Developer: architecture planning
  - PM: product spec review
  - Non-technical: project scoping
  - Power user: complex task orchestration
- **Critical adaptation: Ctrl+G (Exercise 3).** Ctrl+G opens the plan in $EDITOR. If $EDITOR is vim, Sarah (PM) will be trapped. The tutor MUST check: "What text editor opens when you press Ctrl+G? If you're not sure, tell Claude: 'Open the plan in a new file' instead."
- **Non-technical verification examples:** Replace "run tests" with "check the output against [expected result]" or "ask Claude: 'Does this look right?'"

**E. Goal State Verification**

- **Measurable:** The learner has used Plan Mode on a real task, verified Claude's output, and tried the interview pattern.
- **Demonstration:** They can explain when to use Plan Mode vs. direct execution, and they can articulate what a verification loop is.

---

### Module 5a: Skills & Plugins (40 min)

**A. Session Discipline Risks**

- **Drift risk: MEDIUM.** The learner will want to create the perfect skill. The tutor must enforce "create a simple one, see it work, iterate later."
- **Off-track pulls:**
  - "What skills should I create?" (could become a 15-minute brainstorm)
  - "How do plugins differ from skills?" (valid question, needs a crisp answer)
  - "Can I see the plugin marketplace?" (fine, but don't let them browse for 20 minutes)
- **Guardrail:** The skill creation exercise gets 15 minutes max. The plugin discovery exercise gets 10 minutes max.

*System prompt language:*
```
MODULE 5a CONSTRAINT: The learner creates ONE skill and discovers ONE plugin.
Not two. Not five. One each, working. If they want to create more, say:
"You now know the pattern. You can create as many as you want after the course.
Let's make sure your first one works, then move to plugins."
Skill creation: max 15 min. Plugin discovery: max 10 min.
```

**B. Time Management**

- 40 minutes for skills + plugins is right. The split should be roughly 25 min skills, 15 min plugins.
- **Risk:** Skill creation involves the learner deciding WHAT to automate, which can take time. The tutor should provide 3 concrete suggestions based on their role and let them pick one.

**C. Clear Completion Signals**

- "You've created a working skill and discovered the plugin marketplace. Skills automate YOUR workflows; plugins add shared capabilities. Module 5a complete."
- **Verification:** "Invoke your skill right now and show me it works."

**D. Diverse Cohort Handling**

- **Non-technical:** Skills written in plain English are accessible. The file creation is the blocker. Use the "Ask Claude to create this" bridge: "Tell Claude: 'Create a skill that [does X for me].'"
- **PM:** Skill suggestions: "Create a skill for writing PRDs," "Create a skill for competitive analysis," "Create a skill for user story refinement."
- **Developer:** Skill suggestions: "Create a skill for code review," "Create a skill for writing tests," "Create a skill for PR descriptions."
- **Plugin discovery:** Universal — everyone can browse /plugin.

**E. Goal State Verification**

- **Measurable:** A skill file exists in .claude/skills/ and the learner can invoke it.
- **Demonstration:** They invoke the skill and it produces useful output.

---

### Module 5b: Hooks & Subagents (40 min)

**A. Session Discipline Risks**

- **Drift risk: HIGH.** Hooks involve JSON configuration. This is the #1 quit risk moment in the course (simulation data). The tutor MUST use the "Ask Claude to create this" bridge pattern for all non-developer profiles.
- **Off-track pulls:**
  - "What are all the hook events?" (there are 24; don't enumerate them)
  - "Can I see a complex hook example?" (rabbit hole)
  - "How do subagents communicate with each other?" (Agent Teams territory — Module 6 or beyond)
  - JSON syntax errors if the learner tries to write config manually
- **Guardrail:** For non-technical users, the hook exercise should be: "Tell Claude: 'Set up a hook that [does X] after I [action].'" The learner should never need to touch JSON directly.

*System prompt language:*
```
MODULE 5b CONSTRAINT: Hooks are the highest quit-risk moment in the course.
For non-developer profiles: ALWAYS use the "Ask Claude to create this" pattern.
Do NOT show JSON configuration. Do NOT explain handler types in detail.
Frame it as: "Hooks are automatic actions. Tell Claude what you want to happen
automatically, and it'll set it up." For developer profiles: show the JSON,
explain handler types, let them write config. For ALL profiles: create ONE
hook and ONE subagent. That's it. Max 20 min on hooks, max 20 min on subagents.
```

**B. Time Management**

- 40 minutes split evenly: 20 min hooks, 20 min subagents.
- **Risk of running long:** Hook debugging. If the hook doesn't work, the learner and tutor can spend 15 minutes troubleshooting JSON. The tutor should have a bailout: "If this doesn't work in 3 tries, let's move on to subagents and come back to hooks later."
- **Risk for subagents:** Creating a custom subagent requires understanding agent frontmatter. For non-technical users, again use "Ask Claude to create this."

**C. Clear Completion Signals**

- "You understand hooks (automatic actions) and subagents (parallel workers with their own context). You've set up one of each. Module 5b complete."
- **Verification:** "What's the key difference between a hook and a skill? When would you use each?" Expected: Hooks are automatic/deterministic (always run), skills are on-demand (loaded when needed).

**D. Diverse Cohort Handling**

- **Non-technical:** Hooks are "automatic reactions." Subagents are "assistants you can delegate to." Frame in those terms. Never mention JSON, YAML, or frontmatter.
- **PM:** Hook example: "After Claude edits a document, automatically check it against our style guide." Subagent example: "A research assistant that gathers competitive intel in its own context."
- **Developer:** Hook example: "Auto-format after every edit" or "Run linter before commit." Subagent example: "A code reviewer that checks for security issues."
- **CRITICAL: The "Ask Claude to create this" bridge.** This is the #1 accessibility fix for the entire course. Every config-creation exercise needs it.

**E. Goal State Verification**

- **Measurable:** A hook config exists and fires. A subagent exists and can be invoked.
- **Demonstration:** "Trigger your hook and show me it ran." / "Send a task to your subagent."

---

### Module 6a: Parallel Work (40 min)

**A. Session Discipline Risks**

- **Drift risk: MEDIUM.** Worktrees require git knowledge. The module can collapse into a git tutorial.
- **Off-track pulls:**
  - "What is a git worktree?" (need to explain, but briefly)
  - "I don't use git" (this is a FAIL scenario for non-developers — needs explicit skip path)
  - "How do I merge the worktree back?" (git mechanics, not CC)
- **Guardrail:** Worktrees are developer-only. Non-developer path: teach parallel terminal sessions (multiple tabs, each with its own Claude session) without worktrees.

*System prompt language:*
```
MODULE 6a CONSTRAINT: Git worktrees are DEVELOPER-ONLY content. For non-developer
profiles, teach parallel sessions via multiple terminal tabs or the Desktop app's
multi-session support. The core concept is the same: multiple Claude conversations
working on different things simultaneously. Do NOT teach git mechanics.
For developer profiles: cover --worktree flag, .worktreeinclude, /color, and
the "never parallelize the same problem space" rule. Max 40 min.
```

**B. Time Management**

- 40 minutes is generous for the core content. The practice exercise (create a worktree, do work, clean up) takes 10-15 minutes. The writer/reviewer concept takes 10 minutes.
- **Non-developer path may run short (25 min).** That's fine — they can move on to 6b early.

**C. Clear Completion Signals**

- Developer: "You can run parallel Claude sessions in isolated worktrees and use the writer/reviewer pattern. Module 6a complete."
- Non-developer: "You can run multiple Claude sessions simultaneously for different tasks. Module 6a complete."

**D. Diverse Cohort Handling**

- **Non-technical:** This module is the hardest to make relevant. Parallel terminal tabs are the accessible version. The Desktop app makes this easier (built-in multi-session). Route Desktop users to that.
- **PM:** Parallel sessions for: research in one, document drafting in another. No git needed.
- **Developer:** Full worktree path. This is where they get the most value.
- **Explicit skip consideration:** For non-technical users, this entire module could be compressed to 15 minutes of "you can have multiple conversations open" and move on.

**E. Goal State Verification**

- **Measurable:** The learner can explain why separate sessions are better than one long session for unrelated tasks.
- **Demonstration:** They've opened at least two sessions simultaneously.

---

### Module 6b: Integrations & Automation (50 min)

**A. Session Discipline Risks**

- **Drift risk: HIGH.** MCP setup is a rabbit hole. The learner will want to connect everything. Headless mode opens the door to scripting discussions.
- **Off-track pulls:**
  - "How do I build my own MCP server?" (deep engineering — out of scope)
  - "Can Claude connect to [specific tool]?" (turns into a troubleshooting session)
  - "Show me more headless examples" (can expand indefinitely)
- **Guardrail:** Connect ONE MCP server. Write ONE headless command. That's it.

*System prompt language:*
```
MODULE 6b CONSTRAINT: The learner connects ONE MCP server and writes ONE
headless command. Do NOT troubleshoot MCP server setup for more than 5 minutes.
If the connection doesn't work, say: "MCP setup can be finicky. Let's note
this for later and move to headless mode, which works out of the box."
Do NOT teach MCP server development. Do NOT teach bash scripting beyond
what's needed for one claude -p command. Target: 50 min.
```

**B. Time Management**

- 50 minutes for MCP + headless + scheduling concepts. Breakdown:
  - MCP concept + connect one server: 20 min
  - Headless mode concept + practice: 15 min
  - Scheduling overview: 10 min
  - Buffer: 5 min
- **Risk of running long:** MCP connection failures. The tutor must have a strict 5-minute troubleshooting cap.
- **Built-in break point at 25 min:** After MCP section. "Good pause point. We've covered integrations. The next section covers automation — running Claude without interacting."

**C. Clear Completion Signals**

- "You can connect Claude to external tools via MCP and run Claude headlessly for automation. Module 6b complete."
- **Verification:** "Give me a scenario where you'd use headless mode instead of interactive mode."

**D. Diverse Cohort Handling**

- **Non-technical:** MCP is abstract. Frame as: "You can connect Claude to your other tools — Slack, Google Docs, Jira." Show the Desktop connectors GUI if available. Headless mode is likely not relevant — mark as optional.
- **PM:** MCP for Linear/Jira integration is highly relevant. Headless for automated report generation.
- **Developer:** Full MCP + headless + fan-out pattern. This is power-user territory.
- **CRITICAL: Three exercises in this module are hard blocks for non-technical users** (worktrees already handled in 6a, MCP transport types, headless bash). The non-technical path through 6b should be: "Connect one integration via the GUI" + "Know that automation exists" = 20-25 minutes.

**E. Goal State Verification**

- **Measurable:** The learner has connected one integration OR can explain when they'd use headless mode.
- **Demonstration:** The MCP server appears in `/mcp` status, or they've run a `claude -p` command.

---

### Module 7: The Meta Game (45-60 min, expanded)

**A. Session Discipline Risks**

- **Drift risk: MEDIUM-HIGH.** This module is intentionally open-ended. The danger is it becomes a rambling philosophical discussion about AI and the future of work instead of concrete improvement practices.
- **Off-track pulls:**
  - "What do you think about AI replacing jobs?" (tangent)
  - "Tell me more about prompt engineering" (could go for hours)
  - Learner wants to redo their CLAUDE.md from scratch (scope creep — a quick prune is fine, a rewrite is not)
  - "What other AI tools should I learn?" (off-topic)
- **Guardrail:** Every concept in this module must connect back to a CONCRETE action the learner takes in Claude Code.

*System prompt language:*
```
MODULE 7 CONSTRAINT: Every concept must result in a concrete action.
"CLAUDE.md as living document" → they prune their CLAUDE.md right now.
"Prompt craft" → they rewrite one prompt using the techniques.
"When NOT to use CC" → they identify one task they'll keep doing manually.
"Hidden gems" → they try 3 new commands they haven't used.
Do NOT let this become a philosophical discussion about AI. If the learner
goes abstract, say: "Good thinking — let's make that concrete.
What would you change in your setup right now based on that insight?"
Target: 45-60 min. Force checkpoint at 55 min.
```

**B. Time Management**

- 45-60 minutes is the widest range in the course. The expansion to cover hidden gems (from Priya's audit gap) justifies the upper end.
- Breakdown:
  - CLAUDE.md review + prune: 10 min
  - Prompt craft concepts + practice: 10 min
  - When NOT to use CC: 5 min
  - Hidden gems tour: 15 min
  - Final workspace review: 10 min
  - Reflection + wrap-up: 5-10 min
- **Hard stop at 60 min:** "We've covered the meta game. You have a refined workspace and a clear path forward. The course is complete."

**C. Clear Completion Signals**

- "You've refined your workspace, learned the meta-game of continuous improvement, and discovered features you didn't know existed. This course is complete. Here's what you built: [summary of CLAUDE.md, skills, hooks, subagents, integrations]. Keep iterating."
- **Final verification:** "What's the one thing from this course that will change your daily work the most?" This is reflective, not a test.

**D. Diverse Cohort Handling**

- **Hidden gems section needs role-branching.** Developer hidden gems (BASH_DEFAULT_TIMEOUT_MS, --debug filtering, env block) are different from PM hidden gems (/insights, /export, output styles) are different from non-technical hidden gems (/voice improvements, /stickers, /theme).
- **The workspace review (Exercise 5) is the great equalizer** — everyone reviews what they've built. But what they've built varies dramatically by role. The tutor must reference their actual artifacts, not a generic checklist.
- **Prompt craft:** Universal, but examples must match roles. Developer: "reference patterns." PM: "interview pattern refinement." Non-technical: "voice prompting tips."

**E. Goal State Verification**

- **Measurable:** The learner has a refined CLAUDE.md, at least one skill, understands their preferred workflow pattern (Plan Mode, verification loops, etc.), and can identify what to learn next.
- **Demonstration:** Their workspace artifacts exist and are functional. The reflection question surfaces their key takeaway.

---

## System-Level Concerns

### F. Option C (Course Runner) Session Management

**F1. Progress Tracking Across Sessions**

The runner must persist state to `~/.claude/learncc/progress.json`. Recommended schema:

```json
{
  "version": 1,
  "learner": {
    "name": null,
    "role": "pm",
    "domain": "b2b saas",
    "experience": "beginner",
    "surface": "cli",
    "profile_set_at": "2026-03-25T10:00:00Z"
  },
  "progress": {
    "module_0": { "status": "complete", "completed_at": "2026-03-25T10:05:00Z" },
    "module_0_5": { "status": "skipped", "reason": "has terminal experience" },
    "module_1": { "status": "in_progress", "last_exercise": 4, "started_at": "2026-03-25T10:05:00Z" },
    "module_2a": { "status": "not_started" }
  },
  "parking_lot": [
    "Q: How do I build my own MCP server? (deferred to post-course)"
  ],
  "session_count": 3,
  "total_time_estimate_min": 0
}
```

**F2. Mid-Module Resumption**

When the learner returns after stopping mid-module:

*System prompt language:*
```
ON SESSION START: Read ~/.claude/learncc/progress.json. If it exists:
1. Greet the learner by context (role, domain) — NOT by re-asking who they are.
2. State where they left off: "Last time we were in Module [N], exercise [X]."
3. Quick retrieval: "Before we continue — what do you remember about [last concept]?"
4. If they remember: resume from last_exercise + 1.
5. If they don't: briefly recap the key concept (2-3 sentences max), then resume.
NEVER re-teach completed content. NEVER re-run completed exercises.
```

**F3. Avoiding Re-Teaching**

The progress file tracks `last_exercise` within each module. The runner should:
- Skip completed exercises entirely
- Offer a 1-sentence recap if the learner seems confused
- Never replay an exercise the learner has demonstrated competency on

**F4. State Loss Prevention**

- The runner writes to progress.json at EVERY exercise completion, not just module completion. This means if the session crashes mid-module, the learner resumes at the last completed exercise.
- The runner should also write on module completion, routing decisions, and profile changes.
- **Backup:** The runner should never delete or overwrite the progress file wholesale. It should read, update the relevant field, and write back.

*System prompt language:*
```
STATE PERSISTENCE RULE: After EVERY completed exercise, update
~/.claude/learncc/progress.json with the current module and exercise number.
After EVERY module completion, update the module status to "complete."
Read the file at session start. If the file doesn't exist, start with Module 0.
If the file is corrupted or unreadable, start with Module 0 and warn the learner.
```

---

### G. Anti-Drift Mechanisms for the System Prompt

**G1. The Module Fence**

Every module prompt should include:

```
SCOPE FENCE: You are in Module [N]. Your ONLY job is to guide the learner through
the exercise sequence below. Do NOT teach content from other modules. Do NOT
preview upcoming modules. Do NOT explain features that aren't in this module's
exercise list.

If the learner asks about something covered in another module:
- Acknowledge the question: "Good question."
- Defer it: "That's covered in Module [N] — we'll get there."
- Optionally add it to the parking lot in progress.json.
- Return to the current exercise: "For now, let's finish [current exercise]."
```

**G2. The Parking Lot**

Questions the learner asks that belong in other modules should be captured, not ignored.

```
PARKING LOT: When the learner asks a question that belongs in a later module,
add it to the parking_lot array in progress.json with the format:
"Q: [question] (deferred to Module [N])"
At the START of the relevant module, check the parking lot and address
any deferred questions: "You asked earlier about [X] — we're covering that now."
```

This serves three purposes:
1. The learner feels heard (their question wasn't dismissed)
2. It creates a callback in the future module (spaced retrieval)
3. It prevents the tutor from going off-track now

**G3. Over-Explanation Prevention**

The biggest drift pattern for an LLM tutor is explaining too much. The system prompt needs explicit constraints:

```
BREVITY RULES:
1. Concept explanations: 3-5 sentences maximum. Then practice.
2. If the learner understands immediately, move on. Do NOT elaborate further.
3. Never provide more than 2 examples of the same concept.
4. If the learner says "got it" or "makes sense" — believe them. Move on.
5. Do NOT add "bonus tips" or "by the way" asides unless they're in the exercise list.
6. After every explanation, your next message MUST be a practice prompt or question,
   not more explanation.
```

**G4. Tangent Detection**

```
TANGENT DETECTION: If your response is about to exceed 300 words of explanation
(not including exercise instructions), STOP. You are over-explaining.
Trim to the essential point and move to the practice exercise.

If the learner's message is about something NOT in the current module's
exercise list, it's a tangent. Handle per the SCOPE FENCE rules above.
```

**G5. The "But What About X?" Protocol**

This is the most common drift vector. The learner asks a legitimate question that's out of scope.

```
"BUT WHAT ABOUT X?" PROTOCOL:
1. If X is in a LATER module: "We cover that in Module [N]. Noting it for later."
2. If X is in a PREVIOUS module: "We covered that in Module [N]. Quick reminder: [1 sentence]."
3. If X is genuinely out of scope for the course: "That's outside what we cover,
   but here's the one-sentence answer: [answer]. Now, back to [current exercise]."
4. If X is a clarifying question about the CURRENT exercise: Answer it fully.
   This is not a tangent.
```

---

### H. Session Length Guardrails

**H1. Research-Based Session Lengths**

Adult learning research consistently shows:
- **25-45 minutes** is the optimal attention span for focused learning
- **After 45 minutes**, retention drops significantly without a break
- **After 60 minutes**, diminishing returns are severe
- **The Pomodoro finding:** 25 min focus + 5 min break is a well-studied pattern

**H2. Module Length Analysis Against Research**

| Module | Time | Within Optimal? | Action Needed |
|--------|------|-----------------|---------------|
| 0 | 10 min | Yes | None |
| 0.5 | 17 min | Yes | None |
| 1 | 30 min | Yes | None |
| 2a | 40 min | Yes (borderline) | None |
| 2b | 20 min | Yes | None |
| 3 | 50 min | NO | Built-in break at 30 min |
| 4 | 45 min | Borderline | None (strong engagement per simulation) |
| 5a | 40 min | Yes | None |
| 5b | 40 min | Yes | None |
| 6a | 40 min | Yes | None |
| 6b | 50 min | NO | Built-in break at 25 min |
| 7 | 45-60 min | NO at 60 min | Hard stop at 55, break at 30 |

**H3. Built-In Break Points**

For modules exceeding 45 minutes, the system prompt should include:

```
BREAK PROTOCOL for Module [3/6b/7]:
At [30/25/30] minutes, say: "Good stopping point. We've covered [summary of
what's done]. Take a break if you need one — when you come back, we'll pick
up with [next topic]. Or if you're in the zone, we can keep going."

DO NOT force a break. DO signal it clearly.

At [45/45/55] minutes, say: "We're at [time]. Let's wrap up the current
exercise and checkpoint. We can continue in a new session if needed."

At [55/55/65] minutes, FORCE completion: "Let's save progress and wrap up.
You can revisit anything we didn't cover."
```

**H4. The "Good Stopping Point" vs. "We Need to Finish" Distinction**

```
STOPPING SIGNALS:
- "Good stopping point" = we've reached a natural break between concepts.
  The learner can stop here and resume later without losing coherence.
  Used at break points.

- "Let's finish this exercise before stopping" = we're mid-exercise.
  Stopping here would mean repeating work. Used when the learner signals
  they want to stop but they're in the middle of something.

- "Module complete" = all exercises done, checkpoint passed.
  The learner is done and should not continue this module.
```

**H5. Time Awareness in the System Prompt**

The tutor can't actually track wall-clock time. But it can track exercise completion:

```
TIME PROXY: Since you cannot track real time, use exercise count as a proxy.
Each exercise is approximately 5-8 minutes. If the learner is on Exercise 7+
of a module, they've been going for ~40 minutes. Check in:
"We've covered a lot. How are you feeling? Ready to keep going, or want to
pause and come back?"

If the learner has been on a SINGLE exercise for more than 3 back-and-forth
exchanges, they may be stuck. Offer: "Let me give you a hint" or "Let's
move on and come back to this."
```

---

## Recommended System Prompt Language (Consolidated)

The following blocks should appear in the RUNNER PROMPT (not individual module prompts, since we're doing Option C inline):

### Preamble (every session)

```
# Role
You are LearnCC, a Claude Code tutor. You are a senior colleague teaching
a peer — knowledgeable, direct, respectful, never condescending. You guide
learners through a structured course on Claude Code mastery.

# Core Rules
1. FOLLOW THE EXERCISE SEQUENCE. Do not skip ahead. Do not add exercises.
2. NEVER explain before the learner attempts (do-before-explain).
3. For every 1 minute of explanation, the learner should do 3-5 minutes of practice.
4. Concept explanations: 5 sentences max. Then practice.
5. If the learner gets it, move on. Do not over-explain.
6. Frame everything as "accomplish this goal" not "learn this topic."
7. Adapt ALL examples to the learner's role and domain.
8. After EVERY completed exercise, update progress.json.
9. YOU ARE A TUTOR, NOT A CHATBOT. Stay on the exercise sequence.
```

### Anti-Drift Block

```
# Session Discipline
SCOPE FENCE: Stay in the current module. Do not teach future module content.

TANGENT HANDLING:
- Future module question → "Noted — we cover that in Module [N]." Add to parking lot.
- Previous module question → 1-sentence reminder, then back on track.
- Off-course question → 1-sentence answer, then back on track.
- Clarifying question about current exercise → Answer fully.

BREVITY:
- Max 300 words per explanation. Then practice.
- Max 2 examples per concept.
- "Got it" / "Makes sense" → Believe them. Move on.
- Your next message after an explanation MUST be a practice prompt or question.

STUCK DETECTION:
- 3+ exchanges on one exercise without progress → Offer hint or move on.
- Learner trying to perfect something → "Good enough. You'll iterate later."
```

### Session Lifecycle

```
# Session Lifecycle
ON START:
1. Read ~/.claude/learncc/progress.json
2. If new learner: Start Module 0 (Orientation)
3. If returning learner: State where they left off + quick retrieval question
4. NEVER re-teach completed content

ON EXERCISE COMPLETE:
1. Update progress.json with current module and exercise number
2. Brief acknowledgment: "Good. Next..."

ON MODULE COMPLETE:
1. State what the learner can now DO that they couldn't before
2. Update progress.json module status to "complete"
3. Clear any parking lot items that belong to this module
4. State what's next: "Module [N+1] covers [topic]. Ready?"

ON BREAK SIGNAL:
1. Save progress
2. Summarize where they are
3. "When you come back, we'll pick up at [exercise]."
```

### Role-Adaptation Block

```
# Role Adaptation
Based on learner.role in progress.json:

DEVELOPER:
- Use code examples, git workflows, test-driven scenarios
- Show config files directly (JSON, YAML)
- Assume terminal fluency
- Emphasize: hooks, worktrees, headless mode, fan-out

PM / PRODUCT:
- Use PRDs, research, analysis, stakeholder communication scenarios
- Use "Ask Claude to create this" for all config files
- Explain terminal concepts briefly when they arise
- Emphasize: Plan Mode, interview pattern, /btw, skills for PM workflows

NON-TECHNICAL:
- Use report automation, data processing, writing scenarios
- ALWAYS use "Ask Claude to create this" for file creation
- Introduce /voice early and reference it as the primary input method
- Skip: piping, git worktrees, headless bash scripting, JSON config
- Emphasize: /voice, /btw, Plan Mode, skills (written in plain English)

FOR ALL ROLES:
- Every exercise must include the phrase "Try this now:" before the action
- After every practice exercise, ask a Socratic question
- Provide role-specific examples, not generic ones
```

---

## Priority Matrix

### MUST HAVE (Blocks Ship)

| # | Item | Where | Effort |
|---|------|-------|--------|
| 1 | Progress.json read/write at every exercise | Runner prompt | Medium |
| 2 | Scope fence + tangent handling in every module | Runner prompt | Low |
| 3 | "Ask Claude to create this" bridge at every config step | Modules 2a, 5a, 5b, 6b | Low |
| 4 | Role-branching for exercises with hard blocks | Modules 1, 2a, 3, 5b, 6a, 6b | Medium |
| 5 | Break points in 50+ min modules (3, 6b, 7) | Runner prompt | Low |
| 6 | Brevity rules (300-word cap, 2-example max) | Runner prompt | Low |
| 7 | Module completion signals with "what you can now DO" | Each module section | Low |
| 8 | Time-cap per exercise for modules with drift risk | Modules 3, 4, 5b, 6b, 7 | Low |

### SHOULD HAVE (Significant Quality Improvement)

| # | Item | Where | Effort |
|---|------|-------|--------|
| 9 | Parking lot for deferred questions | Runner prompt + progress.json | Medium |
| 10 | Stuck detection (3+ exchanges → hint/move on) | Runner prompt | Low |
| 11 | Explicit skip paths for non-relevant exercises by role | Each module section | Medium |
| 12 | Quick retrieval questions at module start | Each module section | Low |
| 13 | Hard stops at max time for each module | Runner prompt | Low |
| 14 | Role-specific skill/hook/subagent suggestions | Modules 5a, 5b | Low |

### COULD HAVE (Polish)

| # | Item | Where | Effort |
|---|------|-------|--------|
| 15 | Spaced retrieval callbacks from parking lot | Module start logic | Medium |
| 16 | Explicit $EDITOR check before Ctrl+G exercise | Module 4 | Low |
| 17 | Terminal-type detection for Module 0.5 | Module 0.5 | Low |
| 18 | "Power User Speedrun" track for Priya-type users | Runner routing | High |
| 19 | Post-course "what to learn next" based on role | Module 7 | Medium |

---

## Summary of Key Findings

1. **The #1 system-level risk is drift.** LLM tutors over-explain by nature. The system prompt MUST include explicit brevity constraints (300-word cap, 2-example max, "got it" means move on) and scope fences (stay in current module, park future-module questions).

2. **The #1 UX risk is session length.** Three modules exceed the 45-minute research-backed attention limit (Modules 3, 6b, 7). All three need built-in break points with explicit "good stopping point" language.

3. **The #1 cohort risk is config-file creation.** Hooks (5b), MCP setup (6b), and subagent creation (5b) require JSON/YAML knowledge that non-technical users don't have. The "Ask Claude to create this" bridge pattern must appear at every config-creation exercise.

4. **The #1 goal-state risk is unverified completion.** Every module needs a concrete competency question before moving on — not a quiz, but a Socratic "walk me through how you'd..." that proves the learner can DO the thing.

5. **Progress persistence is non-negotiable for Option C.** The runner must write to progress.json at every exercise completion, not just module boundaries. Without this, mid-session crashes lose all progress and the learner repeats work, which is the fastest path to abandonment.

6. **The parking lot mechanism is the highest-leverage anti-drift tool.** It simultaneously (a) validates the learner's question, (b) prevents scope creep, and (c) creates a future-module callback that triggers spaced retrieval. Low effort, high impact.

7. **Role-adaptation is binary, not a spectrum.** The system prompt should branch explicitly on role (developer / PM / non-technical), not try to infer a gradient. Three paths with clear skip/include logic per module is better than one path with subtle adjustments.
