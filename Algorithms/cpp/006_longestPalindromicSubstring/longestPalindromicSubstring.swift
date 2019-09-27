/********************************************************************************** 
* 
* Given a string S, find the longest palindromic substring in S. 
* You may assume that the maximum length of S is 1000, 
* and there exists one unique longest palindromic substring.
*               
**********************************************************************************/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        var result: [Character] = []
        var tmpResult: [Character] = []
        for i in 1..<s.count-1 {
            let idx = s.index(s.startIndex, offsetBy: i)
            var offset = 1
            var pre = s.index(idx, offsetBy: -offset)
            var after = s.index(idx, offsetBy: offset)
            var preChar = s[pre]
            let currentChar = s[idx]
            var afterChar = s[after]
            tmpResult = []

            if (preChar == afterChar) {
                tmpResult.append(currentChar)
                while (preChar == afterChar) {
                    tmpResult.insert(preChar, at:0)
                    tmpResult.append(afterChar)
                    offset = offset + 1
                    if (i-offset>=0 && i+offset<s.count) {
                        pre = s.index(idx, offsetBy: -offset)
                        after = s.index(idx, offsetBy: offset)
                        preChar = s[pre]
                        afterChar = s[after]
                    } else {
                        break
                    }
                }
            } else if (preChar == currentChar) {
                afterChar = currentChar
                while (preChar == afterChar) {
                    tmpResult.insert(preChar, at:0)
                    tmpResult.append(afterChar)
                    offset = offset + 1
                    if (i-offset>=0 && i+offset<s.count) {
                        pre = s.index(idx, offsetBy: -offset)
                        after = s.index(idx, offsetBy: offset-1)
                        preChar = s[pre]
                        afterChar = s[after]
                    } else {
                        break
                    }
                }
            } 
            if tmpResult.count > result.count {
                result = tmpResult
            }
        }
        return String(result)
    }
}

func main() {
    // let str = "babad"
    let str = "bbbabab"

    let result = Solution().longestPalindrome(str)

    print("result \(result)")
}

main()