// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2;

contract Yul {
    function addition() public pure {
        assembly {
            let freeMemLocation := mload(0x40)
            mstore(freeMemLocation, add(0x07, 0x08))
        }
    }

    function additionOpCodes() public pure {
        /**
          PUSH1 0x40
          MLOAD

          PUSH1 0x07
          PUSH1 0x08
          ADD

          MSTORE
         */
    }
}
