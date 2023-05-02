// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2;

contract DeletableArray {
    uint256[] private data;

    function addItems(uint[] memory items) public {
        for (uint i = 0; i < items.length; i++) {
            data.push(items[i]);
        }
    }

    /**
     * Deletes index without keeping order of elements
     */
    function delete_index_without_order(uint256 index) public {
        if (index >= data.length) {
            revert("Index is out of range");
        }
        data[index] = data[data.length - 1];
        data.pop();
    }

    /**
     * Deletes index while keeping order of elements
     */
    function delete_index(uint256 index) public {
        if (index >= data.length) {
            revert("Index is out of range");
        }

        // Shifts elements to the left
        for (uint i = index; i < data.length - 1; i++) {
            data[index] = data[index + 1];
        }

        data.pop();
    }
}
