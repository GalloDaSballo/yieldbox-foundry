// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";
import {vm} from "@chimera/Hevm.sol";

import "src/enums/YieldBoxTokenType.sol";
import "src/interfaces/IStrategy.sol";

abstract contract TargetFunctions is BaseTargetFunctions, Properties, BeforeAfter {
    function donateTokenToStrat(uint256 amt) public {
        mockToken.transfer(address(emptystrat), amt);
    }

    function donateTokenToYB(uint256 amt) public {
        mockToken.transfer(address(yieldBox), amt);
    }

    function donateYBToStrat(uint256 amt) public {
        yieldBox.transfer(address(this), address(emptystrat), assetId, amt);
    }

    function donateYBToYB(uint256 amt) public {
        yieldBox.transfer(address(this), address(yieldBox), assetId, amt);
    }

    // // ** DEPOSIT ** //
    // // Specific deposit amt
    function yieldBox_depositAssetAmount(uint256 amount) public {
        yieldBox.depositAsset(assetId, address(this), address(this), amount, 0);
    }

    // // Specific deposit shares
    function yieldBox_depositAssetShares(uint256 share) public {
        yieldBox.depositAsset(assetId, address(this), address(this), 0, share);
    }

    // Specific Generic Deposit just to give us a chance
    function yieldBox_depositAssetGeneric(address to, uint256 amount, uint256 share) public {
        yieldBox.depositAsset(assetId, address(this), to, amount, share);
    }

    // ** DEPOSIT ** //

    function yieldBox_withdrawAmount(uint256 amount) public {
        yieldBox.withdraw(assetId, address(this), address(this), amount, 0);
    }

    function yieldBox_withdrawShare(uint256 share) public {
        share = between(share, 1, yieldBox.balanceOf(address(this), assetId));
        yieldBox.withdraw(assetId, address(this), address(this), 0, share);
    }

    // // Just to give us a chance
    function yieldBox_withdrawGeneric(address to, uint256 amount, uint256 share) public {
        yieldBox.withdraw(assetId, address(this), to, amount, share);
    }
}
