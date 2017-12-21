pragma solidity ^0.4.18;

contract CharityToken{

    mapping (address => uint256) public balanceOf;

    string name; //Name of the token
    string symbol; //Symbol of the token
    uint8 decimal; //Decimals after the colon
    uint256 rate; //Rate of eth => token
    uint256 totalSupply; //The total supply of the token
    uint256 initialSupply; //For testing Purposes only!

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Reward(address indexed to, uint256 value);

    function CharityToken(string token_name, string token_symbol, uint8 decimal_units, uint256 initial_supply) public {
        balanceOf[msg.sender] = initial_supply;
        totalSupply = initial_supply;
        initialSupply = initial_supply;
        name = token_name;
        symbol = token_symbol;
        decimal = decimal_units;
        rate = 1 finney;
    }

/*
    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        Transfer(msg.sender, _to, _value);
    }
*/

    function rewardToken(address _to, uint256 _value) internal {
        uint256 reward = _value / rate;
        require(balanceOf[_to] + reward > balanceOf[_to]);

        balanceOf[_to] += reward;
        totalSupply += reward;

        Reward(_to, reward);
    }
}
