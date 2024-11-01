// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract fundme{
    uint256 usd = 50;
    function fund() public payable  {
        //setting a min amount that needs to be sent 
        require(msg.value >= usd , "womp womp you broke"); //greater than one eth 1e18 is 1*10**18 (power)
        // its like an if statement 

    }

    function withdraw (){

    }
}