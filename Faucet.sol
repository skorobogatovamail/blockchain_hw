pragma solidity  ^0.5.0;

contract Faucet {
    
    address public owner;
    mapping (address => bool) didRecieve;
    
    constructor () public {
        owner = msg.sender;
    }
    
    function () payable external {
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function getCoin(uint256 amount) public {
        require( address(this).balance >=  amount, "sorry, the amount of tokens available is less than your request");
        if (msg.sender != owner) {
            require(amount <= 0.1 ether, "sorry, you can get no more than 0.1 ether");
            require(didRecieve[msg.sender] == false, "sorry, you can use this function only once");
        
            msg.sender.transfer(amount);
            didRecieve[msg.sender] = true;
        }
        else {
            msg.sender.transfer(amount);   
        }
    }
}
