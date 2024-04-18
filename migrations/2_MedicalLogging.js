const MedicalLogging = artifacts.require('MedicalLogging');
 
module.exports = function (deployer) {
    deployer.deploy(MedicalLogging);
};
