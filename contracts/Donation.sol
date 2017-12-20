pragma solidity ^0.4.18;

contract Donation{

    mapping (address => string) addressOf;

    address charityAddress;
    string charityName;
    uint gasNeeded;
    uint gasPrice;

    event Donated(address donator, uint256 amount);

    function Donation(address _charityAddress, string _charityName) public {
        charityAddress = _charityAddress;
        charityName = _charityName;
        gasNeeded = 25000;
        gasPrice = 21000000000; //gwei
    }

    function getCurrentCharity() public returns (string charity, string destination) {
        return (charityName, destination);
    }

    function donateEth() public payable returns (bool success){
        uint256 amount = (msg.value/(1 finney));
        require(amount >= gasPrice * gasNeeded);
        uint amountDonation = amount - (gasPrice * gasNeeded);
        require(charityAddress.send(amountDonation));

        Donated(msg.sender, amountDonation);
        return true;
    }
}
