class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 1 {
            return true
        }
        var m = n
        while m >= 2 {
            if m%2 == 1 {
                return false
            }
            m /= 2
        }
        print("m = \(m)")
        return true
    }
}

// let num = 16
let num = 6
let isPower = Solution().isPowerOfTwo(num)
print("num = \(num), is power = \(isPower)")