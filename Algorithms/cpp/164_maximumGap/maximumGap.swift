class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        guard nums.count >= 2 else {
            return 0
        }

        var numsSet = Set<Int>()
        var minNum = nums[0]
        var maxNum = nums[0]
        for num in nums {
            numsSet.insert(num)
            minNum = min(minNum, num)
            maxNum = max(maxNum, num)
        }
        // print("min = \(minNum), max = \(maxNum), numsSet = \(numsSet)")
        
        var gap = 0
        var pre = minNum
        for i in minNum...maxNum {
            if numsSet.contains(i) {
                gap = max(i-pre, gap)
                pre = i
            }
        }

        return gap
    }
}

// let nums = [3,6,9,1]
// let nums = [10]
let nums = [3,7,9,1]
let ans = Solution().maximumGap(nums)
print("ans = \(ans)")
