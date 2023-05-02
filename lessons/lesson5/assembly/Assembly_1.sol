// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            // let variable_name := VALßUE
            // instantiate a stack variable that holds the value of mol
            // To return it needs to be stored in memory
            // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
            // to return you need to specify address and the size from the starting point

            let molValue := mol
            let memLocation := mload(0x40)
            mstore(memLocation, molValue)
            mstore(0x40, add(memLocation, 32))
            return(memLocation, 32)
        }
    }
}
