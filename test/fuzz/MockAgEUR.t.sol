// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { console } from "forge-std/console.sol";
import "../../contracts/example/MockAgEUR.sol";

contract MockAgEURFuzzTest is Test {
    address payable public alice;
    address payable public bob;
    MockAgEUR public token;

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
        token = new MockAgEUR();
    }

    function testMintTransfer(uint256 _amount, uint256 _toTransfer) public {
        vm.assume(_amount <= 1000000);
        vm.assume(_toTransfer <= _amount);
        token.mint(alice, _amount);
        assertEq(token.balanceOf(alice), _amount);
        assertEq(token.balanceOf((bob)), 0);
        vm.prank(alice);
        token.approve(address(this), 1000000);
        token.transferFrom(alice, bob, _toTransfer);
        assertEq(token.balanceOf(alice), _amount - _toTransfer);
        assertEq(token.balanceOf((bob)), _toTransfer);
    }
}
