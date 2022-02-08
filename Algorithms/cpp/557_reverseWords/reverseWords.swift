class Solution {
    func reverseWords(_ s: String) -> String {
        var chars = Array(s)
        var left = 0
        var right = 0
        for (idx, char) in chars.enumerated() {
            print("idx = \(idx), char = \(char), left = \(left), right = \(right)")
            if right == chars.count-1 {
                reverse(&chars, left, right)
            } else if char == Character(" ") {
                reverse(&chars, left, right-1)
                left = idx+1
                right = idx+1
            } else {
                right += 1
            }
        }
        return String(chars)
    }

    private func reverse(_ s: inout [Character], _ left: Int, _ right: Int) {
        print("l = \(left), right = \(right)")
        var l = left
        var r = right
        while l < r {
            let tmp = s[l]
            s[l] = s[r]
            s[r] = tmp
            l += 1 
            r -= 1
        }
    }
}

let s = "Let's take LeetCode contest"
let ans = Solution().reverseWords(s)
print("ans = [\(ans)]")