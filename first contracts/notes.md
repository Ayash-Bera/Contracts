# Notes 
## enum is basically new data types but only for a couple of stuff 

```
pragma solidity ^0.8.0;

contract Example {
    // Define an enum
    enum Status { Pending, Shipped, Delivered, Cancelled }

    // Use the enum as a variable
    Status public currentStatus;

    // Set the initial status
    constructor() {
        currentStatus = Status.Pending;
    }

    // Update the status
    function updateStatus(Status _status) public {
        currentStatus = _status;
    }

    // Retrieve status as a number
    function getStatus() public view returns (uint) {
        return uint(currentStatus);
    }
}
```

## Events are basically logs 
they are executed using the `emit` keyword 

they can be read by off chain stuff 
## if and require differ only in
Use ```require``` for validating preconditions where failure should revert the transaction.

Use ```if``` for general-purpose conditional logic where reverting is not necessary.

```revert``` function can also be used with if to imitate require 

## constant and immutable 
contast is hard coded 

immu is one input done 

##
x << y is equivalent to the mathematical expression x * 2**y.

x >> y is equivalent to the mathematical expression x / 2**y, rounded towards negative infinity.

## modulo 

The modulo operation a % n yields the remainder r after the division of the operand a by the operand n, where q = int(a / n) and r = a - (n * q). This means that modulo results in the same sign as its left operand (or zero) and a % n == -(-a % n) holds for negative a:

`int256(5)` % int256(2) == int256`(1)`

`int256(5)` % int256(-2) == int256`(1)`

`int256(-5)` % int256(2) == int256`(-1)`

`int256(-5)` % int256(-2) == int256`(-1)`

first wala sign it picks up 

## For the cases of x*\*3, the expression x\*x*x might be cheaper

##