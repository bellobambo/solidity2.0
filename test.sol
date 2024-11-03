// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;



contract MyContract {
    mapping(address => uint) private balances;


     //Fund Account
    function deposit() external  payable {
        balances[msg.sender] += msg.value;
    }


     //Withdraw from Account

    function withdraw(address payable addr, uint amount) public payable {
        require (balances[addr] >= amount, "Insufficient Fund");

        (bool sent , bytes memory data) = addr.call{value : amount}("");
        require(sent, "Could not withdraw");
        balances[msg.sender] -= amount;
    }

     //View Balance

    function getBalance()public view returns (uint){

        // revert("error message");
        // assert(true == true, "hello");

        return address(this).balance;
    }


}
