
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Setup} from "./Setup.sol";

abstract contract BeforeAfter is Setup {

    struct Vars {
        uint256 yieldBox_amountOf;
        uint256 yieldBox_assetCount;
        uint256 yieldBox_balanceOf;
        uint256[] yieldBox_balanceOfBatch;
        uint8 yieldBox_decimals;
        uint256 yieldBox_ids;
        bool yieldBox_isApprovedForAll;
        string yieldBox_name;
        address yieldBox_owner;
        address yieldBox_pendingOwner;
        string yieldBox_symbol;
        uint256 yieldBox_toAmount;
        uint256 yieldBox_toShare;
        uint256 yieldBox_totalSupply;
        string yieldBox_uri;
        address yieldBox_uriBuilder;
        address yieldBox_wrappedNative;
    }

    Vars internal _before;
    Vars internal _after;

    function __before() internal {
        _before.yieldBox_amountOf = yieldBox.amountOf();
        _before.yieldBox_assetCount = yieldBox.assetCount();
        _before.yieldBox_balanceOf = yieldBox.balanceOf();
        _before.yieldBox_balanceOfBatch = yieldBox.balanceOfBatch();
        _before.yieldBox_decimals = yieldBox.decimals();
        _before.yieldBox_ids = yieldBox.ids();
        _before.yieldBox_isApprovedForAll = yieldBox.isApprovedForAll();
        _before.yieldBox_name = yieldBox.name();
        _before.yieldBox_owner = yieldBox.owner();
        _before.yieldBox_pendingOwner = yieldBox.pendingOwner();
        _before.yieldBox_symbol = yieldBox.symbol();
        _before.yieldBox_toAmount = yieldBox.toAmount();
        _before.yieldBox_toShare = yieldBox.toShare();
        _before.yieldBox_totalSupply = yieldBox.totalSupply();
        _before.yieldBox_uri = yieldBox.uri();
        _before.yieldBox_uriBuilder = yieldBox.uriBuilder();
        _before.yieldBox_wrappedNative = yieldBox.wrappedNative();
    }

    function __after() internal {
        _after.yieldBox_amountOf = yieldBox.amountOf();
        _after.yieldBox_assetCount = yieldBox.assetCount();
        _after.yieldBox_balanceOf = yieldBox.balanceOf();
        _after.yieldBox_balanceOfBatch = yieldBox.balanceOfBatch();
        _after.yieldBox_decimals = yieldBox.decimals();
        _after.yieldBox_ids = yieldBox.ids();
        _after.yieldBox_isApprovedForAll = yieldBox.isApprovedForAll();
        _after.yieldBox_name = yieldBox.name();
        _after.yieldBox_owner = yieldBox.owner();
        _after.yieldBox_pendingOwner = yieldBox.pendingOwner();
        _after.yieldBox_symbol = yieldBox.symbol();
        _after.yieldBox_toAmount = yieldBox.toAmount();
        _after.yieldBox_toShare = yieldBox.toShare();
        _after.yieldBox_totalSupply = yieldBox.totalSupply();
        _after.yieldBox_uri = yieldBox.uri();
        _after.yieldBox_uriBuilder = yieldBox.uriBuilder();
        _after.yieldBox_wrappedNative = yieldBox.wrappedNative();
    }
}
