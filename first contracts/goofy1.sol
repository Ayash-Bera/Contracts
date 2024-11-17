// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; 
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
    ppl public person1= ppl({favnum : 69 , name : "Ghoul"});

    mapping (string => uint256 ) public nametofavnum;

    struct ppl{
        uint256 favnum;
        string name;
    }
    
    //uint256 [] public favnumlist; this will become a list then 
    ppl[] public arr ;
    function sore(uint256 _num) public virtual { // virtual and override from silly.sol
        favnum = _num;
        favnum ++;
    }

    function ret () public view returns (uint256 , uint256) { //view and pure fucntions are read only 
        uint256 numm = 69;
        // favnum ++ wonrt work here cause this function is view only view keyword shoriye dile it works again 
        return (favnum,numm);
    }

    function addppl (string memory _name , uint256 _favnum) public { // need to use memroy for string cause it is an array 
        ppl memory person = ppl({ favnum : _favnum , name : _name}); // memory calldata and storage 
        // you need to call memeory for arrays structs and mappings so that it understands how it needs to be stored memory is like ram oi temp variable which can be changed , call data cannot be changed and bakita is same as memory but storage is like hdd it stores permanantly or kinda like globally 
        // arr.push(ppl(_favnum , _name)); // one way 
        nametofavnum [_name] = _favnum; // kinda like linking every transaction to that name //mapping each fav num to the names 
        arr.push(person);
    }
} 
// just read the solidity documentation 
