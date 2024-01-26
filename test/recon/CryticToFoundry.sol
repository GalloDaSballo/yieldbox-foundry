// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {TargetFunctions} from "./TargetFunctions.sol";
import {FoundryAsserts} from "@chimera/FoundryAsserts.sol";

contract CryticToFoundry is Test, TargetFunctions, FoundryAsserts {
    function setUp() public {
        setup();
    }

    function testDemo() public {

        // This demonstrates we can have a loss of tokens
        // We can have a token that is forever trapped

        // How do we weaponize

        depositWithdrawToYoinkValue(1, 1, 0, 0);
        // Question
        // Is there an amount such that we are able to create arbitrary dust?

    }

    // Ask Medusa
    // Can you get me to have 0 Shares
    // And 0 Total Supply
    // With more than X in the BalanceOf YB?
}
