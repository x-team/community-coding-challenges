using System;
using System.Collections;

namespace twosum
{
     public class TwoSumSolution
     {
          static void Main(string[] args)
          {
               int[] arr = { 2, 7, 11, 15 };

               int[] result = TwoSum(arr, 9);
               Console.WriteLine("[{0}]", string.Join(", ", result));
          }

          static int[] TwoSum(int[] numbers, int target)
          {
               Hashtable seen = new Hashtable();

               for (int i = 0; i < numbers.Length; i++)
               {
                    int num = numbers[i];
                    int needed = target - num;

                    if (!seen.ContainsKey(needed))
                    {
                         seen.Add(num, i);
                    }
                    else
                    {
                         int[] result = { Convert.ToInt32(seen[needed]), i };
                         return result;
                    }

               }

               return new int[] { };
          }

     }


}
