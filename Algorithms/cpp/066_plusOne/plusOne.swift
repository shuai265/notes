class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var nums = digits
        nums[digits.count-1] = nums[digits.count-1]+1
        for i in (0..<nums.count).reversed() {
            let num = nums[i]
            if num <= 9 {
                break
            } else {
                // 10
                nums[i] = 0
                if i > 0 {
                    nums[i-1] = nums[i-1] + 1
                } else {
                    nums.insert(1, at: 0)
                }
            }
        }
        return nums
    }
}

let digits = [8,9,9,9]
let ans = Solution().plusOne(digits)
print("ans = \(ans)")