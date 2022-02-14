// 递归
class Solution {
    func rob(_ nums: [Int]) -> Int {
        return helper(nums, 0)
    }

    private func helper(_ nums: [Int], _ start: Int) -> Int {
        let total = nums.count
        if start >= total {
            return 0
        } else if total - 1 == start {
            return nums[total-1]
        } else if total - 2 == start {
            return max(nums[total - 2], nums[total - 1])
        }
        let m1 = nums[start] + helper(nums, start+2)
        let m2 = nums[start+1] + helper(nums, start+3)
        return max(m1, m2)
    }
}

class Solution2 {
    func rob(_ nums: [Int]) -> Int {
        let total = nums.count
        if total == 1 {
            return nums[0]
        } else if total == 2 {
            return max(nums[0], nums[1])
        }
        var maxs = [Int]()
        maxs.append(nums[0])
        maxs.append(nums[1])
        var ans = max(nums[0], nums[1])
        for i in 2..<total {
            var m = 0
            if i >= 3 {
                m = max(maxs[i-2], maxs[i-3]) + nums[i]
                maxs.append(m)
            } else {
                m = maxs[i-2] + nums[i]
                maxs.append(m)
            }
            if m > ans {
                ans = m
            }
        }
        return ans
    }
}

// Solution2 : 递归+cache

// let nums = [1,2,3,1]
// let nums = [2,7,9,3,1]
let nums = [226,174,214,16,218,48,153,131,128,17,157,142,88,43,37,157,43,221,191,68,206,23,225,82,54,118,111,46,80,49,245,63,25,194,72,80,143,55,209,18,55,122,65,66,177,101,63,201,172,130,103,225,142,46,86,185,62,138,212,192,125,77,223,188,99,228,90,25,193,211,84,239,119,234,85,83,123,120,131,203,219,10,82,35,120,180,249,106,37,169,225,54,103,55,166,124]
// let ans = Solution().rob(nums)
// print("ans = \(ans)")
let ans2 = Solution2().rob(nums)
print("ans2 = \(ans2)")