// f(n,k) = n*f(n-1, k-1) + f(n-k, k)
class Solution2 {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        if k == 1 {
            for i in 1...n {
                ans.append([i])
            }
            return ans
        }

        var pool = [Int]()
        for i in 1...n {
            pool.append(i)
        }
        if n == k {
            return [pool]
        }

        let sub = combine(n-1, k-1)
        for ns in sub {
            ans.append([n] + ns)
        }

        ans += combine(n-1, k)

        return ans
    }
}


let n = 4
let k = 3
// let n = 1
// let k = 1
// let ans = Solution().combine(n, k)
let ans = Solution2().combine(n, k)
print("ans = \(ans)")
