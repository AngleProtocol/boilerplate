// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { console } from "forge-std/console.sol";
import "../../contracts/example/Base.sol";

contract BaseTest is Test {
    Base public base;

    function setUp() public {
        // TODO: add label
        base = new Base(msg.sender);
    }

    function destroy() public returns (uint256) {
        selfdestruct(payable(0));
        return 1;
    }

    // TODO: Deployment check
    function testExample1() public view {
        console.log("Calling first test");
        assert(base.isBase() == true);
    }

    // TODO: use assertEq

    // TODO: with Fuzzing

    // TODO: Customized errors
}
