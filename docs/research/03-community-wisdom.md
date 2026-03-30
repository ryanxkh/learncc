# Community Wisdom & Expert Usage

Source: Blog posts, X/Twitter, practitioner write-ups, hackathon coverage

## Top Workflow Insights

### 1. The Verification Loop (Boris Cherny, CC Creator)
"Probably the most important thing to get great results out of Claude Code — give Claude a way to verify its work. If Claude has that feedback loop, it will 2-3x the quality."
- Tests, screenshots, expected outputs, linter results, server logs
- The agent is far more capable when it can see consequences of its actions

### 2. Plan Mode First, Always
- Start in Plan Mode (Shift+Tab twice) — read-only
- Go back and forth until plan is right
- When plan is accepted, context clears automatically (fresh window for implementation)
- Switch to auto-accept edits mode to execute
- If something goes wrong mid-task: switch back to Plan Mode and re-plan

### 3. Boris Tane's Annotation Cycle
- Phase 1 (Research): Claude reads codebase, documents in research.md
- Phase 2 (Plan): Claude generates plan.md, you annotate with corrections
- Repeat 1-6 annotation cycles until plan reflects reality
- Phase 3 (Implementation): "Implement it all...do not stop until all are completed"
- "The creative work happened in the annotation cycles."

### 4. Parallelization via Worktrees
- 3-5 git worktrees simultaneously, each with own Claude session
- Color-coded terminal tabs
- One dedicated "read-only analysis" instance for logs, queries, research
- Rule: NEVER parallelize the same problem space

### 5. Context Is Finite — Treat It Like It
- Effective windows are 50-60% of nominal capacity
- 70% = precision drops. 85% = hallucinations increase. 90%+ = erratic
- Disable auto-compaction, manually trigger /compact
- Create handoff documents before starting fresh sessions
- Use /clear between unrelated tasks
- After two failed corrections: clear and write better initial prompt

### 6. CLAUDE.md as Living Document
- Under 300 lines (many say under 60-100)
- Add a rule every time Claude makes a mistake
- Check into git for team benefit
- Review and prune every few weeks
- Use nested CLAUDE.md in subdirectories
- @import syntax for modular instructions
- CLAUDE.md is advisory (~80% adherence); use IMPORTANT/YOU MUST for critical rules

### 7. Skills Are the Most Underused Feature (Daniel Miessler)
- Load on-demand like "Neo downloading abilities"
- Not in system prompt at all times, only when triggered
- Skills = domain containers, Workflows = task procedures, Agents = parallel workers
- Convert frequently-used tasks into reusable skills
- Check into git for team inheritance

### 8. Subagent Patterns That Work
- Executor/Evaluator Loop: one generates, second reviews independently
- Opponent Processors: two take opposing positions, Claude mediates
- Feedback Codifier: extracts lessons from review, stores in CLAUDE.md
- Log Investigator: parses logs in own context, returns summary to main
- Include weaknesses in subagent system prompts
- Whitelist specific tools per subagent

### 9. Voice Input Changes Prompt Quality
- SuperWhisper, MacWhisper, fn×fn (macOS) for dictation
- Reduces cognitive overhead of "translating" thoughts
- Especially effective for complex features with many edge cases

## Common Mistakes
1. Treating first output as final (first attempt is 95% garbage — that's expected)
2. Not giving Claude a feedback loop
3. Letting Claude manage git (causes dangerous branch operations)
4. Claude changing tests instead of fixing code
5. Vague prompts (burn 2-5k tokens per wrong guess)
6. Treating CLAUDE.md as one-time setup
7. Bloated CLAUDE.md files (bottom half gets ignored)

## Key Quotes
- Boris Cherny: "Give Claude a way to verify its work" — 2-3x quality
- Boris Cherny: "Opus is bigger and slower than Sonnet, but since you steer it less, it's almost always faster"
- Boris Tane: "The creative work happened in the annotation cycles"
- Sanity.io: "Letting go of code ownership enables faster deletion of bad solutions"
- Simon Willison: "The distance between a question and a first answer just got very small"
- Jaana Dogan: "Generated what we built last year in an hour"

## Non-Engineering Use Cases
- Hackathon: 3/5 winners were non-engineers (attorney, cardiologist, roads worker)
- Teresa Torres (product coach): task management, research digests, documentation
- PMs: PRD to working prototype in single session
- TransformerNews author (zero coding): tax filings, booking, vacation planning
- "English is the most powerful programming language"
- ccforpms.com — dedicated CC course for product managers

## High-Signal Sources
- Boris Cherny threads: twitter-thread.com/t/2007179832300581177
- Boris Tane: boristane.com/blog/how-i-use-claude-code/
- Sanity.io: sanity.io/blog/first-attempt-will-be-95-garbage
- HumanLayer: humanlayer.dev/blog/writing-a-good-claude-md
- Daniel Miessler: danielmiessler.com/blog/when-to-use-skills-vs-commands-vs-agents
- DoltHub gotchas: dolthub.com/blog/2025-06-30-claude-code-gotchas/
- 10 Tips from CC Team: paddo.dev/blog/claude-code-team-tips/
- 45 Claude Code Tips: github.com/ykdojo/claude-code-tips
- incident.io worktrees: incident.io/blog/shipping-faster-with-claude-code-and-git-worktrees
- Builder.io tips: builder.io/blog/claude-code-tips-best-practices
