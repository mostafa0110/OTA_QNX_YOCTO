#!/usr/bin/env bash
# Dev signing material for RAUC bundles (NOT for production).
set -euo pipefail
cd "$(dirname "$0")/../keys"
openssl req -x509 -newkey rsa:4096 -nodes -keyout dev-signing.key.pem \
    -out dev-signing.cert.pem -subj "/O=OTA-Demo/CN=ota-dev" -days 3650
echo "Wrote keys/dev-signing.key.pem + dev-signing.cert.pem"
