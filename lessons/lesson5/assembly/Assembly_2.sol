// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        // Intermediate variables can't communicate between  assembly blocks
        // But they can be written to memory in one block
        // and retrieved in another.
        // Fix this code using memory to store the result between the blocks
        // and return the result from the second block
        assembly {
            let result := add(x, y)
            let pointer := mload(0x40)
            mstore(pointer, result)
        }

        assembly {
            let pointer := mload(0x40)
            mstore(0x40, add(pointer, 32))
            return(pointer, 32)
        }
    }
}
