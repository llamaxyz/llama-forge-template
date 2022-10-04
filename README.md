# Llama Forge Template

This template is inspired by [Cleanunicorn's template](https://github.com/cleanunicorn/ethereum-smartcontract-template).

## Installation

It requires [Foundry](https://github.com/foundry-rs/foundry) installed to run. You can find instructions here [Foundry installation](https://book.getfoundry.sh/getting-started/installation).

### GitHub template

It's easiest to start a new project by clicking the ["Use this template"](https://github.com/llama-community/llama-forge-template).

Then clone the templated repository locally and `cd` into it and run the following commands:

```sh
$ npm install
$ forge install
$ forge update
$ git submodule update --init --recursive
```

### Manual installation

If you want to create your project manually, run the following commands:

```sh
$ forge init --template https://github.com/llama-community/llama-forge-template <my-repo>
$ cd <my-repo>
$ npm install
$ forge install
$ forge update
$ git submodule update --init --recursive
```

## Setup

Duplicate `.env.example` and rename to `.env`:

- Add a valid mainnet URL for an Ethereum JSON-RPC client for the `RPC_MAINNET_URL` variable.
- Add a valid Private Key for the `PRIVATE_KEY` variable.
- Add a valid Etherscan API Key for the `ETHERSCAN_API_KEY` variable.

### Commands

- `make build` - build the project
- `make test [optional](V={1,2,3,4,5})` - run tests (with different debug levels if provided)
- `make match MATCH=<TEST_FUNCTION_NAME> [optional](V=<{1,2,3,4,5}>)` - run matched tests (with different debug levels if provided)

### Deploy and Verify

- `make deploy-contract` - deploy and verify contract on mainnet

To confirm the deploy was successful, re-run your test suite but use the newly created contract address.
