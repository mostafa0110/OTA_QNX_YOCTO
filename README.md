# OTA_QNX_YOCTO

Cross-platform **Over-The-Air (OTA) update system** for an automotive-style network:
a cloud backend pushes a **signed full-rootfs update** through a hardened **QNX gateway**
to an **embedded-Linux (Yocto) target** that swaps its root filesystem using **A/B partitions**.

## Nodes

| Node | Hardware / OS | Role |
|---|---|---|
| **cloud** | Laptop (Linux) | Update server + campaign GUI. Stores & signs `.raucb` bundles, offers the `OtaService`. |
| **guard-qnx** | Raspberry Pi 5 + QNX 8.0 (CTI image) | Outward-facing gateway. Verifies signature/policy, caches the bundle, relays control over SOME/IP and serves bytes over HTTP to the internal net, enforces segmentation. |
| **target-yocto** | Raspberry Pi 5 + Yocto (custom image) | Internal ECU. RAUC drives A/B rootfs swap via native Raspberry Pi `tryboot`; Qt IVI app shows live update progress. |

## Communication

- **Control plane:** one shared CommonAPI / Franca `OtaService` (`idl/`) over **vsomeip (SOME/IP)**.
- **Data plane:** the rootfs bundle is fetched over **HTTP/TCP** from the guard's verified cache (SOME/IP is not used for bulk transfer).

```
[cloud / laptop] --outer--> [guard / RPi5 QNX] --internal--> [target / RPi5 Yocto]
  bundle store               verify + cache                   RAUC A/B + tryboot
  campaign GUI               relay + segment                  Qt IVI
```

## Repo layout

```
idl/            shared OtaService contract (build first) — Franca .fidl + SOME/IP .fdepl
cloud/          Node 1: vsomeip service + web GUI + signed-bundle store
guard-qnx/      Node 2: gateway app (verify/policy/relay) + CTI snippets + vsomeip config
target-yocto/   Node 3: meta-ota Yocto layer + RAUC config + OTA agent + Qt IVI
keys/           signing keys (gitignored)
scripts/        build / sign / deploy helpers
docs/           architecture + roadmap
```

## Build order (see `docs/roadmap.md`)

0. Define `idl/OtaService` contract + scaffold (this).
1. **Spikes:** vsomeip-on-QNX hello service; RAUC+tryboot A/B install+rollback on Yocto Pi5.
2. Target node (Yocto image, RAUC, agent, IVI).
3. Cloud node (service + GUI + signing).
4. Guard node (CTI image + gateway).
5. End-to-end + security + rollback + demo.

## First push

```bash
# the scaffold ships with git initialised and the remote set
git push -u origin main
```

> ⚠️ Seed config files (`.wks`, `system.conf`, vsomeip JSON, partition nodes) are **starting points** to validate during the Spike phase — not final values.
