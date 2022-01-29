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
    // let str = "bbbabab"
    let str = "ccc"

    let result = Solution().longestPalindrome(str)

    print("result \(result)")
}

main()


class Solution2 {
    func longestPalindrome(_ s: String) -> String {
        let characters = Array(s)
        var ans = Array<Character>()

        for i in 0..<characters.count {
            let char = characters[i]
            // calc char center
            // step = 1
            var subChars = getMaxLongestSubArray(characters, i, false)
            if subChars.count > ans.count {
                ans = subChars
            }
            // calc char & char+1 center 
            if (i < characters.count-1 && char == characters[i+1]) {
                subChars = getMaxLongestSubArray(characters, i, true)
                if subChars.count > ans.count {
                    ans = subChars
                }
            }
        }
        return String(ans)
    }

    private func getMaxLongestSubArray(_ characters: Array<Character>, _ idx: Int, _ isDouble: Bool) -> Array<Character> {
        // print("chars = \(characters), idx = \(idx), isDouble = \(isDouble)")
        var left = idx-1
        var right = idx+1
        var ans = [characters[idx]]
        if isDouble {
            right += 1
            ans.append(characters[idx+1])
        }
        while left >= 0 && right < characters.count {
            let lc = characters[left]
            let rc = characters[right]
            // print("lc = \(lc), rc = \(rc), lc==rc is \(lc==rc)")
            if lc == rc {
                ans.insert(lc, at: 0)
                ans.append(lc)
            } else {
                break
            }
            left -= 1
            right += 1
        }
        return ans
    }
}

// let str = "babad"
// let str = "bbbabab"
let str = "ccc"
let ans = Solution2().longestPalindrome(str)
print("ans = \(ans)")