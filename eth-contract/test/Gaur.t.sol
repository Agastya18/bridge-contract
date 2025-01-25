// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {Test, console} from "forge-std/Test.sol";
import {Gaur} from "../src/Gaur.sol";

contract GaurTest is Test{
    
    Gaur gaur;
    uint256 ethToWei = 10 ** 18;
   function setUp() public {
     vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
       gaur = new Gaur();
        vm.stopPrank();
    }

    function testMint() public {
        vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
       gaur.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 10 * ethToWei);
        assertEq(gaur.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 10 * ethToWei, "OK");
    }
}