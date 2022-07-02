# dss-chain-log
![Build Status](https://github.com/rndlabs/dss-chain-log/actions/workflows/.github/workflows/tests.yaml/badge.svg?branch=main)

An auth-managed on-chain changelog, from MakerDAO, used for the rndlabs system.

## Usage

Contract Address: `0x4989f405b9c449ccf3fdea0f60b613aff1e55e14`

* [Mainnet](https://etherscan.io/address/0xda0ab1e0017debcd72be8599041a2aa3ba7e740f#code)
* [Gnosis Chain](https://blockscout.com/xdai/mainnet/address/0x4989F405b9c449Ccf3FdEa0f60B613afF1E55E14/contracts#address-tabs)

### Public functions

* `list()(bytes32[] memory)`: return all of the keys in the changelog
* `getAddress(bytes32)(address)`: for a given key, return the address
* `count()(uint256)`: return the number of keys in the changelog
* `get(uint256)(bytes32,address)`: return the key and address of an item in the array
* `version()(string)`: Returns a version for the changelog (if set)
* `wards(address)(uint256)`: 0 if address is not a ward, 1 if it is.

### Auth functions

* `rely(address)`/`deny(address)`: add and remove authorization
* `setAddress(bytes32,address)`: add or update a key/address pair
* `removeAddress(bytes32)`: remove a key (warning: this can shuffle the array)
* `setVersion(string memory)`: set the version of the current changelog

## Development

### Requirements

* [Forge](https://github.com/foundry-rs/foundry)

### Testing

```
$ forge update
$ make test
```


