# claude-chat-mode (Enhanced Fork)

Turn [Claude Code](https://docs.anthropic.com/en/docs/claude-code) into a warm, thoughtful conversational partner — with a single slash command.

This is an enhanced fork of [dopawei/claude-chat-mode](https://github.com/dopawei/claude-chat-mode). The core `/chat` prompt has been **completely rewritten** with a comprehensive behavioral specification that draws from Claude's actual behavioral patterns and reasoning style — rather than reverse-engineering from the outside.

## What Changed

The original `chat.md` was ~30 lines of bullet-point rules. This version is a comprehensive **8-section behavioral specification (~210 lines)** that covers:

| Section | What It Does |
|---|---|
| **I. Tool Discipline** | Explains *why* tool reflexes damage conversation, not just "don't use tools" |
| **II. Identity & Character** | Authentic Claude personality traits: intellectual curiosity, calibrated confidence, warmth without sycophancy, willingness to disagree |
| **III. Thinking & Reasoning** | First-principles thinking, embracing complexity, concrete examples, cross-domain connections |
| **IV. Communication Style** | Natural prose, proportional responses, formatting restraint, specific anti-patterns to avoid |
| **V. Conversation Types** | Tailored guidance for teaching, analysis, brainstorming, emotional conversations, debates |
| **VI. Anti-Patterns** | 10 specific behaviors to avoid (sycophantic openings, list-ification, response padding, etc.) |
| **VII. Extended Thinking** | Permission to reason at length, show working, including wrong turns |
| **VIII. Auto-Exit** | Silent switch back to code mode when coding tasks are detected |

### Key Differences from Original

- **Deep behavioral knowledge**: Based on Claude's actual behavioral patterns, not community guesswork
- **Explains the "why"**: Each constraint includes rationale, making it harder for the system prompt to override
- **Removes redundant rules**: Dropped instructions that duplicate Claude's base behavior (e.g., "be evenhanded on political topics")
- **Adds scene-specific guidance**: Different conversation types (teaching, debate, emotional support) get different behavioral rules
- **Specific anti-patterns**: "Never start with 'I'", "Don't summarize your own response", "Don't hedge on things you know" — concrete, actionable style rules
- **Broader tool coverage**: Explicitly names MCP tools, WebSearch, WebFetch, Agent — not just the core 7

## How It Works

Three layers work together:

1. **CLAUDE.md Adaptive Mode** — auto-detects whether your message is a conversation or a coding task, and adjusts behavior accordingly.

2. **`/chat` command** — explicit override. Switches Claude to deep conversational mode: natural prose, genuine thinking, no reflexive tool usage.

3. **`/code` command** — switches back to full coding assistant mode with all tools active.

Chat mode includes **auto-exit**: if you send a clearly coding-related message (e.g., "fix this bug"), Claude silently switches back to code mode without needing `/code`.

## Install

```bash
git clone https://github.com/ransxd/claude-chat-mode.git
cd claude-chat-mode
bash install.sh
```

Or manually copy the files:

```bash
cp commands/chat.md ~/.claude/commands/chat.md
cp commands/code.md ~/.claude/commands/code.md
```

Optionally, add the adaptive mode section to your `~/.claude/CLAUDE.md` (see `CLAUDE.md.example`).

## Usage

```
/chat                          # switch to conversational mode
/chat explain attention to me  # chat mode with an initial message
/code                          # switch back to coding mode
/code fix the bug in utils.py  # code mode with an immediate task
```

In chat mode, Claude will:

- Respond in natural paragraphs, not bullet lists
- Think deeply from first principles, not pattern-match
- Avoid using tools unless you explicitly ask
- Use a warm, authentic tone — not sycophantic, not robotic
- Disagree with you when it has good reasons to
- Auto-exit back to code mode if you send a coding task

## What This Is NOT

- **Not "dumber" mode** — Claude thinks *more* deeply in chat mode, not less
- **Not "shorter" mode** — response length matches topic depth
- **Not "refuse tools" mode** — if you explicitly ask Claude to read a file, it will
- **Not a source code hack** — everything uses official Claude Code configuration

## File Structure

```
~/.claude/
  CLAUDE.md              <- adaptive mode auto-detection (optional)
  commands/
    chat.md              <- /chat slash command (enhanced)
    code.md              <- /code slash command
```

## Credits

- Original project by [dopawei](https://github.com/dopawei/claude-chat-mode)

## License

MIT
