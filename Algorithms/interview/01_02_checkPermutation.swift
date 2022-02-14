class Solution {
    func CheckPermutation(_ s1: String, _ s2: String) -> Bool {
        if s1.count != s2.count {
            return false
        }
        if s1 == s2 {
            return true
        }
        var m1 = [Character: Int]()
        for c in Array(s1) {
            if let cnt = m1[c] {
                m1[c] = cnt + 1
            } else {
                m1[c] = 1
            }
        }

        var m2 = [Character: Int]()
        for c in Array(s2) {
            if let cnt = m2[c] {
                m2[c] = cnt + 1
            } else {
                m2[c] = 1
            }
        }
        for k in m1.keys {
            if let cnt2 = m2[k] {
                if cnt2 != m1[k] {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
}

let s1 = "abc"
let s2 = "cba"
let same = Solution().CheckPermutation(s1, s2)
print("same = \(same)")