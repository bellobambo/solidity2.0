// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract MyContract {
    address public lastSender;

    // Recive Payment
    function receive() external payable {
        lastSender == msg.sender;

        // msg.sender  (senders address)
        // msg.value  (amount sent)
    }

    // Get Balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }


    // Send Payment
    function pay (address payable  addr) public  payable {
        (bool sent, bytes memory data) = addr.call{value : 1 ether}("");

        require(sent , "Error sending Eth");
    }



}
