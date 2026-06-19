---
description: Generate CommonAPI C++ stubs/proxies from idl/OtaService
---
Generate CommonAPI C++ from `idl/OtaService.fidl` + `idl/OtaService.fdepl`:

1. Confirm `commonapi-core-generator` and `commonapi-someip-generator` are on PATH.
2. Run the core generator on the `.fidl`, then the SOME/IP generator on the `.fdepl`, into the consuming node's `src-gen/`.
3. Show the generated file list + any warnings. Don't edit generated files by hand.

Target node: $ARGUMENTS (cloud | guard-qnx | target-yocto). If empty, ask which node.
