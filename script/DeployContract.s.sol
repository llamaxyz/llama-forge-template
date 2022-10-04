// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import "@forge-std/console.sol";
import {Script} from "@forge-std/Script.sol";
import {Contract} from "../src/Contract.sol";

contract DeployContract is Script {
    uint256 public constant NUM = 7;

    function run() external {
        vm.startBroadcast();
        Contract deployedContract = new Contract(NUM);
        console.log("Contract address: ", address(deployedContract));
        vm.stopBroadcast();
    }
}
