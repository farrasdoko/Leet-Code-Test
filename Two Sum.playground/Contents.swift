import UIKit


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var value = Array<Int>()
        outer: for (index, input) in nums.enumerated() {
            guard input <= target else {continue}
            for (rootIndex, number) in nums.enumerated() {
                guard index != rootIndex  else { continue }
                let result = input + number
                if (number == 0) && (input == 0) {
                    value.append(index)
                    value.append(rootIndex)
                    break outer
                }
                if result == target {
                    value.append(index)
                    value.append(rootIndex)
                    break outer
                }
            }
        }
        return value
    }
}
let solution = Solution()
print(solution.twoSum([7,2,14,18], 9))
print(solution.twoSum([0,9,2,4,0], 0))
