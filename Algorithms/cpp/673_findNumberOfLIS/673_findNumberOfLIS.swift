
/**
 * https://leetcode-cn.com/problems/number-of-longest-increasing-subsequence/
 */

class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var maxCnts = [Int]()
        var pathCnts = [Int]()
        var maxLength = 0
        var ans = 0
        for i in 0..<nums.count {
            var length = 0
            let currentNum = nums[i]
            var currentPathCnt = 0
            for j in 0..<i {
                if currentNum > nums[j] {
                    if maxCnts[j] > length {
                        length = maxCnts[j]
                        // currentCnt = 1
                        currentPathCnt = pathCnts[j]
                    } else if (maxCnts[j] == length) {
                        // currentCnt += 1
                        currentPathCnt += pathCnts[j]
                    }
                }
            }
            length += 1
            currentPathCnt = max(currentPathCnt, 1)
            
            maxCnts.append(length)
            pathCnts.append(currentPathCnt)
            
            if length == maxLength {
                ans += currentPathCnt
            } else if length > maxLength {
                ans = currentPathCnt
                maxLength = length
            }
        }
        // print("maxCnts = \(maxCnts)")
        return ans
    }
}


let nums = [1,3,5,4,7]
// let nums = [2,2,2,2,2]
// let nums = [1,3,7,6,5]
// let nums = [1,3,7,6,5,6,7]
// let nums = [1,2,4,3,5,4,7,2]

let ans = Solution().findNumberOfLIS(nums)
print("ans = \(ans)")
