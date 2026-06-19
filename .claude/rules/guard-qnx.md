---
paths:
  - "guard-qnx/**"
---
# Rule: QNX guard node

- Platform **QNX SDP 8.0** on **Raspberry Pi 5**. Build with `qcc`/`q++`; source the SDP env (`qnxsdp-env.sh`) first.
- Image: build the deployable image with **CTI** (snippet-driven); use the **quick image** only to smoke-test; edit the **BSP buildfile under `src/...`** for low-level (interface/UART) tweaks — never the one in `images/` (it's overwritten on build).
- **vsomeip + CommonAPI must be ported to QNX (POSIX build)** — this is Spike A and the biggest risk. Verify it runs before building gateway logic.
- The guard is the **only** node facing the outer link: verify signature + policy (target id, monotonic version, size) -> cache -> relay control over SOME/IP + serve bytes over HTTP inward. Enforce segmentation (target has no outward route).
- Dual-NIC (outer + inner) needs a QNX io-pkt driver for the second interface — validate early.
- Don't claim a QNX API works without checking the official QNX 8.0 docs first.
