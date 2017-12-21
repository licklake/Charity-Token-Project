pragma solidity ^0.4.18;

contract Donation{

    mapping (address => string) addressOf;

    address public charityAddress;
    string public charityName;

    event Donated(address donator, uint256 amount);

    function Donation(address _charityAddress, string _charityName) public {
        charityAddress = _charityAddress;
        charityName = _charityName;
    }
}
