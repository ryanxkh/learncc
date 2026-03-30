# Final Verification: UX, Session Guards, and Cohort Coverage

## Cohort Matrix (6 personas × 12 modules)

| Module | Aisha (Mktg) | James (Sysadmin) | Mei (Student) | Carlos (Eng) | Yuki (UX) | Devon (Writer) |
|--------|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 | PASS | PASS | PASS | PASS | PASS | PASS |
| 0.5 | PASS | N/A | N/A | PASS | N/A | PASS |
| 1 | ADAPT | ADAPT | PASS | ADAPT | PASS | ADAPT |
| 2a | ADAPT | PASS | PASS | ADAPT | PASS | ADAPT |
| 2b | ADAPT | PASS | ADAPT | ADAPT | PASS | ADAPT |
| 3 | ADAPT | PASS | PASS | ADAPT | PASS | ADAPT |
| 4 | PASS | PASS | PASS | PASS | PASS | PASS |
| 5a | ADAPT | PASS | ADAPT | ADAPT | PASS | ADAPT |
| 5b | BLOCK | PASS | ADAPT | BLOCK | ADAPT | BLOCK |
| 6a | ADAPT | PASS | ADAPT | ADAPT | PASS | ADAPT |
| 6b | BLOCK | PASS | ADAPT | BLOCK | ADAPT | BLOCK |
| 7 | PASS | PASS | PASS | PASS | PASS | PASS |

**BLOCK = 6 cells out of 72 (8%).** All 6 are concentrated in Modules 5b and 6b for the same 3 personas (non-technical without relevant tool integrations).

**Fix for remaining BLOCKs:**
- Module 5b: Make hooks explicitly skippable for non-technical ("Hooks are powerful but technical. For now, know they exist — your engineers can set them up. Let's focus on subagents."). Reduce to 1 subagent exercise only.
- Module 6b: Restructure so /schedule and /loop are the primary exercises. MCP and headless are developer branches. Add guaranteed fallback MCP demo.

## Session Guard Summary (from QUALITY-AUDIT.md)

### Anti-Drift: 6 Mechanisms
1. **Scope Fence** — stay in current module only
2. **Parking Lot** — defer out-of-scope questions to progress.json, address when relevant module arrives
3. **Brevity Rules** — 300-word cap on explanations, 2-example max, "got it" = move on
4. **Tangent Protocol** — future module? "Noted for Module N." Previous module? 1-sentence reminder. Off-course? 1-sentence answer. Clarifying current exercise? Answer fully
5. **Stuck Detection** — 3+ exchanges without progress → hint or move on
6. **Exercise Time Caps** — drift-risk exercises get hard time limits (Plan Mode: 12 min, Interview: 10 min, hooks: 20 min)

### Session Length: Break Points
| Module | Time | Break At | Hard Stop At |
|--------|------|----------|-------------|
| 3 | 50 min | 30 min | 55 min |
| 6b | 50 min | 25 min | 55 min |
| 7 | 45-60 min | 30 min | 60 min |

All other modules are under 45 min (within research-backed attention span).

### Progress Persistence
- Write to progress.json at EVERY exercise completion (not just modules)
- Schema tracks: learner profile, module status, last exercise, parking lot, session count
- On resume: greet by context → state where they left off → quick retrieval question → resume

### Completion Signals
Every module ends with:
1. Statement of what the learner can now DO (not what they learned)
2. Socratic competency verification (not a quiz)
3. Update progress.json to complete
4. Preview of next module

### Role Adaptation: 3 Explicit Paths
- **Developer:** show config, assume terminal, emphasize hooks/worktrees/headless
- **PM:** use PRDs/research/analysis scenarios, "ask Claude to create" for configs
- **Non-technical:** ALWAYS "ask Claude to create", introduce /voice early, skip piping/JSON/worktrees

## Priority Matrix (from QUALITY-AUDIT.md)

### Must-Have (8 items)
1. Progress.json read/write at every exercise
2. Scope fence + tangent handling
3. "Ask Claude to create this" bridge at config steps
4. Role-branching for hard-block exercises
5. Break points in 50+ min modules
6. Brevity rules (300-word cap, 2-example max)
7. Module completion signals ("what you can now DO")
8. Exercise time caps for drift-risk modules

### Should-Have (6 items)
9. Parking lot for deferred questions
10. Stuck detection (3+ exchanges → hint/move on)
11. Explicit skip paths by role
12. Quick retrieval questions at module start
13. Hard stops at max time
14. Role-specific skill/hook/subagent suggestions

### Could-Have (5 items)
15. Spaced retrieval callbacks from parking lot
16. $EDITOR check before Ctrl+G
17. Terminal-type detection in Module 0.5
18. Power User Speedrun track
19. Post-course "what to learn next" by role

## Student-Specific Addition
Module 7 "when NOT to use CC" needs 1 paragraph on academic integrity:
"If you're a student, using CC for learning means understanding what it produces — not just submitting it. Use CC to explain concepts, check your work, and explore alternatives. Don't use it to bypass the thinking your assignments are designed to teach."
