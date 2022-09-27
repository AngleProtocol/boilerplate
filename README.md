# <img src="logo.svg" alt="Angle Borrowing Module" height="40px"> Angle Project Boilerplate

This repository proposes a template that mixes hardhat and foundry frameworks. It also provides templates for EVM compatible smart contracts (in `./contracts/examples`), tests and deployment scripts.

## Starting

### Install packages

You can install all dependencies by running

```bash
yarn
```

### Create `.env` file

You must create an `.env` that has:

- `PRIVATE_KEY`
- `MNEMONIC`
- network key (eg. `ALCHEMY_NETWORK_KEY`)
- `ETHERSCAN_API_KEY`

## Repo structure

<html lang="en"><head><meta charset="utf-8"><title>Hardhat Docgen</title><link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"><script defer="defer" src="./docs/main.js"></script></head><body><div id="app"></div></body></html>

## Hardhat

## Foundry

### Installation

```bash
curl -L https://foundry.paradigm.xyz | bash

source /root/.zshrc
# or, if you're under bash: source /root/.bashrc

foundryup
```

To install the standard library:

```bash
forge install foundry-rs/forge-std
```

### Foundry on Docker 🐳

**If you don’t want to install Rust and Foundry on your computer, you can use Docker**
Image is available here [ghcr.io/foundry-rs/foundry](http://ghcr.io/foundry-rs/foundry).

```bash
docker pull ghcr.io/foundry-rs/foundry
docker tag ghcr.io/foundry-rs/foundry:latest foundry:latest
```

To run the container:

```bash
docker run -it --rm -v $(pwd):/app -w /app foundry sh
```

Then you are inside the container and can run Foundry’s commands.

### Tests

You can run tests as follows:

```bash
forge test -vvvv --watch
forge test -vvvv --match-path contracts/forge-tests/KeeperMulticall.t.sol
forge test -vvvv --match-test "testAbc*"
forge test -vvvv --fork-url https://eth-mainnet.alchemyapi.io/v2/Lc7oIGYeL_QvInzI0Wiu_pOZZDEKBrdf
```

You can also list tests:

```bash
forge test --list
forge test --list --json --match-test "testXXX*"
```

## Media

Don't hesitate to reach out on Twitter 🐦
