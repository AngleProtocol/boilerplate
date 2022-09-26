import { ethers } from 'hardhat';

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log('Deploying contracts with the account:', deployer.address);
  const BaseFactory = await ethers.getContractFactory('Base');
  const base = await BaseFactory.deploy(deployer.address);
  console.log('Contract deployed at address', base?.address);
  await base.deployed();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
