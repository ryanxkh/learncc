### MODULE 1: FIRST CONTACT + /VOICE (30 min)

**Purpose:** First productive conversation with Claude Code. Establish the mental model. Build confidence.

**Module constraint:** After Exercise 1 (free exploration), gently redirect the learner back to the exercise sequence. If they want to keep working on their problem: "That's a great start — we'll come back to real tasks throughout the course. Let me show you a few essential controls that will make everything you just did work even better." Cap Exercise 1 at 7 minutes.

**Time limit:** 30 minutes. Checkpoint at 25 min: "We're wrapping up the basics. Let me make sure you've got the essentials."

**Abbreviated mode:** If the learner was routed here with 1 correct competency answer, they already know some basics. Abbreviate by: skipping exercises they demonstrated knowledge of in Module 0, compressing exercises 1.4 (/help) and 1.10 (controls) to brief mentions, and spending more time on exercises 1.1b (/voice), 1.5 (specificity), and 1.9 (multiline) which they likely don't know. Target: 15-20 min instead of 30.

**Opening Retrieval:** None (first content module).

**Opening:** "This module is about having your first real conversation with Claude Code and learning the controls that matter most. We start by doing, not reading."

#### Exercise 1.1 — DO FIRST: Your First Real Conversation (5-7 min, capped)
"Tell Claude Code about a real problem you're working on right now. Don't overthink the prompt — just describe it like you'd tell a colleague over coffee. Hit Enter and see what happens."

Role-adapted nudges (only if they seem stuck on what to ask):
- Developer: "A bug you're debugging, a feature you're building, or code you want to refactor."
- PM: "A PRD you need to write, a decision you're wrestling with, or research you need to synthesize."
- Non-technical: "A report you need to create, a document you need to draft, or data you need to organize."

Let them have the conversation. Let them go 2-3 exchanges. Then pull them back:
"Good. Notice what Claude did — it didn't just answer a question, it tried to help you accomplish something. We'll build on this. But first, let me show you some essential controls."

#### Exercise 1.1b — Voice Input (Non-Technical and PM paths: 3 min. Developer path: 30-second mention)

**NON-TECHNICAL PATH:**
"Before we continue — there's a faster way to talk to Claude. Type `/voice` to enable voice input. Now hold the Space bar, say your next prompt out loud, and release Space when you're done. Try this now: hold Space and describe something you need help with today."

After they try it: "Voice is available anytime. Throughout this course, you can hold Space to dictate instead of type. Many people find spoken prompts are actually more detailed than typed ones."

**PM PATH:**
"Quick tip — type `/voice` to enable dictation. Hold Space to record, release to send. Speaking your prompts often produces richer context than typing. Try this now."

**DEVELOPER PATH:**
Brief mention only: "Side note: `/voice` enables push-to-talk dictation. Hold Space to record. Useful for complex prompts where typing feels slow."

#### Exercise 1.2 — Reflect (2 min)
"What surprised you about Claude's response? Was there anything it did that you didn't expect?"

Listen. Acknowledge. Connect their observation to the mental model coming next. Don't lecture — just bridge.

#### Exercise 1.3 — Mental Model (2 min, max 300 words)
Deliver AFTER the reflection, connecting to what they just experienced:

"Claude Code is different from a chatbot or a search engine. Here's the mental model:"
- It's a collaborator that can **take actions** on your computer — read files, write files, run commands, search the web
- It's not autocomplete. It's not a search bar. It's a partner that can DO things
- Your job is two things: (1) give it clear goals, and (2) give it good context
- The more specific you are, the better it performs. You saw this in your first conversation — [reference something specific from their attempt]

"We'll sharpen both of those skills throughout the course."

#### Exercise 1.4 — /help (3 min)
"Try this now: type `/help`."

When the output appears, DON'T let them read the whole list. Guide them:
"That's a lot of commands. Let me highlight the three most useful ones for you right now:"
- Developer: "/clear (reset conversation), /compact (shrink without losing), /model (switch AI models)"
- PM: "/clear (start fresh), /compact (summarize and keep going), /btw (quick side question)"
- Non-technical: "/clear (start over), /voice (speak instead of type), /btw (ask a quick side question)"

"There are 60+ commands. You'll learn the important ones through the course. Don't try to memorize the list."

#### Exercise 1.5 — Specificity Comparison (5 min)
"Try this now: type `/clear` to reset your conversation."

"Now describe the SAME problem from Exercise 1, but this time be very specific. Include:"
- Developer: "file names, expected behavior, actual behavior, framework/language versions, what you've already tried"
- PM: "stakeholder names, template structure, success criteria, timeline, constraints"
- Non-technical: "document names, recipient names, format requirements, deadline, specific data sources"

"Compare the two responses. Notice the difference? That's the power of specificity. Vague prompt → generic response. Specific prompt → useful response."

Socratic follow-up: "What details made the biggest difference in the quality of Claude's response?"

#### Exercise 1.6 — The ! Prefix (2 min)
"Try this now: type `! date` (with a space after the exclamation mark)."

They see today's date printed.

"The `!` prefix runs a command on YOUR computer directly — Claude doesn't process it. Think of it as stepping around your assistant to do something yourself."

- Developer path: "Try `! ls` to see your project files, or `! git status` for your repo state. The `!` shortcut has its own Tab-completion from previous commands. Pro tip: `! git log --oneline -5` is faster than asking Claude when you just need raw terminal output."
- PM path: "Try `! ls` to see what files are in your current folder."
- Non-technical path: "You probably won't use this often, but it's there. `! date` is a quick sanity check that it works."

#### Exercise 1.7 — Emergency Brake (2 min)
"Try this now: ask Claude a big question — something that'll generate a long response. Then press Esc before it finishes."

"Notice: Claude stopped, but your conversation is intact. Esc is your emergency brake — stop Claude without losing anything. Use it anytime Claude is going in the wrong direction."

#### Exercise 1.8 — /cost (1 min)
"Try this now: type `/cost`."

"Tokens are roughly equivalent to words — they're how Claude measures conversation size. The number shows how much of your usage this session has consumed. Good to check occasionally."

#### Exercise 1.9 — Multiline Input (2 min)
"Your prompts can span multiple lines. In the terminal, pressing Enter sends your message — but sometimes you want to write more before sending."

"Try this now: type a few words, then press `\` followed by Enter. You get a new line without sending. Write a 3-line prompt this way, then hit Enter on the last line to send."

"Other options: Option+Enter on Mac, Shift+Enter in iTerm2/Ghostty/Kitty/WezTerm, or Ctrl+J anywhere. Pro tip: Ctrl+J works in every terminal — if you remember only one multiline shortcut, make it that one."

#### Exercise 1.10 — Essential Controls (1 min)
"Three keyboard shortcuts that work differently in the terminal than everywhere else:"

| Shortcut | In Terminal | NOT What You're Used To |
|----------|-----------|----------------------|
| Ctrl+C | **Cancel/stop** | Not copy! |
| Ctrl+D | **Exit Claude Code** | Not bookmark |
| Ctrl+L | **Clear screen** (conversation stays) | Not address bar |

"If you remember nothing else: Ctrl+C stops things, Esc stops Claude."

#### Module 1 Completion

**Capability statement:** "You can now have a productive conversation with Claude Code. You know /help to discover commands, /clear to reset, Esc to stop, and /voice to dictate. Most importantly, you know that specificity drives quality."

**Competency check:** "Quick question before we move on — if Claude's responses started getting worse during a long conversation, what would you try?"

Expected: mentions /clear, starting fresh, or being more specific. If they don't know: "Good instinct to think about it. The answer is context management — we cover that in depth in Module 3. For now, /clear is your reset button."

Update progress.json: mark module_1 as `"complete"`.

"Module 1 complete. Next up: Module 2a — setting up your personal workspace with CLAUDE.md. This is where you teach Claude how to work with YOU specifically. Ready?"

---

