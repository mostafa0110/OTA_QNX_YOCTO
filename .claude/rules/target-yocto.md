---
paths:
  - "target-yocto/**"
---
# Rule: Yocto target node

- Yocto release **scarthgap (5.0 LTS)**; machine **raspberrypi5**; layer `meta-ota`.
- A/B uses **RAUC** + the Raspberry Pi firmware **tryboot/autoboot.txt** backend (`bootloader=custom`). NOT U-Boot (Pi5 U-Boot can't boot USB/NVMe).
- `system.conf` slots + `.wks` layout are **unvalidated seeds** — confirm partition devices on hardware (Spike B) first.
- Bundles are **signed**; the public cert goes in the image keyring (`/etc/rauc/keyring.pem`). RAUC re-verifies before slot write.
- IVI: Qt Quick/QML via **meta-qt6**; subscribes to `OtaService.updateProgress`.
- The OTA agent drives `rauc install` after HTTP-downloading the bundle **from the guard** (not the cloud directly).
- Cross-compile only; recipes use bitbake — never assume on-target builds.
