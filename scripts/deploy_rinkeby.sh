#!/usr/bin/env bash
if [ ! -f ../.env ]
then
  export $(cat .env | xargs)
fi

# Read the Rinkeby RPC URL
echo Enter Your Rinkeby RPC URL:
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
  FOUNDRY_PROFILE=deploy forge create -i --rpc-url ${RPC_URL_RINKEBY} ./src/${contract}.sol:${contract}
else
  FOUNDRY_PROFILE=deploy forge create -i --rpc-url ${RPC_URL_RINKEBY} --constructor-args ${args} ./src/${contract}.sol:${contract}
fi
