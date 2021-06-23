const PancakeRouter = artifacts.require("PancakeRouter");

module.exports = function (deployer) {
  deployer.deploy(PancakeRouter, "0x97AeF774487F96cC96055D11360947cDe5F8eCB3", "0xae13d989dac2f0debff460ac112a837c89baa7cd");
};
