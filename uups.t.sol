// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {MyToken} from "src/MyToken.sol";

contract MyTokenTest is Test {
  MyToken public instance;

  function setUp() public {
    address initialOwner = vm.addr(1);
    address proxy = Upgrades.deployUUPSProxy(
      "MyToken.sol",
      abi.encodeCall(MyToken.initialize, (initialOwner))
    );
    instance = MyToken(proxy);
  }

  function testName() public view {
    assertEq(instance.name(), "MyToken");
  }
}
