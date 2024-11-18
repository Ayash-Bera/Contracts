// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Fallback{
    uint256 public result ;

    receive() external payable {
        result +=69;
    }

    fallback() external payable {
        result = 420;
    }
}