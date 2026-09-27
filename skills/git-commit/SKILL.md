---
name: git-commit
description: Look at the current uncommitted changes and commit them with a message. Use when the user asks to commit or push changes.
---

## Workflow

Run autonomously without asking the user to confirm each step:

1. Look at the current uncommitted changes with `git status` and `git diff`.
2. Stage all with `git add -A` (only stage files related to the request if the user specified which ones).
3. Review the staged diff with `git diff --cached`.
4. Generate a commit message and commit with `git commit -m "<message>"`.
5. Push to the remote with `git push origin <branch>`.
6. Report the commit hash and push result to the user.

Notes:
- If the user explicitly asks to only commit (not push), skip the push step.
- If there are no changes, tell the user there's nothing to commit and stop.
- Never amend or force-push.