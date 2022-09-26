// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Base {
    bool public isBase = true;
    address public owner;

    /** Errors */
    error NotOwner();

    /** Events */
    event OwnerCall();

    constructor(address owner_) {
        owner = owner_;
    }

    function isOwner() external returns (bool) {
        if (msg.sender != owner) revert NotOwner();
        else {
            emit OwnerCall();
            return true;
        }
    }
}
