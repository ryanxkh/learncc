### MODULE 2A: CLAUDE.MD & MEMORY (40 min)

**Purpose:** Set up the learner's workspace foundation — the instructions that make Claude work for THEM specifically.

**Module constraint:** Limit CLAUDE.md creation to TWO passes: first draft, then refinement. If the learner wants to keep iterating, say: "Your CLAUDE.md is a living document — you'll refine it throughout the course and beyond. What you have now is solid enough to move forward." Do NOT let CLAUDE.md creation consume more than 20 of the 40 minutes.

**Time limit:** 40 minutes. If at 35 min they're still on CLAUDE.md, skip to @import concept and wrap up.

**Opening Retrieval:** "Quick recall from Module 1 — what did you learn about specificity? Why does giving Claude detailed context matter?"

#### Exercise 2a.1 — /init: Generate a Starting Point (8 min)

**Non-technical / PM path — workspace setup first:**
"Before we create instructions for Claude, let's make sure you have a workspace. Tell Claude: 'Create a folder called my-workspace and set it as the current directory.' (If you already have a project folder, just make sure you're in it.)"

**All paths:**
"Try this now: type `/init`. Claude will scan your current directory and generate a starter CLAUDE.md based on what it finds."

"Read what it produced. Don't worry if it looks code-focused or generic — we're going to make it yours."

- Non-technical: "If /init generated rules about code formatting or build commands, that's fine — we'll replace them entirely with rules for YOUR work."
- Developer: "Notice what /init detected about your project. It probably got the stack right but missed your team's specific conventions."

#### Exercise 2a.2 — Critique (5 min)
Before asking the learner to critique, explain WHY this file matters to them personally. Connect it to their work:

"Before we evaluate this, let me explain why this file matters. Right now, every time you start a conversation with Claude, you start from zero — Claude doesn't know your role, your tools, your preferences, or how you work. You end up re-explaining the same context every time. CLAUDE.md fixes that. Think of it as onboarding notes for a new team member — what would they need to know on day one to not waste your time with basic questions?"

Role-adapted examples of what a CLAUDE.md prevents:
- Developer: "Without it, Claude guesses your framework, your test runner, your code style. With it, Claude already knows."
- PM: "Without it, Claude uses generic templates and wrong stakeholder assumptions. With it, Claude follows YOUR process."
- Non-technical: "Without it, Claude formats things wrong, uses the wrong date format, doesn't know your file structure. With it, Claude just works."

THEN ask the critique questions:
"Now look at what we generated. Three questions:"
1. "What did it get right about your work?"
2. "What's missing that you find yourself re-explaining to Claude every time?"
3. "What's in there that doesn't apply or isn't useful?"

"Tell me your answers. I'll help you see what a strong CLAUDE.md looks like for your role."

#### Exercise 2a.3 — Best Practices (3 min, max 300 words)
Deliver AFTER the critique, connecting to gaps they identified:

"Here's what makes a CLAUDE.md effective:"
- **Keep it under 200 lines** (ideally under 100). Long files get partially ignored.
- **Structure: WHAT / WHY / HOW.** What you do, why it matters, how to do it.
- **Be specific.** "Use MM/DD/YYYY date format" beats "Format dates properly." "Run `npm test` to verify" beats "Test your changes."
- **For critical rules, use emphasis:** Start lines with `IMPORTANT:` or `YOU MUST` — Claude follows these more reliably.
- **Don't state the obvious.** If Claude can figure it out by reading your files, leave it out.

Then provide a role-specific starter example:

**Developer example (show this to developer path):**
```
# Project: E-commerce API
## Stack: Node.js 20, TypeScript, PostgreSQL, Jest
## Build: npm run build | Test: npm test | Lint: npm run lint

## Rules
- IMPORTANT: Always run tests after code changes
- Use TypeScript strict mode. No `any` types
- Follow existing patterns in src/controllers/ for new endpoints
- Database migrations go in src/migrations/ with timestamp prefix
- PR descriptions must include: what changed, why, how to test
```

**PM example (show this to PM path):**
```
# Role: Product Manager, B2B SaaS dashboard for marketing teams
## Team: 6 engineers, 1 designer. Sprint cycle: 2 weeks

## Rules
- PRDs follow this structure: Problem, Solution, Requirements, Success Metrics, Open Questions
- IMPORTANT: Always use bullet points, never paragraphs for requirements
- Competitor set: Mixpanel, Amplitude, Heap, PostHog, GA4
- When analyzing competitors, include: pricing, key features, target market, differentiators
- Stakeholders: VP Product (Sarah), Eng Lead (Marcus), Design Lead (Yuki)
```

**Non-technical example (show this to non-technical path):**
```
# Role: Operations Manager, mid-size construction company
## Tools: Excel, Procore, Outlook

## Rules
- Date format: always MM/DD/YYYY
- Currency: always USD with two decimal places
- IMPORTANT: When I say "the report" I mean the weekly safety compliance report
- Project codes follow format: PRJ-YYYY-NNN (e.g., PRJ-2026-047)
- Safety data is in Excel files in ~/Documents/Safety/
- When creating reports, use the template structure: Summary, Findings, Action Items, Next Steps
```

#### Exercise 2a.4 — Rewrite (7 min)
"Try this now: rewrite your CLAUDE.md applying these principles. For each line, ask yourself: 'Would removing this cause Claude to make mistakes?' If the answer is no, cut it."

"Tell Claude: 'Read my CLAUDE.md and help me rewrite it following these best practices: [paste or describe the principles].'"

After they finish: "How many lines is it? If it's under 100, you're in good shape. If it's over 200, keep pruning."

Socratic follow-up: "Which rule in your CLAUDE.md do you think will save you the most time?"

#### Exercise 2a.5 — Memory System (3 min)
"Claude Code has two instruction systems, and they work differently:"

| | CLAUDE.md | Auto Memory |
|--|-----------|-------------|
| Who writes it | You | Claude |
| What it contains | Rules and instructions | Learnings and patterns |
| When it loads | Every session | Every session |
| Think of it as | Your onboarding doc for a new hire | That new hire's personal notebook |

"Try this now: type `/memory`. You'll see what Claude has remembered about you and your project. You can delete anything wrong or add things it missed."

#### Exercise 2a.6 — @import: Modular Instructions (3 min)
"As your CLAUDE.md grows, you can split it into pieces. The `@` symbol followed by a file path tells Claude to also read that file. It's like attaching an appendix to a memo — your main instructions stay short, the details live elsewhere."

Role-adapted exercise:
- Developer: "Import your architecture doc or style guide: add `@docs/architecture.md` to your CLAUDE.md"
- PM: "Create a PRD template file, then reference it: add `@prd-template.md` to your CLAUDE.md"
- Non-technical: "Create a reference file with your common data (client list, project codes), then add `@reference-data.md` to your CLAUDE.md"

Bridge for all: "Try this now: tell Claude: 'Create a [template/reference] file for [something you use often], and add an @import for it to my CLAUDE.md.'"

#### Exercise 2a.7 — .claude/rules/ (2 min, brief mention)
"One more thing to know: for larger projects, you can organize rules into a `.claude/rules/` directory. Each file covers one topic, and rules can target specific file paths using frontmatter. We won't set this up now — just know it exists for when your CLAUDE.md gets crowded."

#### Module 2a Completion

**Capability statement:** "You have a working CLAUDE.md tailored to your work. You understand auto memory, @imports, and how to keep your instructions lean and effective."

**Competency check:** "What's the difference between your CLAUDE.md and auto memory? When would you edit one vs. the other?"

Expected: CLAUDE.md is rules/instructions you write. Auto memory is observations Claude writes to itself. Edit CLAUDE.md for rules, check /memory for what Claude has learned.

Update progress.json: mark module_2a as `"complete"`.

"Module 2a complete. Next: Module 2b — settings, permissions, and personalizing your Claude Code environment. Quick one — about 20 minutes. Ready?"

---

