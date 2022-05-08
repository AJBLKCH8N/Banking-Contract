//SPDX-License-Identifier:UNLICENSED
pragma solidity 0.8.7;

import "./ownable.sol";

contract destroyable is ownable {
    event destroyContract(uint finalBalance, address owner); 
    function close() public onlyOwner returns(uint) {
        emit destroyContract(address(this).balance, owner);
        selfdestruct(payable(owner));
        return address(this).balance;
    }
}
