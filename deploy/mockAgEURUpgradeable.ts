import { ChainId, registry } from '@angleprotocol/sdk';
import { Contract } from 'ethers';
import { DeployFunction } from 'hardhat-deploy/types';
import yargs from 'yargs';

import { MockAgEURUpgradeable, MockAgEURUpgradeable__factory } from '../typechain';

const argv = yargs.env('').boolean('ci').parseSync();

const func: DeployFunction = async ({ deployments, network, ethers }) => {
  console.log(`Deploying the contract on ${network.name}`);
  const { deploy } = deployments;
  const { deployer } = await ethers.getNamedSigners();

  let proxyAdmin: string;

  // Need to fetch a proxyAdmin address
  if (!network.live) {
    proxyAdmin = registry(ChainId.MAINNET)?.ProxyAdmin!;
  } else {
    proxyAdmin = registry(network.config.chainId as ChainId)?.ProxyAdmin!;
  }

  console.log('Starting with the implementation');
  await deploy(`MockAgEURUpgradeable_Implementation`, {
    contract: 'MockAgEURUpgradeable',
    from: deployer.address,
    log: !argv.ci,
    args: [],
  });
  const implementationAddress = (await ethers.getContract(`MockAgEURUpgradeable_Implementation`)).address;

  console.log(`Successfully deployed the contract at ${implementationAddress}`);
  console.log('');
  console.log('Now deploying the Proxy');

  await deploy('MockAgEURUpgradeable', {
    contract: 'TransparentUpgradeableProxy',
    from: deployer.address,
    args: [implementationAddress, proxyAdmin, '0x'],
    log: !argv.ci,
  });

  console.log('Successfully deployed the proxy');
  const proxyAddress = (await ethers.getContract('MockAgEURUpgradeable')).address;
  console.log(`Now initializing the proxy at ${proxyAddress}`);

  const proxy = new Contract(proxyAddress, MockAgEURUpgradeable__factory.abi, deployer) as MockAgEURUpgradeable;
  console.log('Initializing...');
  await (await proxy.connect(deployer).initialize('Angle Euro', 'agEUR')).wait();
  console.log('Success');
};

func.tags = ['mockAgEURUpgradeable'];
export default func;
