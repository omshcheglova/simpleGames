const MyGame = artifacts.require("MyGame");

module.exports = function (deployer) {
  deployer.deploy(MyGame);
};
