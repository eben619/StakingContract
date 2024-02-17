import { ethers } from "hardhat";


async function main() {
  const StakingContract = await ethers.getContractFactory("StakingContract");
  console.log("Deploying StakingContract...");
  const stakingContract = await StakingContract.deploy("0xaAa9637522506Ee1600d10AF37705dADA816bE2A");
  await StakingContract.deploy("");
  console.log("Deployed");
  
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
}