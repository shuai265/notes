class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        // var stack = [Character]()
        let l = 0
        let r = chars.count-1
        return checker(chars, l, r, false)
        
    }

    private func checker(_ chars: [Character], _ left: Int, _ right: Int, _ cutted: Bool) -> Bool {
        var cutted = cutted
        var l = left
        var r = right
        while l < r {
            let lc = chars[l]
            let rc = chars[r]
            // print("l = \(l), lc = \(lc), r = \(r), rc = \(rc)")
            if lc == rc {
                l += 1
                r -= 1
            } else {
                if cutted {
                    return false
                }
                // print("cut")
                cutted = true
                if chars[l+1] == chars[r] && chars[l] == chars[r-1] {
                    return checker(chars, l+1, r, cutted) || checker(chars, l, r-1, cutted) 
                } else if chars[l+1] == chars[r] {
                    l += 1
                } else if chars[l] == chars[r-1] {
                    r -= 1
                } else {
                    return false
                }
            }
        }
        return true
    }
}

// let s = "aguokepatgbnvfqmgmlucu
// let s = "aguokepatgbnvfqmgmlcu
// upuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupu
// culmgmqfvnbgtapekouga"
// let s = "aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga"
// let s = "abc"
// let s = "abcb"
// let s = "abca"
// let s = "deeee"
let isPalindrome = Solution().validPalindrome(s)
print("isPalindrome = \(isPalindrome)")

