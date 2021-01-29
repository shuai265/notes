
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


// 方法一：递归

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var cacheMap = [String: Int]() // i_j: min
        let min = helper(word1, word2, 0, 0, &cacheMap)
        // print("cacheMap = \(cacheMap)")
        return min
    }

    func helper(_ word1: String, 
                    _ word2: String, 
                    _ s1: Int, 
                    _ s2: Int, 
                    _ cacheMap: inout [String: Int]) -> Int 
    {
        // print("start with s1:\(s1), s2:\(s2)")
        var minStep = max(word1.count-s1, word2.count-s2)

        if word1.count == 0 || word2.count == 0 || s1>=word1.count || s2>=word2.count {
            return minStep
        }
        
        for i in s1..<word1.count {
            if i-s1 > minStep {
                break
            }
            let char1 = word1[word1.index(word1.startIndex, offsetBy: i)]
            for j in s2..<word2.count {
                if j-s2 > minStep {
                    break
                }

                let char2 = word2[word2.index(word2.startIndex, offsetBy: j)]
                if char1 == char2 {
                    var min = max(i-s1, j-s2)
                    let nextKey = "\(i+1)_\(j+1)"
                    if cacheMap.keys.contains(nextKey) {
                        min += cacheMap[nextKey]!
                    } else {
                        min += helper(word1, word2, i+1, j+1, &cacheMap)
                    }
                    if minStep > min {
                        minStep = min
                    }
                }
            }
        }
        cacheMap["\(s1)_\(s2)"] = minStep
        return minStep
    }
}

// 方法二： 动态规划
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
    }
}

// let w1 = "intention"
// let w2 = "execution"

// let w1 = "horse"
// let w2 = "ros"

// let w1 = "a"
// let w2 = "b"

// let w1 = "pneumonoultramicroscopicsilicovolcanoconiosis"
// let w2 = "ultramicroscopically"

let w1 = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdef"
let w2 = "bcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefg"

let ans = Solution().minDistance(w1, w2)
print("ans = \(ans)")