#!/bin/bash -x

END=$(($1-1))
for i in $(seq 0 $END); do
    cargo run --release --bin verify_contribution circuit.json response_$i response_$((i+1))
done