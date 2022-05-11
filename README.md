# Llama Forge Template

This template is inspired by [Cleanunicorn's template](https://github.com/cleanunicorn/ethereum-smartcontract-template).

It requires [Foundry](https://github.com/gakonst/foundry) installed to run. You can find instructions here [Foundry installation](https://github.com/gakonst/foundry#installation).

## Installation

### GitHub template

It's easiest to start a new project by clicking the ["Use this template"](https://github.com/llama-community/llama-forge-template).

### Manual installation

If you want to create your project manually, clone the template in a new folder and `cd` into it.

Clone the template, install dependencies and make sure tests work:

```sh
$ forge init --template https://github.com/llama-community/llama-forge-template my-repo
$ cd my-repo
$ npm install
$ forge install
```

## Setup

- Rename `.env.example` to `.env`. Add a valid URL for an Ethereum JSON-RPC client for the `RPC_URL` variable

## Deploy and Verify

When you're ready to deploy run `./scripts/deploy.sh` and follow the prompts. To verify your contract on Etherscan, run `./scripts/verify.sh` and also follow the prompts. To confirm the deploy was successful, re-run your test suite but use the newly created contract address.