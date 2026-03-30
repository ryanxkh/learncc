# Changelog

## 1.1.0 (2026-03-30)

### Added
- **Progress Backup Hook (SessionEnd):** Automatically backs up progress.json on every session exit. Zero-cost insurance against file corruption.
- **Session Context Primer Hook (SessionStart):** Silently injects learner progress into Claude's context on session start. Makes resumption deterministic instead of advisory.
- **Exercise Validator Agent (learncc-validator):** Independent Haiku-powered read-only agent that validates learner artifacts (CLAUDE.md, skills, hooks, subagents) against acceptance criteria. Invoked at checkpoints in Modules 2a, 5a, and 5b.
- SKILL.md updated with artifact validation protocol and session hook awareness

## 1.0.0 (2026-03-30)

### Initial Release
- 12 modules covering Claude Code fundamentals through advanced patterns
- Three role paths: Developer, PM, Non-Technical
- Adaptive routing based on learner experience level
- Progress tracking with per-exercise persistence
- Session guards: scope fences, brevity caps, time limits, break points
- Terminal Basics micro-module for zero-experience learners
- Built-in voice (/voice) introduced in Module 1 for non-technical paths
- "Ask Claude to create this" bridge pattern for all configuration exercises
- Hidden gems tour in Module 7 covering 9 frequently-missed features
- Compound workflow capstone exercise
- Role-specific forward paths on course completion
