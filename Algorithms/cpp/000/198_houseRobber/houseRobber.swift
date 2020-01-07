
class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        var maxSum = max(nums[0], nums[1])
        helper(nums, 2, maxSum, nums[0], &maxSum)
        return maxSum
    }

    func helper(_ nums: [Int], _ idx: Int, _ preSum: Int, _ prePreSum: Int, _ maxSum: inout Int) {
        if idx < nums.count {
            // print("\(idx), num=\(nums[idx]), preSum=\(preSum), prePreSum=\(prePreSum), maxSum=\(maxSum))")
            let sum = max(preSum, prePreSum+nums[idx])
            if sum > maxSum {
                maxSum = sum
            }
            helper(nums, idx+1, sum, preSum, &maxSum)
        }
    }
}

let nums = [2,1,1,2]
// let nums = [1,2,3,1]
let maxSum = Solution().rob(nums)
print("\(maxSum)")
