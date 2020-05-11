#!/bin/bash

cargo build --release --bin verify_contribution
echo "0" > current

for i in $(seq 0 $1); do
    ./verify.sh $2 &
    sleep 1
done