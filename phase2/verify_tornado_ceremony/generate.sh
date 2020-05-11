#!/bin/bash
set -e

npm ci
# Generating dummy key files to extract circuit data from
npx snarkjs setup --protocol groth
# generate actual keys from the last contribution
cargo run --release --bin export_keys response_1114 vk.json pk.json
# patch dummy keys with actual keys params
cargo run --release --bin copy_json proving_key.json pk.json transformed_pk.json
# generate solidity verifier
cargo run --release --bin generate_verifier response_1114 Verifier.sol

# rename key files
rm proving_key.json verification_key.json pk.json
mv circuit.json withdraw.json
mv transformed_pk.json withdraw_proving_key.json
mv vk.json withdraw_verification_key.json