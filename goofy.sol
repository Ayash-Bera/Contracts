// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; 
// the ^ is for this and further remove the ^ for a specific version 
// use >= 0.8.7 <0.9.0 is like setting parameters 
contract goof {
    bool num =true ; // pati boolean true or false shit 
    // def value is null or 0 below ka stuff
    uint256 public favnum ; // unit er por number ta is the number of bits the def being 256 
    // srings and int works the same u int is unsigned so no -ve 
    address myadd = 0x6880607d4890Dd9D1b9B90e66E2608D7de658EE0; //the public key 
    bytes32 t = "text"; // does what it says strings are basically bytes but just for text but normal byte converts it to byte objects whihc is like "0xiwyhebfhuw" type stuff
    // bytes 32 is the max size and 8 is the lowest for units and etc 

    function sore(uint256 _num) public {
        favnum = _num;
        favnum ++;
    }

    function ret () public view returns (uint256 , uint256) {
        uint256 numm = 877;
        // favnum ++ wonrt work here cause this function is view only view keyword shoriye dile it works again 
        return (favnum,numm);
    }
} 
// just read the solidity documentation 