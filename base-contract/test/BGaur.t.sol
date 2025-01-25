// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {Test, console} from "forge-std/Test.sol";
import {BGaur} from "../src/BGaur.sol";

contract BGaurTest is Test{

    BGaur public bgaur;
 uint256 ethToWei = 10 ** 18;
    function setUp() public {
        bgaur = new BGaur();
       
    }
    function test_mint()public{

        bgaur.mint(address(this),100 * ethToWei);
         assertEq(bgaur.balanceOf(address(this)), 100 * ethToWei, "OK");

    }

    function test_burn()public{
        bgaur.mint(address(this),100 * ethToWei);
        bgaur.burn(address(this), 50 * ethToWei);
        assertEq(bgaur.balanceOf(address(this)), 50 * ethToWei, "OK");
    }
}