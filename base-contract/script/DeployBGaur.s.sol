// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {BGaur} from "../src/BGaur.sol";

contract DeployLockContract1 is Script {
    function run() external returns (BGaur) {

        vm.startBroadcast();

        BGaur bgaur = new BGaur();

        vm.stopBroadcast();

        return bgaur;

    }
}