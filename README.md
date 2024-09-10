# Crowdfunding Smart Contract
This Solidity-based smart contract allows users to create a crowdfunding campaign. The owner sets a funding goal and campaign duration, and contributors can send funds. If the goal is reached by the end of the campaign, the owner can withdraw the funds. If the goal is not reached, contributors can request a refund.

# Features
* Goal-based crowdfunding: A campaign has a funding goal that must be met for funds to be withdrawn.
* Contribution tracking: The contract tracks contributions made by each participant.
* Withdrawal by owner: Once the campaign ends and the funding goal is reached, only the owner can withdraw the total funds.
* Refund mechanism: If the campaign fails to reach its goal, contributors can request a refund of their contributions.
* Time-based campaign: The campaign ends after a specified duration, and no more contributions are allowed after that time.
* Fallback functions: The contract allows contributions via direct payments but prevents non-contribution-based direct deposits.
# Contract Details
## State Variables
* owner: Address of the campaign creator.
* goal: The funding target that needs to be met for the owner to withdraw funds.
* endTime: The timestamp when the campaign will end.
* totalFunds: Total amount of funds contributed so far.
* contributions: A mapping that tracks each contributor’s individual contributions.
* _goal: The target funding goal.
* _duration: The campaign duration in minutes.
* campaignActive(): Ensures certain functions can only be called while the campaign is still active.

## Functions
```contribute()```

Allows contributors to send ETH to the contract. The campaign must be active, and the contribution must be greater than 0.
```withdraw()```

Allows the contract owner to withdraw funds if the goal is reached and the campaign has ended. If the goal is not reached or the campaign is still active, the withdrawal is blocked.
```refund()```

Allows contributors to claim a refund if the campaign has ended but the goal has not been met. Each contributor can only withdraw their own contribution.
```timeLeft()```

Returns the time remaining in the campaign in seconds. If the campaign has ended, it returns 0.
```receive()```

A fallback function to handle direct contributions via ETH transfer. It directs funds to the _contribute() function.
```fallback()```

Prevents direct deposits that don’t call the receive() function, and reverts any transactions not specifically meant for contributions.

* Contributing to the Campaign
Users can contribute by sending ETH to the contract's contribute() function. They can also send ETH directly to the contract's address, which will trigger the receive() function.

* Withdrawing Funds
Once the campaign ends, if the total contributions meet or exceed the funding goal, the owner can call the withdraw() function to collect the funds. Only the owner is allowed to withdraw.

* Requesting a Refund
If the campaign ends and the funding goal is not met, contributors can request a refund of their contributions by calling the refund() function.

* Edge Cases
The contract ensures that the campaign is active during contributions.
If the goal is not met, no withdrawal is allowed.
If the campaign is ongoing, no refund or withdrawal actions can be taken.
* Security Considerations
The contract uses call to send funds, ensuring it can handle all receiving contracts, but it checks for success to handle reentrancy attacks safely.
The assert() statement ensures that the total funds don’t overflow, as this would indicate a critical issue.

# Contact
ujjwala622@gmail.com
# License
This contract is licensed under the MIT License.
