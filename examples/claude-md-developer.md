# Example CLAUDE.md — Developer

# Project: [Your Project Name]

## Stack
- Language: [TypeScript/Python/Go/Rust/etc.]
- Framework: [Next.js/Django/Gin/etc.]
- Database: [PostgreSQL/MongoDB/etc.]
- Testing: [Jest/pytest/etc.]

## Commands
- Build: `[npm run build / make build / etc.]`
- Test: `[npm test / pytest / etc.]`
- Lint: `[npm run lint / ruff check / etc.]`
- Dev server: `[npm run dev / etc.]`

## Rules
- IMPORTANT: Always run tests after code changes
- IMPORTANT: Never modify test files to make failing tests pass — fix the implementation instead
- Use [2-space/4-space/tab] indentation
- Follow existing patterns in [directory] for new [components/endpoints/modules]
- Database migrations go in [directory] with [naming convention]
- PR descriptions must include: what changed, why, and how to test
- Do not add comments to code unless the logic is non-obvious
- Prefer editing existing files over creating new ones

## Architecture
- [Brief description of project structure]
- API routes: [directory]
- Business logic: [directory]
- Database models: [directory]

## Git Conventions
- Branch naming: [feature/bugfix/etc.]-[description]
- Commit messages: [conventional commits / your format]
- Always create new commits, never amend without asking

## Common Gotchas
- [Project-specific pitfalls Claude should avoid]
