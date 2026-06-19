---
paths:
  - "idl/**"
---
# Rule: the OtaService contract

- `idl/OtaService.fidl` (Franca) is the **single source of truth**. Change it deliberately; every node regenerates from it.
- Keep `idl/OtaService.fdepl` (SOME/IP service/method/event IDs) in sync with the `.fidl`.
- Generate C++ with `commonapi-core-generator` + `commonapi-someip-generator`. Don't hand-write stubs/proxies.
- Bump the interface `version { major minor }` on breaking changes and coordinate all three nodes.
- `requestUpdate` carries `bundleUrl` (HTTP locator) + `sha256` — this encodes the control/bulk split. Don't add bulk payload fields to SOME/IP messages.
