// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./goofy.sol";

contract silly is goof{ // inherits goofy
    //to override something it needs to have the override func mentioned and the actual original fnction needs to have the virtual keyword written 
    function sore(uint256 _favnum) public override{
        favnum = _favnum+10;
    }
}