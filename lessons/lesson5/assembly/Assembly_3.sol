// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        assembly {
            if lt(x, y) {
                let freeMemoryPointer := mload(0x40)
                // mstore(freeMemoryPointer, 0)
                // mstore(0x40, add(freeMemoryPointer, 32))

                // By default, uninitialized memory has value of "0"
                return(freeMemoryPointer, 32)
            }

            let result := sub(x, y)

            // Allocate memory for the result (32 bytes)
            let memPointer := mload(0x40)

            // Store the value "result" at the memory location pointed by memPointer
            mstore(memPointer, result)

            // Update the free memory pointer
            mstore(0x40, add(memPointer, 32))

            return(memPointer, 32)
        }
    }
}
