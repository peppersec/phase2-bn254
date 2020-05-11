#!/bin/bash

wget https://tornado-cash-ceremony.s3-us-west-2.amazonaws.com/circuit.json
wget https://tornado-cash-ceremony.s3-us-west-2.amazonaws.com/phase1radix2m15
wget https://tornado-cash-ceremony.s3-us-west-2.amazonaws.com/initial.params
mv initial.params response_0

for i in $(seq 0 $1); do
    wget https://tornado-cash-ceremony.s3-us-west-2.amazonaws.com/response_$i >> download.log 2>&1 &
done