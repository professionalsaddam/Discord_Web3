const { expect } = require("chai")
const { ethers } = require("hardhat")

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe("Dappcord", function () {

    const NAME = "Dappcord"
    const SYMBOL = "DC"

  describe('Deployment', () => { 

    let deployer,user;

      beforeEach(async () => {

        [deployer,user] = await ethers.getSigners();
       
        // Deploy contract
        const Dappcord = await ethers.getContractFactory("Dappcord")
        dappcord = await Dappcord.deploy(NAME, SYMBOL)
    
     
      })

      it("Sets the name", async () => {
        const result = await dappcord.name()
        expect(result).to.equal(NAME)
      })

      it("Sets the symbol", async () => {
        const result = await dappcord.symbol()
        expect(result).to.equal(SYMBOL)
      })

      it("Sets the Owner", async () => {
        const result = await dappcord.owner()
        expect(result).to.equal(deployer.address)
      })

   })

})
