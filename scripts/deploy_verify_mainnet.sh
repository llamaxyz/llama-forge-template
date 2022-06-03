#!/usr/bin/env bash
if [ ! -f ../.env ]
then
  export $(cat .env | xargs)
fi

# Read the contract name
echo Which contract do you want to deploy \(eg Greeter\)?
read contract

# Read the constructor arguments
echo Enter constructor arguments separated by spaces \(eg 1 2 3\):
read -ra args

if [ -z "$args" ]
then
  FOUNDRY_PROFILE=deploy forge create -i --rpc-url ${RPC_URL} ./src/${contract}.sol:${contract} --verify
else
  FOUNDRY_PROFILE=deploy forge create -i --rpc-url ${RPC_URL} --constructor-args ${args} ./src/${contract}.sol:${contract} --verify
fi
