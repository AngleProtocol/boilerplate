// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

import "forge-std/Script.sol";
// import "../../contracts/amoMinter/AMOMinter.sol";
// import "../../contracts/AMOs/implementations/curve/BPAMOs/MultiStakerCurveAgEURvEUROCAMO.sol";
// import "../../contracts/keeperJobs/curve/BPAMOJob.sol";
// import "./mainnet.sol";
import "../../../contracts/example/MockAgEUR.sol";

contract DeployMockAgEUR is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        MockAgEUR token = new MockAgEUR();

        vm.stopBroadcast();
    }
}
