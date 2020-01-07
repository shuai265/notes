
/**
 * 给定一个未排序的整数数组，找出最长连续序列的长度。
 * 要求算法的时间复杂度为 O(n)。
 */


class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numsSet = Set<Int>()
        var longest = 0
        for num in nums {
            numsSet.insert(num)
        }
        for num in numsSet {
            if !numsSet.contains(num-1) {
                var current = 1
                var k = num
                while numsSet.contains(k+1) {
                    current += 1
                    k += 1
                }
                if current > longest {
                    longest = current
                }
            }
        }
        return longest
    }
}


// let nums = [100, 4, 200, 1, 3, 2]
// let nums = [1,3,5,2,4]
// let nums = [0]
let nums = [0,3,7,2,5,8,4,6,0,1]
let longest = Solution().longestConsecutive(nums)
print("\(longest)")

