// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract LockETH is Ownable{

      address public tokenAddress;
     mapping (address => uint256) public balanceOfToken;
      event LockEvent(address indexed sender, uint256 amount);
    event WithDrawEvent(address sender, uint256 amount);
    constructor(address  _tokenAddress) Ownable(msg.sender) {

        tokenAddress = _tokenAddress;

    }

    function deposit(address _tokenAddress, uint256 _amount) public {
       require(tokenAddress == _tokenAddress, "address not matched");
       require(_amount > 0, "amount should be greater than 0");
       IERC20 token=   IERC20(_tokenAddress);
       require(token.allowance(msg.sender,address(this))>= _amount, "allowance not enough");

       bool success = token.transferFrom(msg.sender, address(this), _amount);
         require(success, "transfer failed");
         emit LockEvent(msg.sender, _amount);
    }

    function withdraw(address _tokenAddress, uint256 _amount) public{
        require(tokenAddress == _tokenAddress, "address not matched");
        require(_amount > 0, "amount should be greater than 0");

        uint256 balance = balanceOfToken[msg.sender];
        require(balance >= _amount, "balance not enough");

        balanceOfToken[msg.sender] -=  _amount;
        IERC20 token=   IERC20(_tokenAddress);
        bool success = token.transfer(msg.sender, _amount);
        require(success, "transfer failed");
        emit WithDrawEvent(msg.sender, _amount);


    }

    function tokenBurnedOnBaseChain(address _to, uint256 _amount) public onlyOwner{

         require(_amount > 0, 'The token value should be greater than zero');
        balanceOfToken[_to] += _amount;

    }

     function userTokenBalance(address _userAddress) public view returns(uint256) {
        return balanceOfToken[_userAddress];
    }

}