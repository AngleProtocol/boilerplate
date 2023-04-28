import { DeployFunction } from 'hardhat-deploy/types';
import yargs from 'yargs';

const argv = yargs.env('').boolean('ci').parseSync();

const func: DeployFunction = async ({ deployments, network, ethers }) => {
  console.log(`Deploying the contract on ${network.name}`);
  const { deploy } = deployments;
  const { deployer } = await ethers.getNamedSigners();

  await deploy(`MockAgEUR`, {
    contract: 'MockAgEUR',
    from: deployer.address,
    log: !argv.ci,
    args: [],
  });
  const implementationAddress = (await ethers.getContract(`MockAgEUR`)).address;

  console.log(`Successfully deployed the contract at ${implementationAddress}`);
  console.log('');
};

func.tags = ['mockAgEUR'];
export default func;
