// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MultiSig {
    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public required;

    struct Transaction {
        address to;
        uint value;
        bool executed;
        uint numConfirmations;
    }

    mapping(uint => mapping(address => bool)) public isConfirmed;
    Transaction[] public transactions;

    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "Owners required");
        require(_required > 0 && _required <= _owners.length, "Invalid required count");

        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), "Invalid owner");
            isOwner[owner] = true;
            owners.push(owner);
        }
        required = _required;
    }

    function submitTransaction(address _to, uint _value) public {
        transactions.push(Transaction({
            to: _to,
            value: _value,
            executed: false,
            numConfirmations: 0
        }));
    }

    function confirmTransaction(uint _txIndex) public {
        require(isOwner[msg.sender], "Not an owner");
        require(!isConfirmed[_txIndex][msg.sender], "Tx already confirmed");

        Transaction storage transaction = transactions[_txIndex];
        transaction.numConfirmations += 1;
        isConfirmed[_txIndex][msg.sender] = true;
    }

    function executeTransaction(uint _txIndex) public {
        Transaction storage transaction = transactions[_txIndex];
        require(transaction.numConfirmations >= required, "Not enough confirmations");
        require(!transaction.executed, "Already executed");

        transaction.executed = true;
        (bool success, ) = transaction.to.call{value: transaction.value}("");
        require(success, "Transaction failed");
    }

    receive() external payable {}
}
