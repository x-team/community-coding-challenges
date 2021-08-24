import Cocoa

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       var seen: Set<Int> = []
    
    for i in 0 ... nums.count - 1 {
        let complement = target - nums[i]
        if seen.contains(complement) {
            if let complementIndex = nums.firstIndex(of: complement) {
                return([complementIndex,i])
            }
        } else {
            seen.insert(nums[i])
        }
    }
    return []
    }
}
