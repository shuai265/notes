class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return target == nums[0] ? 1 : 0
        }
        var l = 0
        var r = nums.count-1
        // var found = false
        while l <= r {
            let mid = (l+r)/2
            let midVal = nums[mid]
            if midVal < target {
                l = mid + 1
            } else if midVal > target {
                r = mid - 1
            } else {
                // found = true
                print("l = \(l), r = \(r), mid = \(mid)")
                l = mid
                r = mid + 1
                break
            }
        }
        print("l = \(l), r = \(r)")
        var cnt = 0

        while l >= 0 {
            if nums[l] == target {
                cnt += 1
            } else {
                break
            }
            l -= 1
        }

        while r < nums.count && r > 0 {
            if nums[r] == target {
                cnt += 1
            } else {
                break
            }
            r += 1
        }
        return cnt
    }
}

let nums = [5,7,7,8,8,10]
let target = 8
// let nums = [1]
// let target = 1
// let nums = [2,2]
// let target = 1
// let nums = [1,4] //
// let target = 4
let ans = Solution().search(nums, target)
print("ans = \(ans)")