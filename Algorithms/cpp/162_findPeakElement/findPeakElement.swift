/*
https://leetcode-cn.com/problems/find-peak-element/submissions/
峰值元素是指其值大于左右相邻值的元素。
给你一个输入数组 nums，找到峰值元素并返回其索引。数组可能包含多个峰值，在这种情况下，返回 任何一个峰值 所在位置即可。
你可以假设 nums[-1] = nums[n] = -∞ 。

示例 1：
输入：nums = [1,2,3,1]
输出：2
解释：3 是峰值元素，你的函数应该返回其索引 2。
*/

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        // var pre = nums[0]
        for i in 0..<nums.count {
            let num = nums[i]
            var bl = true
            if i > 0 {
                bl = num > nums[i-1]
            }
            if bl {
                var rl = true
                if i < nums.count-1 {
                    rl = nums[i+1] < num
                }
                if rl {
                    return i
                }
            }
        }
        return -1
    }
}

// let nums = [1,2,3,1]
// let nums = [1,2,1,3,5,6,4]
// let nums = [1]
// let nums = [1, 2]
// let nums = [2, 1]
let nums: [Int] = []
let ans = Solution().findPeakElement(nums)
print("ans = \(ans)")
