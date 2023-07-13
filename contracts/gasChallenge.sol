// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Fixed-Size Array Technique Here
    uint256[10] numbers = [1,2,3,4,5,6,7,8,9,10];
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
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
    
    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        uint256 length = numbers.length;
        assembly {
            let ptr := numbers.slot
            for {let i := 0} lt(i, length) {i := add(i, 1)} {
                sstore(add(ptr, mul(i, 0x20)), 0)
            }
        }
    }
 }


/*
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    uint256[10] numbers = [1,2,3,4,5,6,7,8,9,10]; // Fixed-size array
    
    function getSumOfArray() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint256 i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    function optimizedFunction() public {
        uint256 length = numbers.length;
        assembly {
            let ptr := numbers.slot
            for {let i := 0} lt(i, length) {i := add(i, 1)} {
                sstore(add(ptr, mul(i, 0x20)), 0)
            }
        }
    }
}
*/