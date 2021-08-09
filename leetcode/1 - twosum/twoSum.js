const solution = (nums, target) => nums.reduce(
  (pairs, num, index) => nums.includes(target - num) ? [nums.indexOf(target - num), index] : pairs,
  []
);