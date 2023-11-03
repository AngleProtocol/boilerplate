#! /bin/bash

function option_to_uri {
  option=$1

  case $option in
    "1")
      echo $ETH_NODE_URI_MAINNET
      ;;
    "2")
      echo $ETH_NODE_URI_ARBITRUM
      ;;
    "3")
      echo $ETH_NODE_URI_POLYGON
      ;;
    "4")
      echo $ETH_NODE_URI_GNOSIS
      ;;
    "5")
      echo $ETH_NODE_URI_AVALANCHE
      ;;
    "6")
      echo $ETH_NODE_URI_BASE
      ;;
    "7")
        echo $ETH_NODE_URI_BSC
        ;;
    "8")
        echo $ETH_NODE_URI_CELO
        ;;
    "9")
        echo $ETH_NODE_URI_POLYGON_ZKEVM
        ;;
    "10")
        echo $ETH_NODE_URI_OPTIMISM
        ;;
    *)
      ;;
  esac
}

function main {
    if [ ! -f .env ]; then
        echo ".env not found!"
        exit 1
    fi
    source .env

    echo "Which chain would you like to fork ?"
    echo "- 1: Ethereum Mainnet"
    echo "- 2: Arbitrum"
    echo "- 3: Polygon"
    echo "- 4: Gnosis"
    echo "- 5: Avalanche"
    echo "- 6: Base"
    echo "- 7: Binance Smart Chain"
    echo "- 8: Celo"
    echo "- 9: Polygon ZkEvm"
    echo "- 10: Optimism"

    read option

    uri=$(option_to_uri $option)
    if [ -z "$uri" ]; then
        echo "Unknown network"
        exit 1
    fi

    echo "Forking $uri"
    anvil --fork-url $uri
}

main
