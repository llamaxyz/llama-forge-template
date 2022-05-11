// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.12;

// testing libraries
import "@ds/test.sol";
import "@std/console.sol";
import {stdCheats} from "@std/stdlib.sol";
import {Vm} from "@std/Vm.sol";
import {DSTestPlus} from "@solmate/test/utils/DSTestPlus.sol";

import {Contract} from "../Contract.sol";

contract ContractTest is DSTestPlus, stdCheats {
    Vm private vm = Vm(HEVM_ADDRESS);
    Contract public numContract;
    uint256 public constant originalNumber = 7;

    function setUp() public {
        numContract = new Contract(originalNumber);
        vm.label(address(numContract), "Contract");
    }

    function testSetNum(uint256 x) public {
        assertEq(numContract.num(), originalNumber);
        numContract.changeNum(x);
        assertEq(numContract.num(), x);
    }
}
