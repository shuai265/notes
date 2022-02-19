class Solution {
    func minPartitions(_ n: String) -> Int {
        var cnt = 0
        for c in Array(n) {
            if c.wholeNumberValue! > cnt {
                cnt = c.wholeNumberValue!
            }
        }
        return cnt
    }
}

// let n = 32 
// let n = "82734"
let n = "27346209830709182346"
let ans = Solution().minPartitions(String(n))
print("ans = \(ans)")
