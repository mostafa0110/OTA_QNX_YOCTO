# Using Claude Code with this repo

## Install & first run
1. `npm install -g @anthropic-ai/claude-code` (Node 18+).
2. From the repo root: `claude`
3. Authenticate when prompted.
4. First launch asks to approve the `@docs/roadmap.md` import — accept.

> Don't run `/init` — this repo already ships a tailored `CLAUDE.md` + `.claude/rules/`. `/init` would only suggest additions.

## How the memory is layered (the "better approach")
- `CLAUDE.md` (root) — loaded every session: identity, architecture, locked decisions, conventions, caveats.
- `.claude/rules/*.md` — **path-scoped**. Each node's rules load only when you open files in that node (`idl/`, `cloud/`, `guard-qnx/`, `target-yocto/`), so QNX guidance doesn't clutter Yocto work and vice-versa.
- `/memory` — see exactly what's loaded; toggle auto-memory (Claude's own per-repo notes).

This keeps every file well under the ~200-line adherence sweet spot and loads toolchain context only where relevant.

## Slash commands
- `/codegen <node>` — regenerate CommonAPI stubs from `idl/`.
- `/spike A|B` — run a de-risk spike checklist.

## Permissions (`.claude/settings.json`)
Pre-allows safe git/build commands, **asks** before `bitbake` / `git push`, and **denies** destructive ones (`dd`, `mkfs`, `rm -rf`) and secret reads. Tune freely; rule syntax is `Tool(specifier)` with `*` wildcards.

## Working style for this project
- **Spikes first** — start with `/spike A` and `/spike B`; they're the biggest risks.
- **Plan mode** (Shift+Tab) for boot/partitioning, RAUC slots, or IDL-contract changes.
- **Long builds:** Yocto `bitbake` runs for hours — run those yourself; let Claude write/debug recipes (settings asks before bitbake for this reason).
- **Cross-compile:** nothing builds on the Pi; all builds run on this host.
- Keep `docs/roadmap.md` checkboxes in sync — it mirrors the ClickUp board.

## Optional: let Claude update ClickUp
To have Claude tick off tasks on the board, add a ClickUp MCP with `claude mcp add` (see `claude mcp --help`). Not required — the roadmap checkboxes work standalone.

## Optional: personal notes
Put machine-specific paths (SDP location, board IPs) in `CLAUDE.local.md` (gitignored) so they persist without being committed.
