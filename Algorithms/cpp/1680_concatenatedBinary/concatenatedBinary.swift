class Solution {
    func concatenatedBinary(_ n: Int) -> Int {
        var fullBin = ""
        for i in 1...n {
            // print("i = \(i), bin = \(binFromInt(i))")
            fullBin += binFromInt(i)
        }
        var ans = 0
        var step = 1
        let chars = Array(fullBin)
        // print("chars = \(chars)")
        // 1001 
        for i in (0..<chars.count).reversed() {
            let char = chars[i]
            if char == Character("1") {
                ans += 1 * step
            } else {
                // continue
            }
            step = step * 2
        }
        return ans%1000000007
    }

    func binFromInt(_ n: Int) -> String {
        var str = ""
        var m = n
        while m > 0 {
            str = String(m%2)+str
            m = m/2
        }
        return str
    }
}

let n = 12
let ans = Solution().concatenatedBinary(n)
print("ans = \(ans)")