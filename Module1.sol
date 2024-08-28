// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeNumberStorage {
    address public owner;
    uint public storedNumber;

    constructor() {
        owner = msg.sender;
    }

    function storeNumber(uint _number) public {
        require(_number > 0, "Number must be greater than 0."); // Using require
        storedNumber = _number;
    }

    function retrieveNumber() public view returns (uint) {
        return storedNumber;
    }

    function resetNumber() public {
        require(msg.sender == owner, "Only the owner can reset the number.");
        storedNumber = 0;
        assert(storedNumber == 0); 
    }

    function forceRevert() public pure {
        revert("This function always reverts.");
    }
}
