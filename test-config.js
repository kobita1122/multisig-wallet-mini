// Example addresses for deployment testing
const OWNER_1 = "0x70997970C51812dc3A010C7d01b50e0d17dc79C8";
const OWNER_2 = "0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC";
const OWNER_3 = "0x90F79bf6EB2c4f870365E785982E1f101E93b906";

const deploymentArgs = [
    [OWNER_1, OWNER_2, OWNER_3],
    2 // Requires 2 out of 3 signatures
];

module.exports = { deploymentArgs };
