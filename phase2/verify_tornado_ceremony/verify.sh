#!/bin/bash
set -e

cargo build --release --bin verify_contribution
for i in $(seq 1 1114); do
  ../target/release/verify_contribution circuit.json response_$((i - 1)) response_$i
done