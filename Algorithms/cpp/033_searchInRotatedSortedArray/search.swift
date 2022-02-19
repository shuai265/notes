class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count-1
        while l < r {
            let m = (l+r)/2
            let midVal = nums[m]
            print("l = \(l), r = \(r), m = \(m), midVal = \(midVal), target = \(target)")
            if midVal == target {
                 return m 
            } else if midVal > target {
                if nums[l] <= target || nums[l] > midVal { 
                    // 左侧
                    r = m
                } else {
                    // 右侧
                    l = m + 1
                }
            } else {  // midVal < target
                if nums[r] >= target || midVal > nums[r] { 
                    // 右侧
                    l = m + 1
                } else {
                    // 左侧
                    r = m
                }
            }
        }
        if nums[l] == target {
            return l
        }
        return -1
    }
}

// let nums = [4,5,6,7,8,1,2,3]
// let nums = [6,7,8,1,2,3,4,5]
// let target = 8
let nums = [5,1,2,3,4]
let target = 1
let ans = Solution().search(nums, target)
print("ans = \(ans)")