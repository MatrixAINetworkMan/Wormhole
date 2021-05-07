// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';
import '@openzeppelin/contracts/utils/Address.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import "./owner/AdminRole.sol";
contract Bridge is AdminRole{
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address;

    uint256 public moveTotal;
    

    function move(address token, uint256 amount) public {
        IERC20(token).safeTransferFrom(msg.sender, address(this), amount);
        moveTotal = moveTotal + amount;
        emit Move(token, msg.sender, amount, moveTotal);
    }

    function transfer(address token, address acount, uint256 amount) public onlyAdmin {
        IERC20(token).safeTransfer(acount, amount);
    }

    event Move(address token, address user, uint256 amount, uint256 number);
}