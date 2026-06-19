# target-yocto/ — Node 3: RPi5 + Yocto custom image

Internal ECU that swaps its whole rootfs via A/B partitions.

- `meta-ota/`   — custom Yocto layer: OTA image, RAUC integration, A/B `.wks`, vsomeip/CommonAPI.
- `ota-agent/`  — C++ agent: consume guard `OtaService`, HTTP-download bundle, drive `rauc install`,
                  emit `updateProgress` / `updateResult`, run health-check.
- `ivi/`        — Qt Quick (QML) IVI app: show version + live progress + a visible post-swap change.

A/B switching uses the **native Raspberry Pi `tryboot` / `autoboot.txt`** mechanism (no U-Boot),
driven by RAUC's custom bootloader backend.
