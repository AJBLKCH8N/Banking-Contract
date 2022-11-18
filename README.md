# Banking-Contract
This repository contains a simple smart contract for a bank


Version 1

Problem:

Create a new contract called 'Destroyable, which will allow for any contract inheriting from it
to self-destruct (i.e. remove itself from the blockchain). This action should only be 
Available for the CONTRACT OWNER.
Create a 3 contract inheritance structure with OWNABLE, Destroyable and Bank Contract,
each with their own SEPARATE FILE

Acceptance Criteria:

Must be able to DEPLOY bank contract
Must be able to PERFORM some bank transactions
-Deposit
-Withdraw
-Transfer to another address
Must be able to DESTROY the bank contract
-when bank contract is destroyed, it should transfer any remaining ether held within the contract
to the contract OWNER

Version 2 Including an Interface between external contracts.

-External visibility allows for integration between two totally separate Smart Contracts. I.e. Integrate contract with UNISWAP and having access to Liquidity etc.

Assignment:

Create a new external file called 'Government Contract'. This contract will survey/ save reports of what bank contract is doing. i.e. regulations by the government mandate that all transactions must be reported to the government.
