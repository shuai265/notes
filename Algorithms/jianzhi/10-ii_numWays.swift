
// 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。
// 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
// 链接：https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof

// 递归
class Solution {
    func numWays(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        return (numWays(n-1) + numWays(n-2))%1000000007
    }
}

// 递归 + cache
class Solution2 {
    func numWays(_ n: Int) -> Int {
        var cache = [Int: Int]()
        return helper(n, &cache)
    }

    func helper(_ n: Int, _ cache: inout [Int: Int]) -> Int {
        if n <= 1 {
            return 1
        }
        if let cnt = cache[n] {
            return cnt
        }
        let ans = (numWays(n-1) + numWays(n-2))%1000000007
        cache[n] = ans 
        return ans
    }
}

// 动态规划
class Solution3 {
    func numWays(_ n: Int) -> Int {
        print("n = \(n)")
        if n <= 1 {
            return 1
        }
        var a = 1
        var b = 1
        var sum = 1
        var i = 1
        while i < n {
            a = b
            b = sum
            sum = (a + b) % 1000000007
            i += 1
        }
        return sum 
    }
}

let n = 44
// let n = 7
// let s1 = Solution().numWays(n)
// let s2 = Solution2().numWays(n)
let s3 = Solution3().numWays(n)
// print("s1 = \(s1), s2 = \(s2), s3 = \(s3)")
print("s3 = \(s3)")