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

    function donateEth() public payable returns (bool success){
        uint256 amount = msg.value;
        require(charityAddress.send(amount));

        Donated(msg.sender, (amount * 1 ether));
        return true;
    }
}
