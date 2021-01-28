
/**
 * https://leetcode-cn.com/problems/edit-distance/
 * 给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。

你可以对一个单词进行如下三种操作：
插入一个字符
删除一个字符
替换一个字符
 
示例 1：
输入：word1 = "horse", word2 = "ros"
输出：3
解释：
horse -> rorse (将 'h' 替换为 'r')
rorse -> rose (删除 'r')
rose -> ros (删除 'e')
示例 2：

输入：word1 = "intention", word2 = "execution"
输出：5
解释：
intention -> inention (删除 't')
inention -> enention (将 'i' 替换为 'e')
enention -> exention (将 'n' 替换为 'x')
exention -> exection (将 'n' 替换为 'c')
exection -> execution (插入 'u')
 
提示：
0 <= word1.length, word2.length <= 500
word1 和 word2 由小写英文字母组成
 */


class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        // TODO:: 存储结果
        var resMap = [String: Int]() // i_j: min
        // var ans = max(word1.count, word2.count)
        let ans = helper(word1, word2, 0, 0, 0, &resMap)
        return ans
    }

    func helper(_ word1: String, _ word2: String, _ s1: Int, _ s2: Int, _ preCount: Int, _ resMap: inout [String: Int]) -> Int {
        if word1.count == 0 || word2.count == 0 {
            return max(word1.count, word2.count)
        }
        var minStep = preCount + max(word1.count-s1, word2.count-s2)
        
        // let currentKey = "\(s1)_\(s2)"

        for i in s1..<word1.count {
            let idx1 = word1.index(word1.startIndex, offsetBy: i)
            let char1 = word1[idx1]

            for j in s2..<word2.count {
                let char2 = word2[word2.index(word2.startIndex, offsetBy: j)]

                if char1 == char2 {
                    // let nWord1 = word1.suffix(from: word1.index(word1.startIndex, offsetBy: i+1))
                    // let nWord2 = word2.suffix(from: word2.index(word2.startIndex, offsetBy: j+1))
                    // print("nWord1 = \(nWord1), nWord2 = \(nWord2)")
                    // let min = max(i, j) + minDistance(String(nWord1), String(nWord2))
                    let newPreCnt = preCount + max(i-s1, j-s2)
                    var min = newPreCnt
                    let nextKey = "\(i+1)_\(j+1)"
                    if resMap.keys.contains(nextKey) {
                        min += resMap[nextKey]!
                    } else {
                        min += helper(word1, word2, newPreCnt, i+1, j+1, &resMap)
                    }
                    if minStep > min {
                        minStep = min
                    }
                }
            }
        }
        resMap["\(s1)_\(s2)"] = minStep
        return minStep
    }
}

// let w1 = "intention"
// let w2 = "execution"

let w1 = "horse"
let w2 = "ros"

// let w1 = "a"
// let w2 = "b"

// let w1 = "pneumonoultramicroscopicsilicovolcanoconiosis"
// let w2 = "ultramicroscopically"

let ans = Solution().minDistance(w1, w2)
print("ans = \(ans)")