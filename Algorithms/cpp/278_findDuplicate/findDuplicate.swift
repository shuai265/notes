
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var ans = -1
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] {
                    ans = nums[i]
                    break
                }
            }
        }
        return ans
    }
}

// 抽屉
class Solution2 {
    func findDuplicate(_ nums: [Int]) -> Int {
        var tortoise = nums[0]
        var hare = nums[0]
        repeat {
            tortoise = nums[tortoise]
            hare = nums[nums[hare]]
        } while tortoise != hare

        var ptr1 = nums[0]
        var ptr2 = tortoise
        while ptr1 != ptr2 {
            ptr1 = nums[ptr1]
            ptr2 = nums[ptr2]
        }
        return ptr1
    }
}

// let nums = [1,3,4,2,2]
// let nums = [3,1,3,4,2]
let nums = [1, 1]
let ans = Solution().findDuplicate(nums)
print("ans=\(ans)")

