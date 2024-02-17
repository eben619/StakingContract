// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function withdraw(uint256 amount) external returns (bool);
    function deposit(uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool); // Addition of approve function
}

contract StakingContract {
    struct Stake {
        uint256 amount;
        uint256 startTimestamp;
        uint256 duration;
        uint256 interestRate; // in percentage (e.g., 50 for 50% or 100 for 100%)
        bool active;
    }

    mapping(address => Stake) public stakes;
    IERC20 public token;

    event Staked(address indexed user, uint256 amount, uint256 duration);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        token = IERC20(_token);
    }

    function stake(uint256 amount, uint256 duration) external {
        require(duration == 30 days || duration == 90 days, "Invalid duration");
        require(!stakes[msg.sender].active, "Already staked");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");

        uint256 interestRate = duration == 30 days ? 50 : 100;

        stakes[msg.sender] = Stake({
            amount: amount,
            startTimestamp: block.timestamp,
            duration: duration,
            interestRate: interestRate,
            active: true
        });

        emit Staked(msg.sender, amount, duration);
    }

    function withdraw() external {
        require(stakes[msg.sender].active, "You do not have any stakes");

        uint256 amount = stakes[msg.sender].amount;

        require(block.timestamp >= stakes[msg.sender].startTimestamp + stakes[msg.sender].duration, "Your Stake Duration Hasn't Elapsed Yet");

        uint256 interest = (amount * stakes[msg.sender].interestRate) / 100;
        uint256 totalAmount = amount + interest;

        delete stakes[msg.sender];

        require(token.transfer(msg.sender, totalAmount), "Transfer failed");

        emit Withdrawn(msg.sender, totalAmount);
    }
}
