

class Solution {
    func reverse(_ x: Int) -> Int {
        var flag = 1
        var y = x
        if y < 0 {
            flag = -1
            y = -x
        }
        var ans = 0
        while y > 0 {
            let tail = y % 10
            y = y/10
            ans = ans*10 + tail
        }
        if flag < 0 {
            ans = -ans
        }
        if ans > Int32.max || ans < Int32.min {
            return 0
        }
        return ans
    }
}

// let x = 123
// let x = 120
// let x = -123
// let x = 0
let x = 999999999999999
let ans = Solution().reverse(x)
print("x = \(x), ans = \(ans)")