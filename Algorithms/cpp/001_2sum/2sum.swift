

class Solution {
    func findSub(_ nums:[Int], _ sum: Int) -> (Int, Int) {
        var numSet = Set<Int>()
        var numMap = [Int: Int]()
        for (idx,num) in nums.enumerated() {
            numSet.insert(num)
            numMap[num] = idx
        }
        var p1 = -1
        var p2 = -1
        for (idx,num) in nums.enumerated() {
            let d = sum - num
            if numSet.contains(d) {
                p1 = idx
                p2 = numMap[d]!
                break
            }
        }
        return (min(p1, p2), max(p1, p2))
    }
}

let nums = [2, 7, 11, 15]
let sum = 1
let ans = Solution().findSub(nums, sum)
print("ans = \(ans)")

