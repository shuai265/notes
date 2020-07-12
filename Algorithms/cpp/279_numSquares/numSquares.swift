
// 会超时
class Solution {
    func numSquares(_ n: Int) -> Int {
        var t = n 
        while t*t>n {
            t -= 1
        }
        var count = Int.max
        // all posible results, like 18: 9+9, 16+1+1
        var nums: [Int] = []
        for i in 1...t {
            nums.append(i*i)
        }
        print("nums=\(nums)")
        
        var results: [[Int]] = []
        var currentRes: [Int] = []

        for i in 0..<nums.count {
            helper(n, nums, i, &currentRes, &results)
        }

        print("\(results)")
        
        for nums in results {
            if nums.count < count {
                count = nums.count
            }
        }
        return count
    }

    func helper(_ target: Int, _ nums: [Int], _ start: Int, _ currentRes: inout [Int], _ results: inout [[Int]]) {
        print("target=\(target), start=\(start), currentRes=\(currentRes)")        
        currentRes.append(nums[start])
        let target = target - nums[start]

        if target == 0 {
            results.append(currentRes)
        } else if target < 0 {
            
        } else if target > 0 {
            for i in start..<nums.count {
                helper(target, nums, i, &currentRes, &results)
            }
        }
        currentRes.removeLast()
    }
}

// 
class Solution2 {
    func numSquares(_ n: Int) -> Int {
        var dp: [Int] = []
        for i in 0...n {
            dp.append(i)
        }
        for i in 1...n {
            var j = 1
            while i-j*j >= 0 {
                dp[i] = min(dp[i], dp[i-j*j]+1)
                j += 1
            }
        }
        // print("dp=\(dp)")
        
        return dp[n]
    }
}

// let ans = Solution().numSquares(5)
let n = 6
// let n = 12
// let n = 150
let ans = Solution().numSquares(n)
print("ans=\(ans)")

let ans2 = Solution2().numSquares(n)
print("ans2=\(ans2)")
