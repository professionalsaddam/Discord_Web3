const { expect } = require("chai")

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe("Dappcord", function () {

    const NAME = "Dappcord"
    const SYMBOL = "DC"

  describe('Deployment', () => { 

      beforeEach(async () => {
       
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

   })

})
