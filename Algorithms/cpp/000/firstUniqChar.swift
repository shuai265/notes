class Solution {
    func firstUniqChar(_ s: String) -> Character {
        if s.count == 0 {
            return Character(" ")
        }
        var charSet = Set<Character>()
        var dumSet = Set<Character>()
        for c in Array(s) {
            if charSet.contains(c) {
                dumSet.insert(c)
            } else {
                charSet.insert(c)
            }
        }
        for c in Array(s) {
            if !dumSet.contains(c) {
                return c
            }
        }
        return Character(" ")
    }
}

let s = ""
let c = Solution().firstUniqChar(s)
print("c = \(c)")