#!/usr/bin/env bash

if [ -f .env ]
then
  export $(cat .env | xargs) 
else
    echo "Please set your .env file"
    exit 1
fi

forge create ./src/Base.sol:Base -i --rpc-url 'https://eth-rinkeby.alchemyapi.io/v2/'${ALCHEMY_KEY} --private-key ${PRIVATE_KEY}