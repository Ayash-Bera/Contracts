// SPDX-License-Identifier: MIT
//4:24;01 TIMESTAMP
pragma solidity ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// msg.value and msg.sender are global keywords 
// value gives the amount of oney or eth being sent and sender gives the addy 

contract fundme{
    uint256 usd = 50 * 1e18; // need to e the same unit as eth 
    address [] public funders ;
    mapping (address => uint256) public AddressAndAmount; // connecting the address to the amount 



    function fund() public payable  { //payable is the thing that makes the button red 
        //setting a min amount that needs to be sent 
        require(getconversionrate(msg.value) >= usd , "womp womp you broke"); //greater than one eth 1e18 is 1*10**18 (power)
        // its like an if statement 
        funders.push(msg.sender);
        AddressAndAmount[msg.sender] = msg.value;
    }

    function getprice() public view returns (uint256) { // gives the price of eth in usd 
        // forgor to write returns and the value and the view keyword 
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43); // calls a contract in that addy to check for the price and then retuns it 
        (,int answer,,,)=pricefeed.latestRoundData();// only ask for the one you need 
        return uint256(answer *1e10) ;
    }
        // it happens off chain that why we use chain link which is decentralised off chain stuff 
        //answer is the ans of eth to usd 
        //we can only call what is needed and we can ignore the rest just remove them from the ()
        // return uint256(answer * 1e18) ; // typecasting from int to uint and converting from gwei to wei i think 

    function getconversionrate(uint256 ethAmount) public view  returns (uint256){
        // 1 eth = 1_18 zeros
        // conversion is 3000_18 zeros 
        // when we use calc we lose some stuff thats why on solidity we only work with whole numers and no fractional stuff 
        uint256 ethPrice = getprice();
        uint256 ethinusd = (ethAmount*ethPrice) / 1e18; // calculates it and divides it once cause else a lot of estra zeroes will e there 
        return (ethinusd);
    }



    function withdraw() public{

    }
}