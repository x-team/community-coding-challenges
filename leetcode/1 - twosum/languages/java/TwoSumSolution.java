# https://leetcode.com/problems/two-sum/
# -> Challenge:
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# Example:

# Given nums = [2, 7, 11, 15], target = 9,

# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

package Algoritms;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class TwoSumSolution {

    public static void main(String[] args) {
        int[] inputArray = new int[]{2,7,11,15};
        int inputTarget = 9;
        int[] ints = twoSum(inputArray, inputTarget);
        Arrays.stream(ints).forEach(System.out::println);
    }

    private static int[] twoSum(int[] inputNumbers, int target) {
        Map<Integer,Integer> map = new HashMap<>();
        for(int index = 0; index < inputNumbers.length; index++){

            int targetFound = target - inputNumbers[index];
            if (map.containsKey(targetFound)){
                return new int[]{map.get(targetFound), index};
            }
            map.put(inputNumbers[index], index);
        }

        return new int[]{};
    }
}

