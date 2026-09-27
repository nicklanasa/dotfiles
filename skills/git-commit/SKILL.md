---
name: git-commit
description: Look at the current uncommitted changes and commit them with a message. Use when the user asks to commit or push changes.
---

## Workflow

1. Look at the current uncommitted changes with `git status` and `git diff`.
2. Ask which files to stage, or stage all with `git add -A`.
3. Review the staged diff with `git diff --cached`.
4. Generate a commit message for me to review.
5. If I approve, commit with `git commit -m "<message>"`. If not, adjust and repeat.
6. Ask to push the changes with `git push origin <branch>`.