#!/bin/bash

# Clone original repo
mkdir -p ~/.nexus
cd ~/.nexus
git clone https://github.com/nexus-xyz/network-api
cd ~/.nexus/network-api/clients/cli

# Apply hardcoded patch
cd ~/.nexus/network-api/clients/cli
rm -rf build.rs
wget https://raw.githubusercontent.com/Sakura-nee/network-api/refs/heads/main/clients/cli/build.rs -O ~/.nexus/network-api/clients/cli/build.rs

rm -rf src/setup.rs
wget https://gist.githubusercontent.com/Sakura-nee/ed9b08773c20c05f69ce586311843454/raw/9655e8bfeb801bee121853b33c7dd2c815d6ed26/setup.rs -O ~/.nexus/network-api/clients/cli/src/setup.rs

# start prover
source ~/.cargo/env; rustup target add riscv32i-unknown-none-elf; cargo run -r -- start --env beta
