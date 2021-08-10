using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace TwoSumCSharp
{
    class TwoSumConsoleApp
    {
        static void Main(string[] args)
        {
            var nums = GenerateNums();
            
            var sw = new Stopwatch();
            Console.WriteLine("Starting to run the first solution to find two numbers that add up to three.");
            sw.Start();
            // Only the last two indexes of nums (which have values 1 and 2) add up to 3.
            var r1 = TwoSumFirstSolution(nums, 3);
            sw.Stop();
            Console.WriteLine($"Found Result {r1[0]}, {r1[1]}");
            Console.WriteLine($"\nTime to execute the first solution.: {sw.ElapsedMilliseconds} ms");

            Console.WriteLine("\nStarting to run the second solution to find two numbers that add up to three.");
            sw.Restart();
            // Only the last two indexes of nums (which have values 1 and 2) add up to 3.
            var r2 = TwoSumSecondSolution(nums, 3);
            sw.Stop();
            Console.WriteLine($"Found Result {r2[0]}, {r2[1]}");
            Console.WriteLine($"\nTime to execute the second solution.: {sw.ElapsedMilliseconds} ms");

            Console.ReadLine();
        }

        static int[] TwoSumFirstSolution(int[] nums, int target) 
        {
            var foundTarget = false;
            var output = new int[2];
            foreach(int num in nums)
            {
                foreach (int secondNum in nums) 
                {
                    if (secondNum != num && secondNum + num == target) 
                    {
                        foundTarget = true;
                        output[0] = num;
                        output[1] = secondNum;
                        break;
                    }
                }
                if (foundTarget) 
                {
                    break;
                }
            }

            return output;
        }

        static int[] TwoSumSecondSolution(int[] nums, int target)
        {
            var seen = new Dictionary<int, int>();
            var output = new int[2];

            for (var i = 0; i < nums.Length; i++) 
            {
                var pair = target - nums[i];
                if (seen.TryGetValue(pair, out int seenIndex)) 
                {
                    output[0] = nums[seenIndex];
                    output[1] = nums[i];
                    break;
                }
                else
                {
                    seen.Add(nums[i], i);
                }
            }

            return output;
        }

        // Generates an array with 10 ^ 4 numbers, from 1 to 10^4. 
        // Then switches the first 2 numbers with the last 2 and returns the array.
        static int[] GenerateNums()
        {
            var numQty = (int)Math.Pow(10, 4);
            var inputNums = new int[numQty];
            for (int i = 1; i <= numQty; i++) 
            {
                inputNums[i - 1] = i;
            }

            inputNums[inputNums.Count() - 2] = 1;
            inputNums[inputNums.Count() - 1] = 2;
            inputNums[0] = numQty - 1;
            inputNums[1] = numQty;

            return inputNums;
        }
    }
}
