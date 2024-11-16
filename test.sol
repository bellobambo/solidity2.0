// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;



contract Auction {


    event Start();
    event End( address highestBidder, uint highestBid );

    address payable public seller;

    bool public started;
    bool public ended;
    uint public endAt;


    uint public highestBid;
    address public highestBidder;
    mapping (address => uint) public bids;

    constructor(){
        seller = payable (msg.sender);
    }

    function start(uint startingBid) external  {
        require(!started , 'Already started!');
        require(msg.sender == seller, 'You did not start the auction');
        started = true;
        endAt = block.timestamp + 2 days;
        highestBid = startingBid;
        emit Start();
    }


    function bid() external  payable  {
        require(started , 'Not started!');
        require(block.timestamp < endAt, "Ended");
        require(msg.value > highestBid);

        if(highestBidder != address(0)){
            bids[highestBidder] += highestBid;
        }

        highestBid = msg.value;
        highestBidder = msg.sender;
    }

    function end() external {
        require(started, "You Need to Start First!");
        require(block.timestamp >= endAt , "Auction is still ongoing");
        require(!ended, "Auction already ended");

        ended = true;
        emit End(highestBidder, highestBid);
    }

}
