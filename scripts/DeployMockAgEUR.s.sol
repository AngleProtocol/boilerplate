// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import "../contracts/example/MockAgEUR.sol";

contract DeployMockAgEUR is Script {
    MockAgEUR public token;

    function run() external {
        uint256 deployerPrivateKey = vm.deriveKey(vm.envString("MNEMONIC_GOERLI"), 0);
        address deployer = vm.rememberKey(deployerPrivateKey);

        console.log("Deploying with ", deployer);

        vm.startBroadcast(deployer);

        token = new MockAgEUR();
        console.log("Successfully deployed contract at the address: ", address(token));

        vm.stopBroadcast();
    }
}
