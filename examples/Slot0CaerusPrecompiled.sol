// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Slot0CaerusPrecompiled {
    uint256 public slot0;

    function getSlot0() external view returns (uint256) {
        return slot0;
    }

    function setSlot0(uint256 v) external {
        slot0 = v;
    }

    function getSlot0Caerus(uint256 blockNumber)
        external
        view
        returns (uint256 output)
    {
        require(blockNumber < block.number);

        uint256 slotNumber = 0;
        bytes memory args = abi.encodePacked(
            address(this),
            slotNumber,
            blockNumber
        );
        (, bytes memory returnData) = address(0x13).staticcall(args);
        return uint256(bytesToBytes32(returnData));
    }

    function bytesToBytes32(bytes memory source)
        public
        pure
        returns (bytes32 result)
    {
        require(
            source.length <= 32,
            "Source must be less than or equal to 32 bytes"
        );

        // Explicitly convert each byte in the source to fill the bytes32
        for (uint256 i = 0; i < source.length; i++) {
            result |= bytes32(source[i] & 0xFF) >> (i * 8);
        }
        return result;
    }
}
