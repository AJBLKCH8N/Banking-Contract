//SPDX-License-Identifier:UNLICENSED
pragma solidity 0.8.7;

import "./destroyable.sol";

contract bank is destroyable {
    mapping(address => uint)balance;
    event depositDone(uint amount, address depositedTo); 
    event balanceTransfered(uint amount, address depositedFrom, address depositedTo);
    function deposit() public payable returns (uint) { 
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender); 
        return balance[msg.sender];
    }
    function withdraw(uint amount) public returns (uint) {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        balance[msg.sender] -=amount;
        payable(msg.sender).transfer(amount);
        return balance[msg.sender];
    }
    function getBalance() public view returns (uint) {
        return balance[msg.sender];
    }
    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Dont transfer money to yourself");
        uint previousSenderBalance = balance[msg.sender];
        _transfer(msg.sender, recipient, amount);
        assert(balance[msg.sender] == previousSenderBalance - amount);
        emit balanceTransfered(amount, msg.sender, recipient);
    }
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
}
