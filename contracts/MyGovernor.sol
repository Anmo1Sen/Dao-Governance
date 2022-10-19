// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";


//We want to wait for a new vote to be "executed".
//Everyone who holds the governence token has to pay 5 tokens.
//Give time to users to "get out" if they do not like a governance update.

contract MyGovernor is Governor, GovernorCountingSimple, GovernorVotes, GovernorVotesQuorumFraction {
    constructor(IVotes _token)
        Governor("MyGovernor")
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(4)
    {}

    function votingDelay() public pure override returns (uint256) {
        return 1; // 1 block
       
    }
 //waiting after a proposal is issued 1block = 13.2sec,  1 sec = (1block/13.2)  
 // 1 week = 1x60x60x24x7 sec = (1/13.2)x60x60x24x7 blocks = 45,818 blocks mined.
    function votingPeriod() public pure override returns (uint256) {
        return 45818; // 1 week
    }
  
    function proposalThreshold() public pure override returns (uint256) {
        return 0;

        //min no of votes an acc must have to create a proposal.so that any one can give suggestion and not the holders only.
    }

//This restricts proposal creation to accounts that have enough voting power.
    function quorum(uint256 blockNumber)
        public
        view
        override(IGovernor, GovernorVotesQuorumFraction)
        returns (uint256)
    {
        return super.quorum(blockNumber);
    }
}