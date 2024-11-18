// SPDX-License-Identifier: MIT
//4:24;01 TIMESTAMP
pragma solidity ^0.8.8;

import {PriceConverter} from "./PriceConverter.sol";

// msg.value and msg.sender are global keywords 
// value gives the amount of oney or eth being sent and sender gives the addy 

error notowner(); // custom error saves gas 
error brokie();


contract fundme{

    address immutable owner; // m,akes it so it cant be chqanged later but can be accessed through a function 
    using PriceConverter for uint256 ; // for the library  // now every uint256 knows and have access to that library about price converter 
    uint256 public constant usd = 5e18; // need to e the same unit as eth 
    // constant and immutable keywords saves gas 
    address [] public funders ;// addy array
    mapping (address => uint256 ) public AddressAndAmount; // connecting the address to the amount 

    constructor (){
        owner = (msg.sender);
    }

    function fund() public payable  { //payable is the thing that makes the button red 
        //setting a min amount that needs to be sent 
        // require (msg.value.getconversionrate() >= usd , "womp womp you broke");
         // msg.value acts as a uint 256 if you put somn else in the brackets then extra stuff gets added but msg .value is the og uint 
        if (msg.value.getconversionrate()< usd ){
            revert brokie();
        }
        //greater than one eth 1e18 is 1*10**18 (power)
        // its like an if statement 
        funders.push(msg.sender);
        AddressAndAmount[msg.sender] += msg.value;
    }

    // function getprice() public view returns (uint256) { // gives the price of eth in usd 
    //     // forgor to write returns and the value and the view keyword 
    //     AggregatorV3Interface pricefeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43); // calls a contract in that addy to check for the price and then retuns it 
    //     (,int answer,,,)=pricefeed.latestRoundData();// only ask for the one you need 
    //     return uint256(answer *1e10) ;
    // }
    //     // it happens off chain that why we use chain link which is decentralised off chain stuff 
    //     //answer is the ans of eth to usd 
    //     //we can only call what is needed and we can ignore the rest just remove them from the ()
    //     // return uint256(answer * 1e18) ; // typecasting from int to uint and converting from gwei to wei i think 

    // function getconversionrate(uint256 ethAmount) public view  returns (uint256){
    //     // 1 eth = 1_18 zeros
    //     // conversion is 3000_18 zeros 
    //     // when we use calc we lose some stuff thats why on solidity we only work with whole numers and no fractional stuff 
    //     uint256 ethPrice = getprice();
    //     uint256 ethinusd = (ethAmount*ethPrice) / 1e18; // calculates it and divides it once cause else a lot of estra zeroes will e there 
    //     return (ethinusd);
    // }

// unchecked keywiord doesnt wrap around a number like max ceil jodi 255 hoye then 255++ gave 0 which caused errors 

    function withdraw() public OnlyFans{
        for (uint256 i =0 ; i<=funders.length;i++ ){
            address funder = funders[i];// storing current addy 
            AddressAndAmount[funder] = 0;
        }
        funders = new address[](0); // refreshes the array to be a new array with no objects in it 
        /* the objects insisd ethe (0) means how many objects will be there in the array  */
        // starts at index 0 ota 6 likhle 


        // SENDING ETH  withdrawing 
        //msg.sender = addy type 
        // payable wrapped 
        // transfer throws an error if gas is more than 2300 and reverts the trans 
        /////////////////////////// payable(msg.sender).transfer(address(this).balance); // this keyword returns the addy of this contract 
        /////////////////////////// // wrapped it in payable from an addy type  
        /////////////////////////// //send 
        /////////////////////////// bool success = payable(msg.sender).send(address(this).balance);
        /////////////////////////// require (success , "failed"); // if we use this statement only then it will revert the payment 
        /////////////////////////// //call
        (bool ssucc/*it holds the true or false  */ , /*bytes memory datareturned /* /*bytes required memoery cause its an array */ )=payable(msg.sender).call{value: address(this).balance}("");
        require(ssucc,"call failed");

    }
    modifier OnlyFans(){ 
        if (msg.sender != owner){ // this is gas eff 
            revert notowner();
        }
        _;// this is where the rest of the function code happens 
    }

    // require(msg.sender == owner , "not owner"); ths is not gass eff 
    //require(msg.sender == owner , notowner()); both of these work 
    // if _; was on the first line then code exe before the requir statement 
    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
    
    //     /*
    // Which function is called, fallback() or receive()?
    //        send Ether
    //            |
    //      msg.data is empty?
    //           /      \
    //         yes       no
    //         /          \
//  receive() exists?      fallback()
    //      /   \
    //     yes   no
    //     /      \
    // receive()   fallback()
    // */
}