/**
 * 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 * 示例:
 * 
 * 输入: [-2,1,-3,4,-1,2,1,-5,4],
 * 输出: 6
 * 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 *
 * 进阶:
 * 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。 
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var ans: Int = Int.min
        var sum: Int = 0

        // for (index, num) in nums.enumerated() {
        for num in nums {
            var tmp = sum + num
            // if num > 0, sum < 0 {
            //     sum = num 
            // } else if num > 0, sum > 0 {
            //     sum += num 
            // } else {
            //     sum += num 
            // }

            if sum < 0, num > sum {
                sum = num 
            } else {
                sum += num 
            }

            if sum > ans {
                ans = sum
            }
        }
        return ans
    }
}

// let nums = [-2,1,-3,4,-1,2,1,-5,4]
// let nums = [-2]
let nums = [-2, -1]
let ans = Solution().maxSubArray(nums)
print("\(ans)")