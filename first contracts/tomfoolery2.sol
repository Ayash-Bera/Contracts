// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./goofy1.sol";

contract tomfoolery{
    goof[] public addy; //addy is a goof type array which stores abi and addy
    function goofing() public {
        // new goof gets the addy and ABI
        //new goof allows to make new goofy contracts 
        goof goofi = new goof(); // goofi is an element of type goof and addy is the array that holds multiple goofi which are of type goof 
        addy.push(goofi); // gooofi is single elem and addy is an array of elem 
    }

    function goofsore(uint256 _index , uint256 _sorenum ) public {
        // addy and ABI are needed addy is eing stored y the addy array 
        goof storing = addy[_index];// we dont need to wrap the goof() becase we are storing the entire thing in that array and not just the adresses 
        storing.sore(_sorenum);// it comes with the ABI keys 
        //addy gives my the adress of the contract 
    }

    function numget(uint256 _index) public  view returns(uint256,uint256){
        goof storing = addy[_index];
        // numget gets me the number present in that contract 
        return storing.ret();
    }
}