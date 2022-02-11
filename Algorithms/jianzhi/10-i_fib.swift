// 递归
class Solution {
    func fib(_ n: Int) -> Int {
        var cache = [Int: Int]()
        return helper(n, &cache)
    }

    func helper(_ n: Int, _ cache: inout [Int: Int]) -> Int {
        if n <= 1 {
            return n
        }
        if let ans = cache[n] {
            return ans
        }
        var ans = helper(n-1, &cache) + helper(n-2, &cache)
        if ans > 1000000007 {
            ans = ans % 1000000007
        }
        cache[n] = ans
        return ans
    }
}

// 动态规划
class Solution2 {
    func fib(_ n: Int) -> Int {
        var a = 0
        var b = 1
        var sum = 0
        var i = 0
        while i < n {
            a = b
            b = sum
            sum = (a+b) % 1000000007
            i += 1
        }
        return sum
    }
}

let n = 96
let ans1 = Solution().fib(n)
let ans2 = Solution2().fib(n)
print("ans1 = \(ans1), ans2 = \(ans2)")