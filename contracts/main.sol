pragma solidity ^0.4.18;

import "./Donation.sol";
import "./CharityToken.sol";

contract Main is Donation, CharityToken{

    //This combines all contracts
    function Main(address charityAddress, string charityName, string tokenName, string tokenSymbol, uint8 decimalUnits, uint256 initialSupply) Donation(charityAddress, charityName) CharityToken(tokenName, tokenSymbol, decimalUnits, initialSupply) public {

    }

    function donate() public payable returns(bool success){
        require(msg.value >= rate);
        require(charityAddress.send(msg.value));
        rewardToken(msg.sender, msg.value);

        return true;
    }
}
