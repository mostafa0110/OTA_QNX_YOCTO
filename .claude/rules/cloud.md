---
paths:
  - "cloud/**"
---
# Rule: cloud / laptop node

- Offers `OtaService` over vsomeip; hosts signed `.raucb` bundles; relays progress to the GUI.
- GUI: FastAPI + a small JS frontend (pick bundle -> deploy -> watch progress/result). Keep it simple.
- **Signing happens here** (`scripts/sign-bundle.sh`). Keys live in `keys/` (gitignored) — never commit or print private keys.
- For the showcase the cloud may speak SOME/IP directly to the guard; a realistic MQTT/HTTP outer leg is a Phase 6 stretch.
