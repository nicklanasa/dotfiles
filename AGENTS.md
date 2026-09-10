# Documentation

- Follow repository-specific `AGENTS.md` instructions when they specify another format.
- When no repository instruction exists, preserve the format already used by nearby documentation.

# External actions

- Do not commit, push, deploy, publish, or release unless explicitly requested.
- Treat committing and pushing as separate actions that each require explicit permission.

# Verification

- After making changes, run the narrowest relevant tests, checks, or validation available.
- Report what was run and whether it passed.
- If validation cannot be run, explain why.

# Change discipline

- Keep changes focused on the requested task.
- Preserve existing user changes and do not revert or overwrite unrelated work.
- Do not edit generated files directly; update their source or use the appropriate generator.

# Sensitive information

- Never expose or store credentials, access tokens, private keys, or other secrets in source files, logs, patches, or command rules.
- Redact sensitive values from command output and reports.
- If an exposed credential is discovered, stop using it and alert the user that it may need to be revoked or rotated.

# Dependencies and tooling

- Use the package manager and tooling already established by the repository.
- Ask before adding, removing, or replacing a production dependency.
- Prefer existing dependencies and built-in platform capabilities when they reasonably fit.
- Update generated lockfiles through the package manager instead of editing them manually.
