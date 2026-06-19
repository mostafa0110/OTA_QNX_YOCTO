# keys/ — signing material (gitignored)

Generate a dev keypair/cert for RAUC bundle signing. The public cert is baked into the
target image keyring (`/etc/rauc/keyring.pem`); the guard verifies the same signature.

    ../scripts/gen-keys.sh    # creates ca.pem / signing key + cert here (gitignored)
