```solidity
pragma solidity >=0.7.0 <0.9.0;

// Import the ERC20 interface
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Import the TokenContract contract
import "./TokenContract.sol";

contract ComplianceAndAuditing is ERC20 {
    // Define the TokenContract contract
    TokenContract public tokenContract;

    // Define the audit records
    struct AuditRecord {
        uint256 timestamp;
        address auditor;
        string details;
    }

    AuditRecord[] public auditRecords;

    constructor(address _tokenContract) ERC20("SyntheticGoldToken", "SGT") {
        // Set the TokenContract contract
        tokenContract = TokenContract(_tokenContract);
    }

    // Function to add an audit record
    function addAuditRecord(string memory _details) public {
        // Create the audit record
        AuditRecord memory newRecord = AuditRecord({
            timestamp: block.timestamp,
            auditor: msg.sender,
            details: _details
        });

        // Add the audit record to the array
        auditRecords.push(newRecord);

        // Emit the Audit event
        emit Audit(msg.sender, _details);
    }

    // Function to get the total number of audit records
    function getAuditRecordCount() public view returns (uint256) {
        return auditRecords.length;
    }

    // Function to get an audit record by index
    function getAuditRecord(uint256 _index) public view returns (uint256, address, string memory) {
        AuditRecord memory record = auditRecords[_index];
        return (record.timestamp, record.auditor, record.details);
    }

    // Event to be emitted when an audit record is added
    event Audit(address indexed auditor, string details);
}
```
