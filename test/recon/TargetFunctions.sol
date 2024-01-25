
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";
import {vm} from "@chimera/Hevm.sol";

abstract contract TargetFunctions is BaseTargetFunctions, Properties, BeforeAfter {

    function yieldBox_batch(bytes[] calls, bool revertOnFail) public {
      yieldBox.batch(calls, revertOnFail);
    }

    function yieldBox_batchBurn(uint256 tokenId, address[] froms, uint256[] amounts) public {
      yieldBox.batchBurn(tokenId, froms, amounts);
    }

    function yieldBox_batchMint(uint256 tokenId, address[] tos, uint256[] amounts) public {
      yieldBox.batchMint(tokenId, tos, amounts);
    }

    function yieldBox_batchTransfer(address from, address to, uint256[] assetIds_, uint256[] shares_) public {
      yieldBox.batchTransfer(from, to, assetIds_, shares_);
    }

    function yieldBox_burn(uint256 tokenId, address from, uint256 amount) public {
      yieldBox.burn(tokenId, from, amount);
    }

    function yieldBox_claimOwnership(uint256 tokenId) public {
      yieldBox.claimOwnership(tokenId);
    }

    function yieldBox_createToken(string name, string symbol, uint8 decimals, string uri) public {
      yieldBox.createToken(name, symbol, decimals, uri);
    }

    function yieldBox_deposit(uint8 tokenType, address contractAddress, address strategy, uint256 tokenId, address from, address to, uint256 amount, uint256 share) public {
      yieldBox.deposit(tokenType, contractAddress, strategy, tokenId, from, to, amount, share);
    }

    function yieldBox_depositAsset(uint256 assetId, address from, address to, uint256 amount, uint256 share) public {
      yieldBox.depositAsset(assetId, from, to, amount, share);
    }

    function yieldBox_depositETH(address strategy, address to, uint256 amount) public {
      yieldBox.depositETH(strategy, to, amount);
    }

    function yieldBox_depositETHAsset(uint256 assetId, address to, uint256 amount) public {
      yieldBox.depositETHAsset(assetId, to, amount);
    }

    function yieldBox_depositNFTAsset(uint256 assetId, address from, address to) public {
      yieldBox.depositNFTAsset(assetId, from, to);
    }

    function yieldBox_mint(uint256 tokenId, address to, uint256 amount) public {
      yieldBox.mint(tokenId, to, amount);
    }

    function yieldBox_onERC1155BatchReceived(address , address , uint256[] , uint256[] , bytes ) public {
      yieldBox.onERC1155BatchReceived(, , , , );
    }

    function yieldBox_onERC1155Received(address , address , uint256 , uint256 , bytes ) public {
      yieldBox.onERC1155Received(, , , , );
    }

    function yieldBox_onERC721Received(address , address , uint256 , bytes ) public {
      yieldBox.onERC721Received(, , , );
    }

    function yieldBox_permitToken(address token, address from, address to, uint256 amount, uint256 deadline, uint8 v, bytes32 r, bytes32 s) public {
      yieldBox.permitToken(token, from, to, amount, deadline, v, r, s);
    }

    function yieldBox_registerAsset(uint8 tokenType, address contractAddress, address strategy, uint256 tokenId) public {
      yieldBox.registerAsset(tokenType, contractAddress, strategy, tokenId);
    }

    function yieldBox_safeBatchTransferFrom(address from, address to, uint256[] ids, uint256[] values, bytes data) public {
      yieldBox.safeBatchTransferFrom(from, to, ids, values, data);
    }

    function yieldBox_safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes data) public {
      yieldBox.safeTransferFrom(from, to, id, value, data);
    }

    function yieldBox_setApprovalForAll(address operator, bool approved) public {
      yieldBox.setApprovalForAll(operator, approved);
    }

    function yieldBox_supportsInterface(bytes4 interfaceID) public {
      yieldBox.supportsInterface(interfaceID);
    }

    function yieldBox_transfer(address from, address to, uint256 assetId, uint256 share) public {
      yieldBox.transfer(from, to, assetId, share);
    }

    function yieldBox_transferMultiple(address from, address[] tos, uint256 assetId, uint256[] shares) public {
      yieldBox.transferMultiple(from, tos, assetId, shares);
    }

    function yieldBox_transferOwnership(uint256 tokenId, address newOwner, bool direct, bool renounce) public {
      yieldBox.transferOwnership(tokenId, newOwner, direct, renounce);
    }

    function yieldBox_withdraw(uint256 assetId, address from, address to, uint256 amount, uint256 share) public {
      yieldBox.withdraw(assetId, from, to, amount, share);
    }
}
