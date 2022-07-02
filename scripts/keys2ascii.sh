#!/usr/bin/env bash
### keys2ascii -- list keys from the ChainLog in ascii
### Usage: ./keys2ascii.sh
set -e

[[ "$ETH_RPC_URL" ]] || { echo "Please set a ETH_RPC_URL"; exit 1; }

CHANGELOG=0x4989f405b9c449ccf3fdea0f60b613aff1e55e14

echo -e "Network: $(cast chain-id)"
list=$(cast call "$CHANGELOG" 'list()(bytes32[])')
IFS=","
for key in $list
do
    cast --to-ascii "$key"
done
