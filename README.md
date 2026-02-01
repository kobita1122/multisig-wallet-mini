# MultiSig Wallet Mini

This repository contains a streamlined Multi-Signature wallet implementation. It is designed to be highly readable for those learning how M-of-N security works on-chain.

## How it Works
1. **Owners:** The contract is initialized with a list of owner addresses.
2. **Threshold:** A required number of confirmations (e.g., 2 out of 3) is set.
3. **Submit:** Any owner can submit a transaction.
4. **Confirm:** Other owners must call the confirm function.
5. **Execute:** Once the threshold is met, the transaction can be sent to the destination.

## Use Cases
* Managing shared project funds.
* Secure cold storage for personal assets.
* Governance for small decentralized teams.
