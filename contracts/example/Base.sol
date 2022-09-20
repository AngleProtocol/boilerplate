// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Base {
    bool public isBase = true;
    address private _owner;

    /** Errors */
    error NotOwner();

    /** Events */
    event OwnerCall();

    constructor(address owner) {
        _owner = owner;
    }

    function isOwner() external returns (bool) {
        if (msg.sender != _owner) revert NotOwner();
        else {
            emit OwnerCall();
            return true;
        }
    }
}
