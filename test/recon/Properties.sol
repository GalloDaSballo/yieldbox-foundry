// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Asserts} from "@chimera/Asserts.sol";
import {Setup} from "./Setup.sol";


abstract contract Properties is Setup, Asserts {

  // Check that PPFS can never decrease
  // uint256 RECON_THRESHOLD = 10;

  // // TODO: Antonio?
  // function checkTokenBalanceOf() public {
  //   (uint256 totalShare, uint256 totalAmount) = yieldBox.assetTotals(assetId);
    
  //   // Can medusa find the self rekt
  //   // Donation, instantly
  //   // Can it find the self rekt via deposit / withdraw?
  //   if(totalShare == 0 && totalAmount >= RECON_THRESHOLD) {
  //     assert(false); // Broken
  //   }
  // }

  // Is there a way to Pay Less
  // And get more out?

  // NOTE: We prob need to do this via another contract
  function depositWithdrawToYoinkValue(uint256 depositAmt, uint256 depositShares, uint256 withdrawAmt, uint256 withdrawShares) public {
    yoinker.yoink(depositAmt, depositShares, withdrawAmt, withdrawShares);
  }
}
