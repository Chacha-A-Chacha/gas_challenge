require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");

/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  gasReporter: {
    enabled: true,
    outputFile: "gas-report.txt",
    noColors: true,
  },
  solidity: "0.8.18",
};


/** 
require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");

module.exports = {
  solidity: "0.8.0",
  gasReporter: {
    enabled: true,
    outputFile: "gas-report.txt",
    noColors: true,
  },
};
*/
