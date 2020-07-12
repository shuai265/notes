class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return 1
        }
        var container:[Int] = []
        var max = 1
        for i in 0..<nums.count {
            container.append(1)
            for j in 0...i {
                if nums[i] > nums[j] {
                    container[i] = Swift.max(container[i], container[j]+1)
                    if container[i] > max {
                        max = container[i]
                    }
                }
            }
        }
        return max
    }
}

// let nums = [10,9,2,5,3,7,101,18]
let nums = [10,9,2,5,3,4]
let ans = Solution().lengthOfLIS(nums)
print("ans=\(ans)")
