import { loadFixture } from '@nomicfoundation/hardhat-network-helpers';
import { expect } from 'chai';
import { ethers } from 'hardhat';

import { Base } from '../../typechain';

describe('Base tests', async function () {
  async function deployContract() {
    const [alice, bob] = await ethers.getSigners();
    const base = await ethers.getContractFactory('Base');
    const BaseContract = (await base.deploy(alice.address)) as Base;
    return { alice, bob, BaseContract };
  }
  it('success - check `isBase()` attribute', async () => {
    const { alice, BaseContract } = await loadFixture(deployContract); /** NEW FEATURE - `LoadMixture` */
    expect(await BaseContract.connect(alice).isBase()).to.equal(true);
  });
  it('reverts - is owner?', async () => {
    const { bob, BaseContract } = await loadFixture(deployContract);
    await expect(BaseContract.connect(bob).isOwner()).to.be.reverted;
    await expect(BaseContract.connect(bob).isOwner()).to.be.revertedWithCustomError(BaseContract, 'NotOwner');
  });
  it('success - is owner?', async () => {
    const { BaseContract } = await loadFixture(deployContract);
    await expect(BaseContract.isOwner()).to.emit(BaseContract, 'OwnerCall');
  });
});
