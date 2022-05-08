pragma solidity 0.8.7;

contract Government {

    struct transaction {
        address from;
        address to;
        uint amount;
        uint txId;
    }
    //definition of the struct object

    transaction[] transactionLog;

    function addTransaction(address _from, address _to, uint _amount) external {
        //Transaction memory _transaction == Transaction(from, _to, _amount, transactionLog.length);
        transactionLog.push( transaction(_from, _to, _amount, transactionLog.length) ); 
        //creates Tranaction object in memory and pushes to the transaction[] array for storage.
    }
    function getTransaction(uint _index) public returns(address, address, uint) {
        return ( transactionLog[_index].from, transactionLog[_index].to, transactionLog[_index].amount );
        //gets values of from the transaction[] array
    }

}