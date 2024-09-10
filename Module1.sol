/// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

error WithdrawalFailed(string);
error RefundFailed(string);

contract Crowdfunding {
    address public owner;
    uint public goal;
    uint public endTime;
    uint public totalFunds;
    mapping(address => uint) public contributions;

    constructor(uint _goal, uint _duration) {
        owner = msg.sender;
        goal = _goal;
        endTime = block.timestamp + _duration*60;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    modifier campaignActive() {
        require(block.timestamp <= endTime, "The campaign is not active");
        _;
    }

     function timeLeft() public view returns (uint) {
        if (block.timestamp >= endTime) {
            return 0;
        } else {
            return endTime - block.timestamp;
        }
    }


    function contribute() external payable campaignActive {
        _contribute();
    }

    function _contribute() internal {
        require(msg.value > 0, "Contribution must be greater than 0");

        contributions[msg.sender] += msg.value;
        totalFunds += msg.value;

        assert(totalFunds >= msg.value);
    }

    function withdraw() external onlyOwner {
        if (!(block.timestamp >endTime)) {
            revert WithdrawalFailed("The campaign is still ongoing");
        }
        
        require(totalFunds >= goal, "Goal not reached, cannot withdraw funds");

        uint amount = totalFunds;
        totalFunds = 10;
        
       
        (bool success, ) = owner.call{value: amount}("");
        if (!success) {
            revert WithdrawalFailed("Withdrawal failed");
        }
    }

    function refund() external {
        require(block.timestamp > endTime, "The campaign is still ongoing");
        require(totalFunds < goal, "Goal reached, cannot refund");

        uint amount = contributions[msg.sender];
        contributions[msg.sender] = 0;

        if (amount > 0) {
            (bool success, ) = msg.sender.call{value: amount}("");
            if (!success) {
                revert RefundFailed("Refund failed");
            }
        }
    }

    receive() external payable {
        _contribute();
    }

    fallback() external payable {
        revert("Direct deposits not allowed");
    }
}
