# guard-qnx/ — Node 2: RPi5 + QNX 8.0 gateway

The hardened, outward-facing node. Verifies, caches, and relays — the target has no outward route.

- `src/`           — gateway app (C++): consume cloud `OtaService`, verify signature + policy
                     (target id / monotonic version / size), cache bundle, re-offer control over
                     SOME/IP + serve bytes over HTTP to the internal net.
- `cti/snippets/`  — CTI snippet files to bake the gateway binary + config into the QNX image
                     (system_files / boot_files / post_start).
- `config/`        — vsomeip JSON (endpoints, service IDs, service discovery).

Build path: boot the QNX **quick image** to smoke-test the Pi5, then build the deployable
image with **CTI**; edit the RPi5 **BSP buildfile** only for low-level (interface/UART) tweaks.
