# idl/ — shared OtaService contract

Build this **first**. All three nodes generate CommonAPI stubs/proxies from these files,
so they can be developed independently against the same interface.

- `OtaService.fidl`  — Franca interface (methods, attributes, broadcasts).
- `OtaService.fdepl` — CommonAPI-SOMEIP deployment (service/method/event IDs).

Generate C++ with `commonapi-core-generator` + `commonapi-someip-generator`.
