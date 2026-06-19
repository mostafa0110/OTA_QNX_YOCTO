---
description: Run a de-risk spike checklist (A or B)
---
Walk through de-risk Spike "$ARGUMENTS":
- **A** = vsomeip + CommonAPI on QNX Pi5: build the runtimes for SDP 8.0, run a hello `OtaService` QNX <-> laptop, report what worked/failed.
- **B** = RAUC + tryboot A/B on Yocto Pi5: minimal image, `rauc install` a bundle, reboot into slot B, force a failure, confirm rollback.

Plan the steps first (plan mode), confirm hardware assumptions with me, then proceed. Tick the matching checkbox in `docs/roadmap.md` when done.
