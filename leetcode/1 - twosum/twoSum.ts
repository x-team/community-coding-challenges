const solution = (nums: number[], target: number) : number[] => nums.reduce(
    (pairs, num, index) => nums.includes(target - num) ? [nums.indexOf(target - num), index] : pairs,
    []
  );