class Solution {
    func reverseBits(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var bin = intToBin(n)
        bin = String(bin.reversed())
        return binToInt(bin)
    }

    private func intToBin(_ n: Int) -> String {
        var m = n 
        var ans = ""
        while m > 0 {
            ans = String(m%2) + ans
            m /= 2
        }
        while ans.count < 32 {
            ans = "0" + ans
        }
        return ans
    }

    private func binToInt(_ s: String) -> Int {
        let chars = Array(s)
        var ans = 0
        var step = 1
        for c in chars.reversed() {
            if c == Character("1") {
                ans += step
            }
            step *= 2
        }
        return ans
    }
}


// let n = 43261596
let n = 4294967293
let ans = Solution().reverseBits(n)
print("ans = \(ans)")