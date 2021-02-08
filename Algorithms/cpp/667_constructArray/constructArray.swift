/**
 * https://leetcode-cn.com/problems/beautiful-arrangement-ii/
 * 
给定两个整数 n 和 k，你需要实现一个数组，这个数组包含从 1 到 n 的 n 个不同整数，同时满足以下条件：

① 如果这个数组是 [a1, a2, a3, ... , an] ，那么数组 [|a1 - a2|, |a2 - a3|, |a3 - a4|, ... , |an-1 - an|] 中应该有且仅有 k 个不同整数；.

② 如果存在多种答案，你只需实现并返回其中任意一种.

示例 1:

输入: n = 3, k = 1
输出: [1, 2, 3]
解释: [1, 2, 3] 包含 3 个范围在 1-3 的不同整数， 并且 [1, 1] 中有且仅有 1 个不同整数 : 1

提示:

 n 和 k 满足条件 1 <= k < n <= 104.
 
 */


class Solution {
    func constructArray(_ n: Int, _ k: Int) -> [Int] {
        var nums = [Int]()
        for i in 1...n {
            nums.append(i)
        }
        for i in 0...k {
            if i%2 == 0 {
                // left 1,2,3
                nums[i] = i/2 + 1
            } else {
                // right k,k-1,k-2
                nums[i] = k - i/2 + 1
            }
        }
        return nums
    }
}

let n = 3
let k = 1

// let n = 3
// let k = 2

let ans = Solution().constructArray(n, k)
print("ans = \(ans)")

