class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var max = Int.min
        for i in 0..<nums.count {
            var current = 1;
            for j in i..<nums.count {
                current *= nums[j];
                if current > max {
                    max = current
                }
            }
        }
        return max
    }
}

class Solution2 {
    func maxProduct(_ nums: [Int]) -> Int {
        var max = Int.min
        var result: [Int] = []
        for num in nums {
            helper(num, &result, &max)
        }
        return max
    }

    func helper(_ num: Int, _ result: inout [Int], _ max: inout Int) {
        for (i, n) in result.enumerated() {
            let newVal = n * num
            result[i] = newVal
            if newVal > max {
                max = newVal
            }
        }
        result.append(num)
        if num > max {
            max = num
        }
    }
}

// 动态规划
class Solution3 {
    func maxProduct(_ nums: [Int]) -> Int {
        var max = Int.min
        helper(nums, 0, &max, 1, 1)
        return max
    }

    func helper(_ nums: [Int], _ idx: Int, _ max: inout Int, _ maxPositive: Int, _ minNegative: Int) {
        if idx < nums.count {
            let num = nums[idx]
            // print("num=\(num), maxPos=\(maxPositive), minNeg=\(minNegative)")
            var maxPositive = maxPositive
            var minNegative = minNegative

            if num >= 0 {
                maxPositive = Swift.max(maxPositive*num, num)
                minNegative = minNegative * num
            } else {
                let minNeg = minNegative
                minNegative = min(maxPositive * num, num)
                maxPositive = minNeg * num
            }
            if maxPositive > max {
                max = maxPositive
            }
            helper(nums, idx+1, &max, maxPositive, minNegative)
        }
    }
}

let nums = [2,3,-2,4]
// let nums = [2,3,-2,4,-8]
// let nums = [-2]
let max = Solution().maxProduct(nums)
print("\(max)")

let max2 = Solution2().maxProduct(nums)
print("\(max2)")

let max3 = Solution3().maxProduct(nums)
print("\(max3)")
