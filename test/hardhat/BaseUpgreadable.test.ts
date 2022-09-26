import { loadFixture } from '@nomicfoundation/hardhat-network-helpers';
import { expect } from 'chai';
import { ethers, upgrades } from 'hardhat';

import { BaseV1 } from '../../typechain';

describe('Handling upgreadable contracts', async () => {
  async function deployUpgreadable() {
    const [alice, bob] = await ethers.getSigners();
    const BaseV1Factory = await ethers.getContractFactory('BaseV1');
    const baseV1 = (await upgrades.deployProxy(BaseV1Factory, [0])) as BaseV1;
    return { alice, bob, baseV1 };
  }

  it('success - check symbol and constants', async () => {
    const { baseV1 } = await loadFixture(deployUpgreadable);
    expect(await baseV1.SYMBOL()).to.equal('agEUR');
    expect(await baseV1.id()).to.equal(0);
  });

  it('success - deploy V2 implementation', async () => {
    const { baseV1 } = await loadFixture(deployUpgreadable);
    const BaseV2Factory = await ethers.getContractFactory('BaseV2');
    const baseV2 = await upgrades.upgradeProxy(baseV1.address, BaseV2Factory);
    expect(baseV1.address).to.equal(baseV2.address);
    expect(await baseV2.SYMBOL()).to.equal('ANGLE');
    expect(await baseV2.id()).to.equal(0);
  });
});
