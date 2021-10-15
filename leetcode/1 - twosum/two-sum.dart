void main() {
  final twoSum1 = TwoSum(numbers: [2, 7, 11, 15], target: 9);
  final twoSum2 = TwoSum(numbers: [3, 2, 4], target: 6);
  final twoSum3 = TwoSum(numbers: [3, 3], target: 6);
  print(twoSum1.solve());
  print(twoSum2.solve());
  print(twoSum3.solve());
}

class TwoSum {
  final List<int> numbers;
  final int target;

  TwoSum({
    required this.numbers,
    required this.target,
  });

  List<int> solve() {
    Map<int, int> cache = {};
    for (var index = 0; index < numbers.length; index++) {
      final targetFound = target - numbers[index];
      if (cache.containsKey(targetFound)) {
        return <int>[cache[targetFound]!, index];
      }
      cache[numbers[index]] = index;
    }
    return <int>[];
  }
}
