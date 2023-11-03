// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import { console } from "forge-std/console.sol";

import "../contracts/example/MockAgEURUpgradeable.sol";

import "./Utils.s.sol";

contract DeployMockAgEURUpgradeable is Utils {
    MockAgEURUpgradeable public token;

    function run() external {
        uint256 deployerPrivateKey = vm.deriveKey(vm.envString("MNEMONIC_GOERLI"), 0);
        address deployer = vm.rememberKey(deployerPrivateKey);

        console.log("Deploying with ", deployer);

        vm.startBroadcast(deployer);

        MockAgEURUpgradeable implementation = new MockAgEURUpgradeable();
        token = MockAgEURUpgradeable(
            deployUpgradeable(
                address(implementation),
                abi.encodeWithSelector(token.initialize.selector, "Angle Euro", "agEUR")
            )
        );

        console.log("Successfully deployed contract at the address: ", address(token));

        vm.stopBroadcast();
    }
}
