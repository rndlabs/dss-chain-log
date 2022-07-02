#!/usr/bin/env bash
### chainlog -- list keys in ascii and addresses from the ChainLog
### Usage:
### ./chainlog.sh list all entry-values in the chainlog
### ./chainlog.sh <entry> return the entry's address
set -e

[[ "$ETH_RPC_URL" ]] || { echo "Please set a ETH_RPC_URL"; exit 1; }

CHANGELOG=0x4989f405b9c449ccf3fdea0f60b613aff1e55e14

echo -e "Network: $(cast chain-id)"
if [[ -z $1 ]];
then
    list=$(cast call "$CHANGELOG" 'list()(bytes32[])')
    IFS=","
    for key in $list
    do
        cast --to-ascii "$key"
        cast call "$CHANGELOG" 'getAddress(bytes32)(address)' "$key"
    done

else
    cast call "$CHANGELOG" 'getAddress(bytes32)(address)' "$(cast --to-bytes32 "$(cast --from-ascii "$1")")"
fi
