/**
 * 查找中位数
 * */

class Solution {
    // 快排
    func findMiddle(_ nums: [Int]) -> Int {
        var numsM = nums
        let ans = helper(&numsM, 0, nums.count-1, nums.count/2)
        return ans
    }

    func helper(_ nums: inout [Int], _ l: Int, _ r: Int, _ pos: Int) -> Int {
        // print("enter - nums:\(nums), l: \(l), r: \(r), pos: \(pos)")
        
        var left = l
        var right = r
        let target = nums[left]
        // var ans = -1
        while left < right {
            while nums[right] > target && left < right {
                right -= 1
            }
            if left < right {
                nums[left] = nums[right]
                left += 1
            }
            while nums[left] < target && left < right {
                left += 1
            }
            if left < right {
                nums[right] = nums[left]
                right -= 1
            }
        }
        
        nums[left] = target
        // print("after sort - nums:\(nums), left: \(left), right: \(right)")
        
        if left > pos {
            return helper(&nums, l, left-1, pos)
        } else if left < pos {
            return helper(&nums, left+1, r, pos)
        } else {
            return nums[left]
        }
    }
}


// let nums = [3, 5, 2, 8, 1, 7, 9]
// let nums = [3, 5, 2, 8, 1]
let nums = [3, 5, 2, 8, 1, 7, 9, 11, -1, 32, 342, 12, 6]
let ans = Solution().findMiddle(nums)

print("ans = \(ans)")


