
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var left: [Int] = []
        for (idx, num) in nums.enumerated() {
            if idx == 0 {
                left.append(1)
            } else if idx == 1 {
                left.append(nums[0])
            } else {
                left.append(left[idx-1] * nums[idx-1])
            }
        }

        var right: [Int] = []
        for idx in 0..<nums.count {
            if idx == 0 {
                right.append(1)
            } else if idx == 1 {
                right.append(nums[nums.count-idx])
            } else {
                right.append(right[idx-1] * nums[nums.count-idx])
            }
        }
        for idx in 0..<nums.count {
            left[idx] = left[idx] * right[nums.count-idx-1]
        }
        return left
    }
}

let nums = [1, 2, 3, 4]
let ans = Solution().productExceptSelf(nums)
print("ans=\(ans)")