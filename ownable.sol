//SPDX-License-Identifier:UNLICENSED
pragma solidity 0.8.7;

contract ownable {
    address public owner;
    modifier onlyOwner { 
        require(msg.sender == owner, "Only Contract Owner can perform this action");
        _;
    }
    constructor() {
        owner = msg.sender;
    }
}
