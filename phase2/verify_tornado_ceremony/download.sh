#!/bin/bash
set -e

wget https://tornado-cash-ceremony.s3-us-west-2.amazonaws.com/circuit.json
wget https://tornado-cash-ceremony.s3-us-west-2.amazonaws.com/phase1radix2m15
wget https://tornado-cash-ceremony.s3-us-west-2.amazonaws.com/initial.params
mv initial.params response_0

for i in $(seq 1 1114); do
    wget https://tornado-cash-ceremony.s3-us-west-2.amazonaws.com/response_$i
done