// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Slot0 {
    uint256 public slot0;

    function getSlot0() external view returns (uint256) {
        return slot0;
    }

    function setSlot0(uint256 v) external {
        slot0 = v;
    }
}
