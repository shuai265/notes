class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 1 {
            return strs[0]
        }
        var prefix = strs[0]
        for i in 1..<strs.count {
            prefix = _prefix(prefix, strs[i])
        }
        return prefix
    }

    private func _prefix(_ str1: String, _ str2: String) -> String {
        print("str1 \(str1), str2 \(str2)")
        var prefix = [Character]()
        let chars1 = Array(str1)
        let chars2 = Array(str2)
        for i in 0..<min(chars1.count, chars2.count) {
            if chars1[i]==chars2[i] {
                prefix.append(chars1[i])
            } else {
                break
            }
        }
        return String(prefix)
    }
}

// let strs = ["flower","flow","flight"]
let strs = ["cir","car"]
let prefix = Solution().longestCommonPrefix(strs)
print("prefix = \(prefix)")
