import { loadFixture } from '@nomicfoundation/hardhat-network-helpers';
import { expect } from 'chai';
import { BigNumber } from 'ethers';
import { ethers } from 'hardhat';

import { MockAgEUR as ERC20 } from '../../typechain';

describe('Mock ERC20 tests', async function () {
  async function deployContract() {
    const [alice, bob] = await ethers.getSigners();
    const MockAgEURFactory = await ethers.getContractFactory('MockAgEUR', { signer: alice });
    const token = (await MockAgEURFactory.deploy()) as ERC20;
    return { alice, bob, token };
  }
  it('success - check contract deployment', async () => {
    const { alice, token } = await loadFixture(deployContract);
    expect(await token.symbol()).to.equal('MTK');
    expect(await token.name()).to.equal('Mock Token');
    expect(await token.owner()).to.equal(alice.address);
  });
  it('success - mint', async () => {
    const { alice, bob, token } = await loadFixture(deployContract);
    await expect(token.connect(alice).mint(bob.address, BigNumber.from(1))).to.emit(token, 'Transfer');
    expect(await token.balanceOf(bob.address)).to.equal(1);
    expect(await token.balanceOf(alice.address)).to.equal(0);
  });
});
