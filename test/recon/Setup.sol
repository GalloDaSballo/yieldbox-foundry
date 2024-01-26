// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseSetup} from "@chimera/BaseSetup.sol";


import "src/mocks/YieldBoxRebaseMock.sol";
import "src/ERC721TokenReceiver.sol";
import "src/mocks/MasterContractFullCycleMock.sol";
import "src/mocks/ERC20Mock.sol";
import "src/strategies/ERC20WithoutStrategy.sol";
import "src/mocks/RevertingERC20Mock.sol";
import "src/mocks/WETH9Mock.sol";
import "src/mocks/ERC1155StrategyMock.sol";
import "src/strategies/SushiStakingSimpleStrategy.sol";
import "src/mocks/MaliciousMasterContractMock.sol";
import "src/YieldBox.sol";
import "src/ERC1155TokenReceiver.sol";
import "src/mocks/ERC20StrategyMock.sol";
import "src/NativeTokenFactory.sol";
import "src/AssetRegister.sol";
import "src/mocks/ReturnFalseERC20Mock.sol";
import "src/interfaces/IStrategy.sol";
import "src/interfaces/IWrappedNative.sol";
import "src/mocks/ExternalFunctionMock.sol";
import "src/ERC1155.sol";
import "src/YieldBoxURIBuilder.sol";
import "src/mocks/ERC1155Mock.sol";
import "src/strategies/BaseBufferStrategy.sol";
import "src/interfaces/IYieldBox.sol";
import "src/mocks/MasterContractMock.sol";
import "src/mocks/ERC1155ReceiverMock.sol";
import "src/strategies/BaseStrategy.sol";
import "src/mocks/SushiBarMock.sol";
import "src/enums/YieldBoxTokenType.sol";

contract Yoinker {
    YieldBox yieldBox;
    ERC20Mock mockToken;
    uint256 assetId;

    function between(uint256 value, uint256 low, uint256 high) internal returns (uint256) {
        if (value < low || value > high) {
            uint256 ans = low + (value % (high - low + 1));
            return ans;
        }
        return value;
    }

  constructor(YieldBox _yieldBox, ERC20Mock _mockToken, uint256 _assetId) {
    yieldBox = _yieldBox; 
    mockToken = _mockToken; 
    assetId = _assetId;

    _mockToken.approve(address(_yieldBox), type(uint256).max);
  }

  function yoink(uint256 depositAmt, uint256 depositShares, uint256 withdrawAmt, uint256 withdrawShares) external {
    uint256 balanceBefore = mockToken.balanceOf(address(this));

    between(depositAmt, 1, balanceBefore);
    between(depositShares, 1, balanceBefore);

    // Deposit and get the results
    (uint256 amtDep, uint256 sharesDep) = yieldBox.depositAsset(assetId, address(this), address(this), depositAmt, depositShares);

    // Clamp down to those 2 for withdraw
    withdrawAmt = between(withdrawAmt, 0, amtDep);
    sharesDep = between(withdrawShares, 0, sharesDep);

    yieldBox.withdraw(assetId, address(this), address(this), withdrawAmt, sharesDep);

    // check ba
    uint256 balanceAfter = mockToken.balanceOf(address(this));

    assert(balanceAfter <= balanceBefore); // Can never gain value
  }
}


abstract contract Setup is BaseSetup {
    YieldBox yieldBox;

    // ERC20 Token Here
    // Library to create ERC20s would simply have the import from the Lib
    // If you don't want to import we can just inline from a Lib as well
    ERC20Mock mockToken;

    // Strategy, this is specific to project, so hard to generalize
    ERC20StrategyMock emptystrat;

    // The one we need to know which token to use
    // NOTE; We call it assetId, so we automatically target this!
    uint256 assetId;

    uint256 amtOutDeposit;
    uint256 shareOutDeposit;
    uint256 amtOutWithdraw;
    uint256 shareOutWithdraw;

    Yoinker yoinker;

    function setup() internal virtual override {
        mockToken = new ERC20Mock(10 ** 55);

        yieldBox = new YieldBox(IWrappedNative(address(0)), YieldBoxURIBuilder(address(0))); // TODO: Add parameters here

        emptystrat = new ERC20StrategyMock(IYieldBox(address(yieldBox)), address(mockToken));



        // Create a token
        // Store it as var
        // Add handlers for donations
        assetId = yieldBox.registerAsset(TokenType.ERC20, address(mockToken), IStrategy(address(emptystrat)), 0);

        yoinker = new Yoinker(yieldBox, mockToken, assetId);
        mockToken.transfer(address(yoinker), mockToken.balanceOf(address(this)) / 2);


        // Do a 1 Wei dono
        mockToken.approve(address(yieldBox), type(uint256).max);

        (amtOutDeposit, shareOutDeposit) = yieldBox.depositAsset(assetId, address(this), address(this), 1000e18, 0);

        // Do a 1 wei withdrawal
        // (amtOutWithdraw, shareOutWithdraw) = yieldBox.withdraw(assetId, address(this), address(this), 0, shareOutDeposit - 1);

        // Use them for base line PPFS
    }
}
