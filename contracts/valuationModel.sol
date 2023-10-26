```solidity
pragma solidity >=0.7.0 <0.9.0;

// Import the ERC20 interface
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ValuationModel is ERC20 {
    // Define the price of gold in USD
    uint256 public goldPrice;

    // Define the conversion factor
    uint256 public conversionFactor = 9475;

    // Define the total supply of tokens
    uint256 public totalSupply;

    // Event to log gold price updates
    event GoldPriceUpdated(uint256 newGoldPrice);

    constructor(uint256 _goldPrice) ERC20("SyntheticGoldToken", "SGT") {
        goldPrice = _goldPrice;
        totalSupply = 0;
    }

    // Function to update the price of gold
    function updateGoldPrice(uint256 _newGoldPrice) public {
        goldPrice = _newGoldPrice;
        emit GoldPriceUpdated(_newGoldPrice);
    }

    // Function to mint new tokens
    function mint(address _to, uint256 _amount) public {
        // Calculate the token value
        uint256 tokenValue = calculateTokenValue(_amount);

        // Update the total supply
        totalSupply += tokenValue;

        // Mint the new tokens
        _mint(_to, tokenValue);
    }

    // Function to calculate the token value
    function calculateTokenValue(uint256 _amount) public view returns (uint256) {
        return (_amount * goldPrice * conversionFactor) / 10000;
    }

    // Function to get the total supply of tokens
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }
}
```

