// 给你一个可能存在 重复 元素值的数组 numbers ，它原来是一个升序排列的数组，并按上述情形进行了一次旋转。请返回旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一次旋转，该数组的最小值为1。  

// 示例 1：

// 输入：[3,4,5,1,2]
// 输出：1
// 示例 2：

// 输入：[2,2,2,0,1]
// 输出：0

// 链接：https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof


class Solution {
    func minArray(_ numbers: [Int]) -> Int {
        var l = 0
        var r = numbers.count-1
        while l < r {
            let m = (l+r)/2
            let mid = numbers[m]
            if mid > numbers[r] {
                l = m + 1
            } else if mid < numbers[r] {
                r = m
            } else {
                r -= 1
            }
        }
        return numbers[l]
    }
}

// let nums = [3,4,5,1,2]
// let nums = [2,2,2,0,1]
let nums = [3,1,3]
let ans = Solution().minArray(nums)
print("ans = \(ans)")