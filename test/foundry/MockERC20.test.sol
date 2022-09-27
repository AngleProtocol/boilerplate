// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { console } from "forge-std/console.sol";
import "../../contracts/example/MockERC20.sol";

contract MockERC20Test is Test {
    address payable public alice;
    address payable public bob;
    MockERC20 public token;

    function setUp() public {
        /** Create users */
        alice = payable(address(uint160(uint256(keccak256(abi.encodePacked("alice"))))));
        bob = payable(address(uint160(uint256(keccak256(abi.encodePacked("bob"))))));
        vm.deal(alice, 10 ether);
        vm.deal(bob, 10 ether);
        /** Add labels to users */
        vm.label(alice, "Alice");
        vm.label(bob, "Bob");
        /** Deploy mock token */
        token = new MockERC20();
    }

    function destroy() public returns (uint256) {
        selfdestruct(payable(0));
        return 1;
    }

    function testDeploymentTest() public payable {
        assertEq(token.owner(), address(this));
        assertEq(token.name(), "Mock Token");
        assertEq(token.symbol(), "MTK");
    }

    function testUsersBalance() public payable {
        console.log("Checking ETH balance...");
        assertEq(alice.balance, 10 ether);
        assertEq(bob.balance, 10 ether);
    }

    // TODO: mint, transfer

    // TODO: with Fuzzing

    // TODO: Customized errors
}
