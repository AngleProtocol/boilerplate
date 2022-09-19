// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract BaseV1 is Initializable {
    string public constant SYMBOL = "agEUR";
    uint256 public id;

    function initialize(uint256 _id) public initializer {
        id = _id;
    }
}
