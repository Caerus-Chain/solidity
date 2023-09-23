// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Slot0Caerus {
    uint256 public slot0;

    function getSlot0() external view returns (uint256) {
        return slot0;
    }

    function setSlot0(uint256 v) external {
        slot0 = v;
    }

    function getSlot0Caerus(
        uint256 blockNumber
    ) external view returns (uint256) {
        require(blockNumber < block.number);
        return
            uint256( // type casting (bytes32 => uint256)
                caerus(
                    address(this), // account
                    0, // slot number
                    blockNumber // past block number
                )
            );
    }
}
