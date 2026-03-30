### MODULE 5A: SKILLS & PLUGINS (40 min)

**Purpose:** Add reusable, on-demand capabilities to your Claude Code workspace.

**Module constraint:** The learner creates ONE skill and installs ONE plugin. Not two, not five. If they want to create more: "You now know the pattern. You can create as many as you want after the course. Let's make sure your first one works, then move to plugins."
- Skill creation: 15 min max
- Plugin discovery: 10 min max

**Time limit:** 40 minutes.

**Opening Retrieval:** "Walk me through how you'd approach a multi-step task now, using what you learned in Module 4."

#### Exercise 5a.1 — The Extension Framework (3 min)
"Claude Code has four ways to add capabilities. Here's the mental model:"

| Type | What It Does | Analogy | When to Use |
|------|-------------|---------|-------------|
| **Skills** | On-demand expertise, loaded when triggered | Calling a specialist | Repeating workflows with specific instructions |
| **Hooks** | Automatic actions, run every time | Smoke detector | Rules that must ALWAYS be enforced |
| **Subagents** | Parallel workers, separate context | Delegating to a team member | Research or tasks that would pollute your context |
| **Plugins** | Pre-built extension packages | App store | Community tools and integrations |

"Today we focus on **Skills** and **Plugins** — the two you can set up right now. Hooks and Subagents are next module."

#### Exercise 5a.2 — Create Your First Skill (15 min, capped)
"Skills are sets of instructions that Claude loads on-demand — like teaching Claude a new specialty that it only activates when you need it. Unlike CLAUDE.md (which loads every session), skills load only when triggered. This keeps your baseline context lean."

"What's something you do repeatedly that Claude could help with?"

If they're stuck, offer 3 role-adapted suggestions:
- Developer: "Code review checklist that checks for security, performance, and style issues." / "Test generation for a specific component." / "PR description writer that follows your team's template."
- PM: "PRD writer that uses your team's template." / "Competitive analysis following a standard framework." / "Sprint summary generator from ticket data."
- Non-technical: "Weekly report generator that pulls from specific data sources." / "Document formatter that applies your company's style." / "Compliance checklist runner for your industry."

"Pick one. Then try this now:"

**All paths:** "Tell Claude: 'Create a skill called [name] that [does what you want]. Save it to `.claude/skills/`.'"

"Claude will create the file for you. Once it's saved, invoke it by typing `/[skill-name]`."

"Try this now: invoke your new skill. Watch it work."

After they invoke it:
"Notice what happened — Claude loaded specialized instructions just for this task, then unloaded them when done. Your main context didn't permanently grow."

Socratic: "How is this different from just putting these instructions in your CLAUDE.md?"
Expected: Skills load only when needed; CLAUDE.md loads every time. Skills keep your base context lean.

#### Exercise 5a.3 — Understand the Skill File (3 min)
"Ask Claude to show you the skill file it just created. Read it."

"Notice the structure:"
- The `---` section at the top is metadata (name, description, trigger conditions)
- Everything below the second `---` is instructions — plain English that Claude follows when the skill is active
- `description` is what Claude uses to decide when to trigger the skill automatically
- You can edit this file anytime to refine the skill's behavior

"One useful option: `disable-model-invocation: true` in the frontmatter means the skill only runs when YOU explicitly call it (with /[name]), never automatically. Use this for skills with side effects — like ones that create commits or send messages."

#### Exercise 5a.4 — Plugins & Marketplace (10 min, capped)
"Plugins are pre-built extension packages from the community. They can bundle skills, hooks, agents, and tool integrations in one install."

"Try this now: type `/plugin`. You'll see a browser with tabs: Discover, Installed, Marketplaces, Errors."

"Browse the **Discover** tab."

Role-adapted guidance:
- Developer: "Look for language-specific plugins. TypeScript, Python, Go, and Rust all have LSP (Language Server Protocol) plugins that give Claude precise code intelligence — go-to-definition, find-references, and automatic error detection after edits. These are high-value installs."
- PM: "Look for integrations with your tools — Linear, Notion, Jira, Figma, GitHub. If your tool has a plugin, Claude can read from it directly."
- Non-technical: "Browse what's available. You might find something relevant to your domain, or just something interesting. Install anything that catches your eye."

"Install one plugin. Then try using it — ask Claude to do something that the plugin enables."

If the marketplace feels sparse for their domain: "The plugin ecosystem is growing fast. Check back periodically — /release-notes will flag new marketplace additions."

#### Exercise 5a.5 — Management Commands (2 min)
"Three commands for managing your extensions:"
- `/skills` — lists all available skills (yours + installed)
- `/plugin` — manage installed plugins (enable, disable, update)
- `/reload-plugins` — refresh plugins without restarting your session

"Try /skills now to see your new skill listed."

#### Module 5a Completion

**Capability statement:** "You have a working custom skill and know how to discover and install plugins. Skills automate YOUR specific workflows. Plugins add shared community capabilities."

**Competency check:** "Invoke your skill right now and show me it works."

After they demonstrate: "What other skills would you create based on what you do daily?"

Update progress.json: mark module_5a as `"complete"`.

"Module 5a complete. Next: Module 5b — Hooks & Subagents. Hooks are automatic actions that always run. Subagents are parallel workers with their own context window. This is where automation and delegation get real. Ready?"

---

