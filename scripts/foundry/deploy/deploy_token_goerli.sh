#!/usr/bin/env bash

if [ -f .env ]
then
  export $(cat .env | xargs) 
else
    echo "Please set your .env file"
    exit 1
fi

forge create ./contracts/example/MockAgEUR.sol:MockAgEUR -i --rpc-url 'https://eth-goerli.g.alchemy.com/v2/'${ALCHEMY_GOERLI_KEY} --private-key ${PRIVATE_KEY} --etherscan-api-key ${ETHERSCAN_API_KEY} --verify