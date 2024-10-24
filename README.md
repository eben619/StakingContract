This smart contract facilitates a staking platform on the Ethereum blockchain. Users can deposit tokens (specifically,

 The token defined in the contract) to earn interest over a predefined lock-in period.

Features:

    Secure Staking: Deposit tokens into the contract for safekeeping and interest generation.
    Flexible Lock-in Periods: Choose between 30-day or 90-day lock-in durations for your stake.
    Interest Accrual: Earn interest on your staked tokens based on the chosen duration.
    Transparent Design: View your stake details (amount, start time, duration, interest rate) within the contract.

Requirements:

    Solidity compiler version ^0.8.0 (https://docs.soliditylang.org/en/v0.8.19/installing-solidity.html)
    A blockchain development environment (e.g., Remix, Truffle, Hardhat)
    A compatible ERC20 token (specified in the contract constructor)

Deployment:

    Clone or download this repository.
    Connect your development environment to a blockchain network (e.g., local test network or public network like Ethereum).
    Deploy the StakingContract contract, specifying the address of the ERC20 token you want to enable staking for in the constructor.
    Users can interact with the stake function to deposit tokens and the withdraw function to claim their staked tokens with earned interest after the lock-in period ends.

How it Works:

    Users call the stake function with the desired amount of tokens and the preferred lock-in duration (30 days or 90 days).
    The contract checks if the chosen duration is valid and if the user has an existing active stake.
    It then verifies that the user has sufficient token balance and transfers the specified amount from the user's wallet to the contract's address.
    Based on the chosen duration, an interest rate is assigned (50% for 30 days and 100% for 90 days).
    A Stake struct is created for the user, storing relevant information like amount, start time, duration, interest rate, and an active flag.
    When a user calls the withdraw function, the contract checks if the user has an active stake.
    It verifies if the current block timestamp has surpassed the lock-in period defined at the time of staking.
    If valid, the contract calculates the earned interest based on the initial stake amount and the interest rate.
    The total amount (initial stake + interest) is transferred back to the user's wallet.
    The user's stake data is removed from the contract storage.

License:

MIT License
# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts
```
