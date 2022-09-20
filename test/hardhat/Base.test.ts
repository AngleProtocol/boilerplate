import { loadFixture } from '@nomicfoundation/hardhat-network-helpers';
import { expect } from 'chai';
import { ethers } from 'hardhat';

import { Base } from '../../typechain';

describe('Base tests', async function () {
  /** NEW FEATURE - `LoadMixture` */
  async function deployContract() {
    const [alice] = await ethers.getSigners();
    const base = await ethers.getContractFactory('Base');
    const BaseContract = (await base.deploy()) as Base;
    return { alice, BaseContract };
  }

  it('success -  check base contract', async () => {
    const { alice, BaseContract } = await loadFixture(deployContract);
    expect(await BaseContract.connect(alice).isBase()).to.equal(true);
  });
});
