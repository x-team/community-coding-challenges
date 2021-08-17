#include <bits/stdc++.h>

using namespace std;

/**
 * The Two Sum problem can be solved using a map to store each index
 * 
 * In the following approach, the C++ Map can store each index in O (Log N)
 * The trick in this question is start to store index from last index to index 1,
 * just to deal with repeated values. The other point is just get all indexes in O (N)
 * 
 * After that, you can loop through array getting the remainder and check if
 * there is this velor in the array
 * 
 * Complexity Time: O (N log N)
 * 
 * Note: Its possible solve this problem using Binary Search as well,
 * you just need to be careful with negative values. The complexity time
 * will be O (N log N) as well.
 * 
 */ 

vector<int> twoSum(vector<int>& nums, int target) {
   map<int, int> mapAux;

  for(int i = nums.size() - 1; i >= 1; i--) {
    mapAux[nums[i]] = i;
  } 

  for(int i = 0; i < nums.size(); i++) {
    int rem = target - nums[i];
    int remPos = mapAux[rem];

    if(nums[remPos] == rem && remPos != i) {
      vector<int> answer = {i, remPos};

      return answer;
    }
  }

  return vector<int>();
}

int main () {

  vector<int> nums = {2, 7, 11, 15};
  int target = 9;

  auto answer = twoSum(nums, target);

  cout << answer[0] << " " << answer[1] << endl; 

  return 0;
}