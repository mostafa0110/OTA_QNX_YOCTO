# Architecture

Three nodes, one shared service interface.

- **cloud (laptop):** signed-bundle store + campaign GUI. Signs each `.raucb`, offers `OtaService.requestUpdate`, relays progress to the GUI.
- **guard (RPi5 / QNX):** the only node bridging the outer link to the internal vehicle net. Steps: terminate outer connection → verify bundle signature + policy (target id, monotonic version, size) → cache → re-offer control over SOME/IP + serve the bundle over HTTP internally. The target has no outward route (segmentation).
- **target (RPi5 / Yocto):** OTA agent consumes the guard service, downloads the bundle (HTTP), hands it to **RAUC**, which installs into the inactive A/B slot and flips the boot via Raspberry Pi `tryboot`. Health-check + automatic rollback. Qt IVI app subscribes to `updateProgress`.

## Transport decision
- Control = CommonAPI/SOME/IP (`requestUpdate`, `getStatus`, `updateProgress`, `updateResult`).
- Bulk = HTTP/TCP from the guard cache. `requestUpdate` carries a `bundleUrl` locator.

## Security (defense in depth)
cloud signs → guard verifies → RAUC re-verifies against the on-target keyring before slot write.
