#!/bin/bash -x

while true; do
	CURRENT=`cat current`
	echo $((CURRENT+1)) > current
	if [ $CURRENT -ge $1 ]; then
		exit 0
	fi
	./target/release/verify_contribution circuit.json response_$CURRENT response_$((CURRENT+1)) >> verify.log 2>&1
done