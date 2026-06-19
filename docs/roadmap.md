# Roadmap

Dependency-ordered for solo work. **Spikes first** to retire the biggest risks.

## Phase 0 — Contract & scaffolding
- [ ] Franca `OtaService` IDL + SOME/IP deployment (`idl/`)
- [ ] Generate CommonAPI stubs/proxies
- [ ] Repo scaffold by node
- [ ] Signing keypair (`scripts/gen-keys.sh`) + bundle manifest format

## Phase 1 — De-risk spikes
- [ ] Spike A: vsomeip + CommonAPI on QNX Pi5 — hello service QNX <-> laptop
- [ ] Spike B: RAUC + tryboot A/B on Yocto Pi5 — install + forced rollback
- [ ] Validate QNX dual-NIC (outer + inner interfaces)

## Phase 2 — Target node (Yocto)
- [ ] meta-ota image + A/B `.wks` + RAUC `system.conf` + tryboot wiring
- [ ] vsomeip / CommonAPI recipes
- [ ] OTA agent: consume guard -> HTTP download -> `rauc install` -> progress events
- [ ] Qt IVI app: version + live progress + visible post-swap change

## Phase 3 — Cloud node (laptop)
- [ ] vsomeip / CommonAPI cloud service (bundle store, requestUpdate, progress relay)
- [ ] Campaign GUI (pick bundle, deploy, watch)
- [ ] Bundle signing pipeline

## Phase 4 — Guard node (QNX)
- [ ] CTI image with gateway binary baked via snippets
- [ ] Productionize vsomeip from Spike A
- [ ] Gateway logic: verify signature/policy -> cache -> relay control + serve bundle -> segment

## Phase 5 — Integration + security + demo
- [ ] End-to-end happy path (deploy -> guard -> target -> A/B switch -> IVI new version)
- [ ] Failure paths (bad signature rejected at guard; bad update -> rollback)
- [ ] Defense-in-depth signing (cloud -> guard -> RAUC re-verify)
- [ ] Rollback watchdog (boot counter) + health-check
- [ ] Record demo

## Phase 6 — Stretch
- [ ] QNX hypervisor (Linux guest on the guard Pi5)
- [ ] RAUC delta / casync updates
- [ ] Multiple targets / MQTT outer leg
