// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

abstract contract RaffeFunctionValidatorsModifiers {
    
    modifier onlyOwner(address _owner) {
        require(msg.sender == _owner, "Only owner can call this function");
        _;
    }

    modifier validTicketPrice(uint256 _ticketPrice, uint256 _amountSent) {
        require(_amountSent == _ticketPrice, "Incorrect funds to buy a ticket");
        _;
    }
}