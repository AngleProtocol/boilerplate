// import { ethers, upgrades } from 'hardhat';

// async function main() {
//   const [deployer] = await ethers.getSigners();
//   console.log('Deploying contracts with the account:', deployer.address);
//   const BaseFactoryV1 = await ethers.getContractFactory('BaseV1');
//   const baseV1 = await upgrades.deployProxy(BaseFactoryV1, [deployer.address]);
//   console.log('Contract deployed at address', baseV1?.address);
//   await baseV1.deployed();
// }

// // We recommend this pattern to be able to use async/await everywhere
// // and properly handle errors.
// main().catch(error => {
//   console.error(error);
//   process.exitCode = 1;
// });
