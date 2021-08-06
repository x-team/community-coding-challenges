function solution(nums, target) {
  const pairs = {};
  for(let i = 0; i < nums.length; i++) {
    if (typeof pairs[target - nums[i]] !== 'undefined') {
      return [pairs[target - nums[i]], i];
    }
    pairs[nums[i]] = i;
  }
}