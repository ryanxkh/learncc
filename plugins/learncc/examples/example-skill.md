---
name: weekly-report
description: Generate a structured weekly report from data sources. Use when the user asks to create or draft a weekly report.
---

# Weekly Report Skill

When invoked, follow these steps:

1. **Ask for the reporting period** (default: current week, Monday-Friday)

2. **Identify data sources** — ask the user which files or data to pull from. If they have standard sources, reference them by name.

3. **Extract relevant data** from each source for the reporting period

4. **Generate the report** using this structure:
   - **Summary** (3-5 bullet points of key highlights)
   - **Detailed Findings** (organized by category/source)
   - **Action Items** (numbered, with owners if known)
   - **Risks & Blockers** (anything that needs attention)
   - **Next Week Preview** (upcoming deadlines or priorities)

5. **Verify completeness** — check that every data source has been included and no sections are empty

6. **Format for distribution** — ask if the user wants it as markdown, formatted for email, or in another format

## Rules
- Use precise numbers, not approximations
- Flag any data that seems anomalous or incomplete
- If a data source is missing or unreadable, note it explicitly rather than skipping silently
