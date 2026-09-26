---
name: git-commit
description: Look at the current uncommited changes and commit them with a message.
---

## Workflow

1. Look at the current uncommited changes with `git status` and `git diff`.
2. Generate a commit message for me to review
3. If I approve the message, commit the changes with `git commit -m "<message>"`.
4. If I don't approve the message, prompt for any changes and repeat step 2.
5. Ask to push the changes to the remote repository with `git push origin <branch>`.