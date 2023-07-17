// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    uint[10] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // Function to check for the sum of array
    // No changes required in this function
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

    // Optimized function using Different For Loop Increment Syntax
    // The sum of elements in the numbers array will be equal to 0
    function optimizedFunction() public {
        // Cache the array locally to reduce storage reads
        uint[10] memory cachedNumbers = numbers;

        // Use a different for loop increment syntax for gas optimization
        // Start from the end of the array and decrement 'i'
        for (uint i = cachedNumbers.length; i > 0; i--) {
            cachedNumbers[i - 1] = 0;
        }

        // Write the updated values back to the state variable
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = cachedNumbers[i];
        }
    }
}

