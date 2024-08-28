# SafeNumberStorage Contract
The SafeNumberStorage contract is a simple smart contract written in Solidity that allows users to store, retrieve, and reset a number on the Ethereum blockchain. The contract includes basic error-handling mechanisms using require(), assert(), and revert() statements.

## Features
Store a Number: Any user can store a positive number in the contract.
Retrieve the Stored Number: Any user can retrieve the stored number.
Reset the Stored Number: Only the contract owner can reset the stored number to zero.
Force Revert: A function that demonstrates how to explicitly revert a transaction.

## FUNCTIONS
### constructor()
Description: The constructor function is executed once when the contract is deployed. It sets the owner of the contract to the address that deployed it.
Access Control: Only executed once at deployment.
### storeNumber(uint _number)
Description: Allows a user to store a positive number in the contract.
Parameters:
### _number: The number to be stored.
Validation:
Uses require() to ensure that the number is greater than 0.
Usage:
Example: storeNumber(5);
### retrieveNumber()
Description: Allows any user to retrieve the currently stored number.
Returns:
The number currently stored in the contract.
Usage:
Example: uint myNumber = retrieveNumber();
### resetNumber()
Description: Allows the contract owner to reset the stored number to zero.
Validation:
Uses require() to ensure that only the contract owner can call this function.
Uses assert() to ensure that the stored number has been successfully reset to zero.
Usage:
Example: resetNumber();
### forceRevert()
Description: A function that always reverts the transaction, showcasing how to explicitly trigger a revert.
Usage:
Example: forceRevert();

## Error Handling
### require(condition, errorMessage):
Ensures that a specific condition is met before proceeding with the function. If the condition is not met, the transaction is reverted, and the provided error message is returned.
Example: require(_number > 0, "Number must be greater than 0.");
### assert(condition):

Used for conditions that should never fail during normal execution. If the condition fails, it indicates a critical bug, and the transaction is reverted.
Example: assert(storedNumber == 0);
### revert(errorMessage):

Explicitly reverts the transaction, returning an error message.
Example: revert("This function always reverts.");

## License
This project is licensed under the MIT License. See the LICENSE file for details.
## Contact
Email - ujjwala622@gmail.com
Name - Ujjwala
