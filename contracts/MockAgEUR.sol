// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "oz/token/ERC20/ERC20.sol";
import "oz/access/Ownable.sol";

contract MockAgEUR is ERC20, Ownable {
    constructor() ERC20("Mock Token", "MTK") Ownable(msg.sender) {}

    // ================================= FUNCTIONS =================================

    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    function burn(address _from, uint256 _amount) external onlyOwner {
        _burn(_from, _amount);
    }
}
