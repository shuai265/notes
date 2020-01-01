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

// 方法1: 遍历 O(n)
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var ans: Int = Int.min
        var sum: Int = 0

        for num in nums {
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

// 方法2: 分治法
/**
 * 定义基本情况。
 * 将问题分解为子问题并递归地解决它们。
 * 合并子问题的解以获得原始问题的解。
 */
class Solution2 {
    func maxSubArray(_ nums: [Int]) -> Int {

    }
}



// let nums = [-2,1,-3,4,-1,2,1,-5,4]
// let nums = [-2]
let nums = [-2, -1]
let ans = Solution().maxSubArray(nums)
print("\(ans)")