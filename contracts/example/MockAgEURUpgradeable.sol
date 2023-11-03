// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "oz-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "oz-upgradeable/access/OwnableUpgradeable.sol";
import "oz-upgradeable/proxy/utils/Initializable.sol";

contract MockAgEURUpgradeable is Initializable, ERC20Upgradeable, OwnableUpgradeable {
    constructor() initializer {}

    function initialize(string memory _name, string memory _symbol) external initializer {
        __ERC20_init_unchained(_name, _symbol);
        __Ownable_init_unchained(msg.sender);
    }

    // ================================= FUNCTIONS =================================

    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    function burn(address _from, uint256 _amount) external onlyOwner {
        _burn(_from, _amount);
    }
}
