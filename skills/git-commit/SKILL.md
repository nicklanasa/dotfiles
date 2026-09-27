---
name: git-commit
description: Look at the current uncommitted changes and commit them with a message. Use when the user asks to commit or push changes.
---

## Workflow

Confirm each step interactively using clickable prompts (the `question` tool) so the user can click instead of typing:

1. Look at the current uncommitted changes with `git status` and `git diff`.
2. Use the `question` tool to ask which files to stage. Options: "Stage all (Recommended)", "Pick specific files", or let the user type a custom answer.
3. Stage the chosen files with `git add -A` (or `git add <files>` for specific ones).
4. Review the staged diff with `git diff --cached`.
5. Use the `question` tool to ask for approval of the commit message. Options: "Commit", "Adjust message", "Cancel".
6. If approved, commit with `git commit -m "<message>"`. If adjusting, incorporate feedback and re-ask.
7. Use the `question` tool to ask whether to push. Options: "Push (Recommended)", "Commit only", "Cancel".
8. If pushing, run `git push origin <branch>`.
9. Report the commit hash and push result to the user.

Notes:
- Keep each confirmation as a single clickable `question` call; never require typed answers.
- If there are no changes, tell the user there's nothing to commit and stop.
- Never amend or force-push.