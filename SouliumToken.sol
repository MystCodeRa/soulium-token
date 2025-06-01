//SDPX-licennse-Identifier:MIT
pragma solidity ^0.8.30;

contract SouliumToken {
    string public name = "Soulium";
    string public symbol = "SLM";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint amount);
    event Burn(address indexed from, uint amount);

    constructor() {
        totalSupply = 1_100_100 * (10 ** uint(decimals));
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint _amount) public returns (bool success) {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        require(_to != address(0), "Invalid recipient address");

        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;

        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    function burn(uint _amount) public returns (bool success) {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance to burn");
        balanceOf[msg.sender] -= _amount;
        totalSupply -=  _amount;

        emit Burn(msg.sender, _amount);
        return true;
    }
}