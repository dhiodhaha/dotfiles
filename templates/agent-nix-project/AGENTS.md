# Agent Workflow

This repo is optimized for agent-assisted development. Keep the workflow simple:
enter the declared environment, run the same commands locally and in CI, then make
small reviewable changes.

## Environment

Use Nix when available:

```bash
nix develop
```

Run one-off commands through the Nix shell:

```bash
nix develop -c just ci
```

If Nix is not installed yet, use the versions documented in `flake.nix` and keep
local tool versions as close as possible.

## Common Commands

```bash
just setup      # install project dependencies
just dev        # start local development server
just fmt        # format code
just lint       # run linters
just test       # run tests
just build      # production build
just ci         # local CI gate before push
```

Agents should prefer `just ci` before declaring work complete.

## Rules For Agents

- Read the existing code before editing.
- Keep edits scoped to the user request.
- Do not rewrite unrelated files.
- Do not delete user work.
- Prefer existing project patterns over new abstractions.
- Add or update tests when behavior changes.
- If CI fails, fix the cause instead of weakening checks.
- If a command fails because a tool is missing, check `flake.nix` first.

## Project Boundaries

Use Nix for reproducible project tools. Do not use Nix to hide application logic,
secrets, or production-only configuration.

Keep secrets out of git:

```text
.env
.env.local
.env.*.local
```

## CI Contract

CI should run the same gate as local development:

```bash
nix develop -c just ci
```

When changing CI, keep the local command and CI command aligned.
