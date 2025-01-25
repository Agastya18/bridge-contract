// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {Test, console} from "forge-std/Test.sol";
import {LockETH} from "../src/LockETH.sol";
import {Gaur} from "../src/Gaur.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract LockETHTest is Test{
 event Transfer(address indexed from, address indexed to, uint256 value);
    LockETH lockETH;
    Gaur gaur;

      function setUp() public {
        gaur = new Gaur();
       lockETH = new LockETH(address(gaur));
    }

    function test_deposit() public{
        gaur.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266,200);
        vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);

        gaur.approve(address(lockETH), 200);
        lockETH.deposit(address(gaur), 200);
          assertEq(gaur.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 0);
        assertEq(gaur.balanceOf(address(lockETH)), 200);
    }

    function test_withdraw() public{

        gaur.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 200);
        vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        gaur.approve(address(lockETH), 200);
        lockETH.deposit(address(gaur), 200);
         assertEq(gaur.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 0);
        assertEq(gaur.balanceOf(address(lockETH)), 200);
        vm.stopPrank();

        lockETH.tokenBurnedOnBaseChain(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 100);
         vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
         lockETH.withdraw(address(gaur), 100);
          assertEq(gaur.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 100);
        assertEq(gaur.balanceOf(address(lockETH)), 100);
        
    }
     function test_tokenBurnedOnBaseChain()public{
         gaur.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 200);
        vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        gaur.approve(address(lockETH), 200);

        lockETH.deposit(address(gaur), 200);
        assertEq(gaur.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 0);
        assertEq(gaur.balanceOf(address(lockETH)), 200);

        vm.stopPrank();

        lockETH.tokenBurnedOnBaseChain(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 100);
        vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        lockETH.withdraw(address(gaur), 100);
        assertEq(gaur.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 100);
     }

      function test_userTokenBalance() public {
        gaur.mint(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 200);
        vm.startPrank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        gaur.approve(address(lockETH), 200);

        lockETH.deposit(address(gaur), 200);
        assertEq(gaur.balanceOf(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266), 0);
        assertEq(gaur.balanceOf(address(lockETH)), 200);

        vm.stopPrank();

        lockETH.tokenBurnedOnBaseChain(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 200);

        uint256 balance = lockETH.userTokenBalance(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        assertEq(balance, 200, "OK");
    }


}