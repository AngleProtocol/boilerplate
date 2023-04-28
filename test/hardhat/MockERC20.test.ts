import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/signers';
import { expect } from 'chai';
import { BigNumber } from 'ethers';
import { ethers } from 'hardhat';

import { MockAgEUR, MockAgEUR__factory, MockAgEURUpgradeable, MockAgEURUpgradeable__factory } from '../../typechain';
import { deployUpgradeable } from './utils/helpers';

describe('Mock agEUR tests', async function () {
  let alice: SignerWithAddress;
  let bob: SignerWithAddress;
  let deployer: SignerWithAddress;

  let token: MockAgEUR;
  let tokenUpgradeable: MockAgEURUpgradeable;

  before(async () => {
    [alice, bob, deployer] = await ethers.getSigners();
  });

  beforeEach(async () => {
    token = (await new MockAgEUR__factory(deployer).deploy()) as MockAgEUR;
    tokenUpgradeable = (await deployUpgradeable(new MockAgEURUpgradeable__factory(deployer))) as MockAgEURUpgradeable;
    await tokenUpgradeable.connect(alice).initialize('Angle Euro', 'agEUR');
  });

  describe('Basic testing', async function () {
    it('success - check contract deployment', async () => {
      expect(await token.symbol()).to.equal('MTK');
      expect(await token.name()).to.equal('Mock Token');
      expect(await token.owner()).to.equal(deployer.address);
      expect(await tokenUpgradeable.symbol()).to.equal('agEUR');
      expect(await tokenUpgradeable.name()).to.equal('Angle Euro');
      expect(await tokenUpgradeable.owner()).to.equal(alice.address);
    });
    it('success - mint', async () => {
      await expect(token.connect(deployer).mint(bob.address, BigNumber.from(1))).to.emit(token, 'Transfer');
      expect(await token.balanceOf(bob.address)).to.equal(1);
      expect(await token.balanceOf(alice.address)).to.equal(0);
      expect(await token.balanceOf(deployer.address)).to.equal(0);
      await tokenUpgradeable.connect(alice).mint(bob.address, BigNumber.from(1));
      expect(await tokenUpgradeable.balanceOf(bob.address)).to.equal(1);
      expect(await tokenUpgradeable.balanceOf(alice.address)).to.equal(0);
    });
  });
});
