// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
 import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract BGaur is ERC20 , Ownable {
     event tokenBurn(address _from, uint256 _amount);
   constructor() ERC20("BGaur", "BGR") Ownable(msg.sender) {
      
   }
  function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function burn(address _from, uint256 _amount) public onlyOwner {
        _burn(_from, _amount);
          emit tokenBurn(msg.sender, _amount);
    }
}