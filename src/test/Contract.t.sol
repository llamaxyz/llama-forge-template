// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

// testing libraries
import "@forge-std/Test.sol";

// contract dependencies
import {Contract} from "../Contract.sol";

contract ContractTest is Test {
    Contract public numContract;
    uint256 public constant NUM = 7;

    function setUp() public {
        numContract = new Contract(NUM);
        vm.label(address(numContract), "Contract");
    }

    function testSetNum(uint256 x) public {
        assertEq(numContract.num(), NUM);
        numContract.changeNum(x);
        assertEq(numContract.num(), x);
    }
}
