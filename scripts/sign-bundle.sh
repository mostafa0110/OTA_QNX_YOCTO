#!/usr/bin/env bash
# Wrap a rootfs into a signed RAUC bundle. Usage: sign-bundle.sh <input-dir> <out.raucb>
set -euo pipefail
IN="${1:?input bundle dir}"; OUT="${2:?output .raucb}"
rauc bundle \
    --cert ../keys/dev-signing.cert.pem \
    --key  ../keys/dev-signing.key.pem \
    "$IN" "$OUT"
echo "Signed bundle -> $OUT"
