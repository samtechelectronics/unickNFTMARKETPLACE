const Migrations = artifacts.require("unickNft");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
