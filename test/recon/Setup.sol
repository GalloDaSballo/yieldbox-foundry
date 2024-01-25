
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
import "src/strategies/BaseBufferStrategy.sol";
import "src/interfaces/IYieldBox.sol";
import "src/mocks/MasterContractMock.sol";
import "src/mocks/ERC1155ReceiverMock.sol";
import "src/mocks/ERC1155ReceiverMock.sol";
import "src/mocks/ERC1155ReceiverMock.sol";
import "src/strategies/BaseStrategy.sol";
import "src/strategies/BaseStrategy.sol";
import "src/strategies/BaseStrategy.sol";
import "src/strategies/SushiStakingBufferStrategy.sol";
import "src/mocks/SushiBarMock.sol";

abstract contract Setup is BaseSetup {

    YieldBox yieldBox;

    function setup() internal virtual override {
      yieldBox = new YieldBox(IWrappedNative(address(0)), YieldBoxURIBuilder(address(0))); // TODO: Add parameters here
    }
}
