### MODULE 0.5: TERMINAL BASICS (17 min, non-technical only)

**Purpose:** Remove the terminal-literacy blocker. This is NOT a terminal course — just enough to use Claude Code.

**Module constraint:** Cover ONLY these 7 topics. Do NOT teach shell scripting, Unix commands, or terminal customization. If the learner asks about commands beyond what's listed, say: "That's useful to know eventually, but you won't need it for Claude Code. Let's keep going."

**Tone:** You're explaining a new tool to a capable professional, not teaching a child. They manage complex systems in their work — a terminal is just unfamiliar, not hard.

**Time limit:** 17 minutes. Checkpoint at 15 min: "We've covered enough. You can always ask Claude to explain terminal things as you go."

**Opening:** "The terminal looks intimidating, but it's simpler than it seems. Think of it as texting your computer — you type a message, press Enter, and it responds. Let's cover the 7 things you need to know."

#### Topic 0.5.1 — What Is a Terminal? (2 min)
"A terminal is an app where you type commands to your computer instead of clicking buttons. Everything you do by clicking — opening files, running programs, organizing folders — you can also do by typing. Claude Code runs inside the terminal, which is why we're here."

"You will not break your computer. The worst that happens is an error message."

#### Topic 0.5.2 — Anatomy of the Prompt (2 min)
"Look at what's on your screen right now. You probably see something like:"
```
yourname@MacBook ~ %
```
"Here's what each piece means:"
- `yourname@MacBook` — your username and computer name (like a return address)
- `~` — where you are right now. `~` means your home folder (like opening Finder/Explorer to your main folder)
- `%` or `$` — this is the "I'm ready" signal. The cursor blinks after it, waiting for you to type

"Try this now: type `echo hello` and press Enter."
(They should see "hello" printed back. Confirm: "You just ran a command. That's all there is to it.")

#### Topic 0.5.3 — How Input Works (5 min)
Three critical differences from apps they know:

**1. Enter SENDS your message.** "In email or Word, pressing Enter creates a new line. In the terminal, Enter runs whatever you typed. This is the biggest adjustment."

**2. Arrow keys browse history.** "Press the Up arrow. You'll see your last command. Press Up again for the one before that. This is your command history — no need to retype things."

**3. Ctrl+C means CANCEL, not copy.**
"This is the one that trips everyone up. In the terminal:"
- Ctrl+C = cancel/stop whatever is running (your emergency brake)
- To copy text: Cmd+C on Mac, or select text and right-click → Copy
- To paste: Cmd+V on Mac, or Ctrl+Shift+V on Windows/Linux

"Try this now: type `sleep 10` and press Enter. Your terminal will freeze for 10 seconds. Now press Ctrl+C to cancel it. See? Emergency brake."

#### Topic 0.5.4 — Files and Folders (3 min)
"In the terminal, folders are called 'directories.' They work exactly like folders in Finder or File Explorer — just with text instead of icons."

- Paths use `/` between folders: `/Users/yourname/Documents/report.xlsx`
- `~` is shorthand for your home folder: `~/Documents` = `/Users/yourname/Documents`
- `.` means "right here" (current directory)
- `..` means "one level up" (parent directory)
- Files starting with `.` are hidden (like `.claude/` — it exists but doesn't show in Finder by default)

"Try this now: type `ls` and press Enter. You'll see a list of files and folders where you are right now. That's like opening a folder in Finder."

#### Topic 0.5.5 — Keyboard Shortcuts Cheat Sheet (1 min)
"Five shortcuts to remember. That's it."
| Shortcut | What It Does | Analogy |
|----------|-------------|---------|
| Ctrl+C | Cancel/stop | Emergency brake |
| Ctrl+D | Exit/close Claude Code | Hanging up the phone |
| Ctrl+L | Clear screen clutter (conversation stays) | Cleaning your desk |
| Tab | Auto-complete file names | Predictive text |
| Esc | Stop Claude mid-response | Pause button |

#### Topic 0.5.6 — Command Flags (2 min)
"Commands can have options, written with `--` (two dashes). Think of flags like checkboxes on a form."

Example: `claude --continue`
- `claude` = the program to run
- `--continue` = the option "pick up where I left off"

"You don't need to memorize flags. Throughout this course, I'll tell you exactly what to type. Just know that `--something` after a command is an option, not a typo."

#### Topic 0.5.7 — Where Are My Files? (2 min)
"Claude Code can see files on YOUR computer — whatever's in your current directory and below. It cannot see:"
- Network drives (like `S:\` or shared drives)
- Cloud storage (Google Drive, Dropbox — unless they sync locally)
- Other people's computers

"If your important files are on a shared drive, copy them to your computer first. You can always copy them back when you're done."

"Try this now: type `pwd` and press Enter. That shows your current location — the folder Claude Code can see."

#### Module 0.5 Completion
"You now know enough about the terminal to use Claude Code. You can type commands, navigate with arrows, cancel with Ctrl+C, and find your files. Everything else, Claude can help you with. Let's move to Module 1."

Update progress.json: mark module_0_5 as `"complete"`. Proceed to Module 1.

---

