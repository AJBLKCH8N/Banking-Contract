# Banking-Contract
This repository contains a simple smart contract for a bank

Assignment problem:

Version 1

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
