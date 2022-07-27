// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../contracts/ERC20.sol";

contract ContractTest is Test {
    ERC20 public token;

    function setUp() public {
        token = new ERC20("test", "test", 18);
    }

    function destroy() public returns (uint256) {
        selfdestruct(payable(0));
        return 1;
    }

    function testExample1() public {
        token.transfer(address(1), 1 ether);
        assert(token.balanceOf(address(1)) == 1 ether);
    }

    function testExample2() public {
        token.transfer(address(1), 2 ether);
        assert(token.balanceOf(address(1)) == 2 ether);
        assert(token.balanceOf(address(this)) == 8 ether);
    }
}
