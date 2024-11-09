// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";



library PriceConverter{
    function getprice() internal view returns (uint256) { 
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43); 
        (,int answer,,,)=pricefeed.latestRoundData();
        return uint256(answer * 1e18);
    }

        function getconversionrate(uint256 ethAmount) internal view returns (uint256){
        uint256 ethPrice = getprice();
        uint256 ethinusd = (ethAmount*ethPrice) / 1e18;
        return (ethinusd);
    }
}