# Tornado.Cash ceremony verification

This dir contains scripts that allow to verify tornado.cash trusted setup ceremony. To download all contributions you will need 15Gb of disk space.

```sh
git clone https://github.com/tornadocash/phase2-bn254
cd phase2-bn254/phase2/verify_tornado_ceremony

# Download all tornado.cash contributions
./download.sh

# Verify each contribution
./verify.sh

# Generate keys and Verifier.sol contract
./generate.sh
```

There are also multithreaded scripts for advanced users in phase2-bn254/phase2 (download.sh and batch.sh)