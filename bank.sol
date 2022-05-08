//SPDX-License-Identifier:UNLICENSED
pragma solidity 0.8.7;

import "./destroyable.sol";

//to interact with external contract , you need to know: 
// a) function & arguments - i.e. I/Os
// b) where the contract is located (i.e. contracts address) via an interface

interface GovernmentInterface{
    function addTransaction(address _from, address _to, uint _amount) external;
    //include function from external contract with 'external'
}

contract bank is destroyable {

    GovernmentInterface GovernmentInstance = GovernmentInterface (0xDA0bab807633f07f013f94DD0E6A4F96F8742B53);
    //here you declare the Interface and instance  with the adress refernece
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

        GovernmentInstance.addTransaction(msg.sender, recipient, amount);
        //here you parse inputs to the external contract function

        assert(balance[msg.sender] == previousSenderBalance - amount);
        emit balanceTransfered(amount, msg.sender, recipient);
    }
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
}