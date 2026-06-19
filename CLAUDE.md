# CLAUDE.md — OTA_QNX_YOCTO

Guidance for Claude Code in this repo. Keep it accurate; fix it when I correct you.

## What this is
A 3-node automotive **OTA update system**: a cloud backend pushes a **signed full-rootfs update** through a hardened **QNX gateway** to an **embedded-Linux (Yocto) target** that swaps its whole rootfs using **A/B partitions**.

| Node | Dir | HW / OS | Role |
|---|---|---|---|
| Cloud | `cloud/` | Laptop / Linux | Signed `.raucb` store, `OtaService` server, campaign GUI, signing |
| Guard | `guard-qnx/` | RPi5 / QNX 8.0 (CTI) | Verify signature+policy, cache, relay; outward-facing; segmentation |
| Target | `target-yocto/` | RPi5 / Yocto | RAUC A/B via tryboot; OTA agent; Qt IVI |

## Locked decisions (don't relitigate unless I ask)
- Target board: **2nd Raspberry Pi 5** (Pi3 lacks tryboot).
- Engine: **RAUC** + Raspberry Pi **tryboot/autoboot.txt** A/B (no U-Boot).
- Transport: **SOME/IP control + HTTP bulk** — CommonAPI carries triggers/progress; rootfs bytes over HTTP from the guard cache.
- Contract-first: the Franca `OtaService` in `idl/` is the single source of truth; all nodes codegen from it.

## Repo layout
- `idl/` — shared `OtaService` (Franca `.fidl` + SOME/IP `.fdepl`) — **build first**
- `cloud/` · `guard-qnx/` · `target-yocto/` — the three nodes
- `keys/` signing material (gitignored) · `scripts/` helpers · `docs/` architecture + roadmap

Node-specific rules auto-load from `.claude/rules/` when you open files in each node.

## Workflow
- **Spikes first.** Before full builds, do Spike A (vsomeip-on-QNX) and Spike B (RAUC+tryboot A/B). See @docs/roadmap.md.
- Use **plan mode** for anything touching boot/partitioning, RAUC slots, or the IDL contract — mistakes there can brick an SD card.
- Seed configs (`.wks`, `system.conf`, vsomeip JSON, partition nodes) are **unvalidated starting points** — confirm on hardware in the spikes before trusting them.
- **Cross-compilation only**: nothing builds on the Pi. All builds run on this Linux host.

## Conventions
- C++17, 4-space indent; one CMake target per node component.
- Keep `docs/roadmap.md` checkboxes in sync as phases complete.
- Never commit anything under `keys/` or any `*.raucb`.
- Conventional commits (`feat:`, `chore:`, `fix:`).

## Build caveats
- **Yocto `bitbake` runs for hours** and is bandwidth-heavy. Don't start a full image build unless I ask — edit recipes and let me run it. Long builds can exceed tool timeouts.
- **`dd`/flashing is destructive** — never write to a block device; hand me the command.

## Roadmap
Phase plan + tasks: @docs/roadmap.md. Mirrored in ClickUp (folder "Automotive OTA (QNX + Yocto)").
