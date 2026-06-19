# cloud/ — Node 1: laptop backend + campaign GUI

- `service/` — vsomeip + CommonAPI app offering `OtaService` to the guard; emits progress to the GUI.
- `gui/`     — campaign dashboard (FastAPI + JS): pick a bundle, deploy, watch progress/result.
- `bundles/` — signed `.raucb` store (contents gitignored).

Also where bundles are **signed** (see `scripts/sign-bundle.sh`).
