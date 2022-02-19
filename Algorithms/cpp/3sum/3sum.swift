#!/usr/bin/swift

/********************************************************************************** 
* Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? 
* Find all unique triplets in the array which gives the sum of zero.
* 
* Note:
* 
* Elements in a triplet (a,b,c) must be in non-descending order. (ie, a ≤ b ≤ c)
* The solution set must not contain duplicate triplets.
* 
*     For example, given array S = {-1 0 1 2 -1 -4},
* 
*     A solution set is:
*     (-1, 0, 1)
*     (-1, -1, 2)
**********************************************************************************/


class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        if nums.count < 3 {
            return ans
        }
        var snums = nums
        self.qSort(&snums, left: 0, right: snums.count-1)
        
        for i in 0..<snums.count-2 {
            if i > 0 && snums[i] == snums[i-1] {
                continue
            }
            var l = i+1
            var r = snums.count-1
            while l < r {
                // print("l \(l), r \(r)")
                
                let sum = snums[i] + snums[l] + snums[r] 
                if sum == 0 {
                    ans.append([snums[i], snums[l] , snums[r]])
                    while l < r && snums[l] == snums[l+1]{
                        l += 1
                    }
                    l += 1
                    while l < r && snums[r] == snums[r-1] {
                        r -= 1
                    }
                    r -= 1
                } else if sum < 0 {
                    while l < r && snums[l] == snums[l+1]{
                        l += 1
                    }
                    l += 1
                } else {
                    while l < r && snums[r] == snums[r-1] {
                        r -= 1
                    }
                    r -= 1
                }
            }
        }

        return ans
    }

    func qSort(_ nums: inout [Int], left: Int, right: Int) {
        let flag = nums[left]
        var l = left
        var r = right
        while l < r {
            while nums[r] > flag && l < r {
                r -= 1
            } 
            if l < r {
                nums[l] = nums[r]
                l += 1
            }
            while nums[l] < flag && l < r {
                l += 1
            }
            if l < r {
                nums[r] = nums[l]
                r -= 1
            }
        }
        nums[l] = flag
        if (left < l-1) {
            qSort(&nums, left: left, right: l-1)
        }
        if (l+1 < right) {
            qSort(&nums, left: l+1, right: right)
        }
    }
}

// let nums = [-1, 2, 1, 0, -1, -2, 4]
// let nums = [-1,0,1,2,-1,-4]
// let nums = [-2,0,0,2,2]
let nums = [-1,0,1,2,-1,-4,-2,-3,3,0,4]
// var n = nums
// Solution().qSort(&n, left: 0, right: n.count-1)
// print("sorted = \(n)")
let ans = Solution().threeSum(nums)
print("ans = \(ans)")
