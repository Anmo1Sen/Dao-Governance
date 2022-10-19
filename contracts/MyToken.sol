// Contract based on: https://docs.openzeppelin.com/contracts/4.x/governance
// SPDX-License-Identifier: MIT


//This ERC-20 token will determine the voting power of each account in our governance setup.
//ERC20Votes.sol:- keeps track of historical balances so that voting power is retrieved from past snapshots instead of the current balance. This protection helps prevent double voting.
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract MyToken is ERC20, ERC20Permit, ERC20Votes {
    constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken") {}

    // The functions below are overrides required by Solidity.
    //These functions are used to store the data in each block.

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
        //whit this function our snapshot of users erc20votes are updated after voting.
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
        //Snapshots the totalSupply after it has been increased.
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
    //Snapshots the totalSupply after it has been decreased.
}