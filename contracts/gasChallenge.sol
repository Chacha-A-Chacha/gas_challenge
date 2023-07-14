// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Fixed-Size Array Technique Here
    uint[10] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }

    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }

    //Implementing The Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should be equal 0
    function optimizedFunction() public {
        // uint length = numbers.length;

        // for (uint i = 0; i < length; i++) {
        //     numbers[i] = 0;
        // }

        // uint length = numbers.length;
        // uint[10] storage localNumbers = numbers;

        // assembly {
        //     let ptr := localNumbers.slot

        //     for {
        //         let i := 0
        //     } lt(i, length) {
        //         i := add(i, 1)
        //     } {
        //         sstore(add(ptr, mul(i, 0x20)), 0)
        //     }
        // }
        uint length = numbers.length; // Cache the length of the `numbers` array

        // Cache the `numbers` array to a local storage variable
        uint[10] storage localNumbers = numbers;

        //i++ over i += 1
        // unchecked
        for (uint i = 0; i < length; ) {
            localNumbers[i] = 0;
            unchecked {
                i++;
            }
        }
        //     assembly {
        //     let ptr := localNumbers.slot

        //     for {let i := 0} lt(i, length) {i := add(i, 1)} {
        //         unchecked {
        //             sstore(add(ptr, mul(i, 0x20)), 0)
        //         }
        //     }
        // }
    }
}
