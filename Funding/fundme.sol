// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract fundme{
    uint256 usd = 50 * 1e18; // need to e the same unit as eth 
    function fund() public payable  {
        //setting a min amount that needs to be sent 
        require(getconversionrate(msg.value) >= usd , "womp womp you broke"); //greater than one eth 1e18 is 1*10**18 (power)
        // its like an if statement 
    }

    function getprice() public returns (uint256) { // gives the price of eth in usd 
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43); // calls a contract in that addy to check for the price and then retuns it 
        (,int answer,,,)=pricefeed.latestRoundData();
        return uint256(answer *1e10) ;
    }
        // it happens off chain that why we use chain link which is decentralised off chain stuff 
        // ( int256 roundID,int answer,uint startedAt,uint timeStamp,int256 answeredInRound)=pricefeed.latestRoundData();
        // (,int answer,,,)=pricefeed.latestRoundData();
        // ( int256 answer )= pricefeed.latestRoundData();
         // Removed other parameters as they're not needed
        // (uint80 roundId, int256 answer) = pricefeed.latestRoundData();
        // return ( int256 roundID ,int answer,uint startedAt,uint timeStamp,int256 answeredInRound);
        //answer is the ans of eth to usd 
        //we can only call what is needed and we can ignore the rest just remove them from the ()
        // return uint256(answer * 1e18) ; // typecasting from int to uint and converting from gwei to wei i think 

    function getconversionrate(uint256 ethAmount) public  returns (uint256){
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