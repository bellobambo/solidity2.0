// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;


contract MyContract{

    // Recive Payment
    function receive() external payable { }


    // Get Balance
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}