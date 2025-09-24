// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import { RaffeFunctionValidatorsModifiers } from "./modifiers/RaffeFunctionValidatorsModifiers.sol";


contract Raffle is RaffeFunctionValidatorsModifiers {
    event OwnerSet(address indexed owner);
    address internal immutable owner;
    uint256 public immutable ticketPrice = 1e-15 ether; // 10k gwei
    uint256 public rewardAmount;

    mapping (uint => address[]) public ticketsAndOwners;
    uint256 public totalTickets;
    uint256 public totalOfNumbers;

    constructor() {
        owner = msg.sender;
        emit OwnerSet(owner);
    }

    function buyTicket(uint256 _luckyNumber) public payable validTicketPrice(ticketPrice, msg.value) returns(uint256 _totalTickets, uint256 _rewardAmount) {
        address[] memory owners = ticketsAndOwners[_luckyNumber];
        totalOfNumbers = owners.length == 0 ? totalOfNumbers + 1 : totalOfNumbers;
        totalTickets += 1;
        rewardAmount += msg.value;
        
        ticketsAndOwners[_luckyNumber].push(msg.sender);
        return (totalTickets, rewardAmount);
    }

}