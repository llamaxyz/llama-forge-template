#!/usr/bin/env bash
if [ ! -f ../.env ]
then
  export $(cat .env | xargs)
fi

# TODO: Remove this prompt and parse dynamically
echo Which compiler version did you use to build?

read version

echo $version

echo Which contract do you want to verify?

read contract

echo $contract

echo What is the deployed address?

read deployed

echo $deployed

echo Enter constructor arguments separated by spaces \(eg 1 2 3\):

read -ra args

echo $args

if [ -z "$args" ]
then
  forge verify-contract --num-of-optimizations 1000000 --compiler-version \"$version\" $deployed ./src/${contract}.sol:${contract} ${ETHERSCAN_API_KEY}
else
  forge verify-contract --num-of-optimizations 1000000 --compiler-version \"$version\" $deployed ./src/${contract}.sol:${contract} ${ETHERSCAN_API_KEY} --constructor-args ${args}
fi
