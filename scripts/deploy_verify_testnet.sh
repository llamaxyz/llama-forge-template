#!/usr/bin/env bash
if [ ! -f ../.env ]
then
  export $(cat .env | xargs)
fi

# Read the Testnet RPC URL
echo Enter your Testnet RPC URL:
echo Example: "https://eth-rinkeby.alchemyapi.io/v2/XXXXXXXXXX"
read -s rpc

# Read the contract name
echo Which contract do you want to deploy \(eg Greeter\)?
read contract

# Read the constructor arguments
echo Enter constructor arguments separated by spaces \(eg 1 2 3\):
read -ra args

if [ -z "$args" ]
then
  FOUNDRY_PROFILE=deploy forge create -i --rpc-url ${rpc} ./src/${contract}.sol:${contract} --verify
else
  FOUNDRY_PROFILE=deploy forge create -i --rpc-url ${rpc} --constructor-args ${args} ./src/${contract}.sol:${contract} --verify
fi
