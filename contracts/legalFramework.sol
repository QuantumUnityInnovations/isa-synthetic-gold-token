```solidity
pragma solidity >=0.7.0 <0.9.0;

contract LegalFramework {

    // Define the IFI ISB entity
    struct IFI_ISB {
        address entityAddress;
        string entityName;
    }

    // Define the TokenHolder entity
    struct TokenHolder {
        address holderAddress;
        uint256 tokenBalance;
    }

    // Define the Contract between IFI ISB and TokenHolder
    struct Contract {
        IFI_ISB ifi_isb;
        TokenHolder tokenHolder;
        uint256 contractTimestamp;
        string termsAndConditions;
    }

    // Array to store all contracts
    Contract[] public contracts;

    // Function to create a new contract
    function createContract(address _holderAddress, uint256 _tokenBalance, string memory _termsAndConditions) public {
        // Define the IFI ISB entity
        IFI_ISB memory ifi_isb = IFI_ISB({
            entityAddress: msg.sender,
            entityName: "IFI ISB"
        });

        // Define the TokenHolder entity
        TokenHolder memory tokenHolder = TokenHolder({
            holderAddress: _holderAddress,
            tokenBalance: _tokenBalance
        });

        // Define the Contract
        Contract memory newContract = Contract({
            ifi_isb: ifi_isb,
            tokenHolder: tokenHolder,
            contractTimestamp: block.timestamp,
            termsAndConditions: _termsAndConditions
        });

        // Store the contract
        contracts.push(newContract);
    }

    // Function to get the total number of contracts
    function getTotalContracts() public view returns (uint256) {
        return contracts.length;
    }
}
```
