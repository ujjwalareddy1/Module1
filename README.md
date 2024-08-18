# Crowdfunding Smart Contract
This repository contains a simple Crowdfunding smart contract written in Solidity. The contract allows contributors to fund a project until a specified goal is reached. If the goal is not met, contributors can request a refund. The contract does not impose any time duration or minimum/maximum contribution limits.

## Features
Contribution Tracking: Allows multiple users to contribute funds to the project.
Goal Validation: Checks if the funding goal has been reached.
Manual Crowdsale Closure: The crowdsale can be manually closed by calling a specific function.
Refund Mechanism: If the goal is not reached, contributors can withdraw their contributions.
## How It Works
1. Contract Deployment
The contract is deployed with two parameters:

beneficiary: The address that will receive the funds if the goal is met.
goal: The amount of ether required to consider the crowdfunding campaign successful.
2. Contributing to the Campaign
Anyone can contribute to the campaign by calling the contribute function and sending Ether to the contract. Contributions are tracked on a per-address basis.

3. Closing the Crowdsale
Once the campaign is ready to be closed, the closeCrowdsale function can be called to prevent further contributions. If the funding goal has been reached, the contract marks the goal as achieved.

4. Checking the Funding Goal
After the crowdsale is closed, the checkGoalReached function can be called to transfer the funds to the beneficiary if the goal was met. This function can only be called after the crowdsale is closed.

5. Requesting a Refund
If the funding goal was not reached and the crowdsale is closed, contributors can call the refund function to retrieve their contributions.

## Contract Functions
### constructor(address payable _beneficiary, uint _goal)
Initializes the contract with the beneficiary's address and the funding goal.
### function contribute() public payable
Allows a user to contribute to the campaign.
Reverts if the crowdsale is closed or if the contribution is zero.
### function closeCrowdsale() public
Closes the crowdsale, preventing further contributions.
Marks the funding goal as achieved if the goal has been reached.
### function checkGoalReached() public
Checks if the funding goal was reached after the crowdsale is closed.
Transfers the funds to the beneficiary if the goal was met.
Reverts if the crowdsale is not closed or if the goal was not met.
### function refund() public
Allows contributors to request a refund if the funding goal was not met and the crowdsale is closed.
Reverts if the crowdsale is not closed or if the goal was reached.
### Example Usage
1.Deploy the contract:

Crowdfunding crowdfunding = new Crowdfunding(beneficiaryAddress, fundingGoal);

2.Contribute to the campaign:

crowdfunding.contribute{value: 1 ether}();

3.Close the crowdsale:

crowdfunding.closeCrowdsale();

4.Check if the funding goal was reached:

crowdfunding.checkGoalReached();

5.Request a refund (if applicable):

crowdfunding.refund();

## License
This project is licensed under the MIT License. See the LICENSE file for details.

