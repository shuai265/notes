/********************************************************************************** 
* 
* Given a string, find the length of the longest substring without repeating characters. 
* For example, the longest substring without repeating letters for "abcabcbb" is "abc", 
* which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.
*               
**********************************************************************************/

/** idea 
 * 利用 set 把已经存在的保存起来, 从前往后找, 如果没有出现过就保存, 并且长度加一
 * 当遇到重复的时候, 拿当前长度对比已有长度, 比较是否需要更新
 */

import Foundation

// 算法的时间复杂度:O(n^2)
func findLongestSubstringWithoutRepeatingCharacters(_ str: String) -> Int {
    var max = 1
    for i in 0..<str.count {
        var tMax = 1
        var tSet = Set<Character>()
        tSet.insert(str[str.index(str.startIndex, offsetBy: i)])
        
        for j in (i+1)..<str.count {
            let c = str[str.index(str.startIndex, offsetBy: j)]
            if tSet.contains(c) {
                break
            } else {
                tSet.insert(c)
                tMax = tMax + 1
            }
        }
        if tMax > max {
            max = tMax
        }
    }
    return max
}

/**
 *  O(n) 的解法
 * 把每个 char 的 idx 都保存起来, 当遇到重复的字符出现, 计算当前重复字符串‘中间’最长无重复字符串
 * 计算两个重复字符串之间的最长无重复字符串不是把这两个 idx 相减,而是用后者的 idx 减去上次 repeat 出现的 idx
 * 重复值a2出现需要做的事情:
 * 1.计算当前最大无重复长度, 和之前的值做对比
 * 2.如果 a1 的 idx 比 lastRepeatIdx 小(即 a1 没有在 idx 后面, 没有重复的问题) 此时不需要更新 lastRepeatIdx
 */
func findLongestSubstringWithoutRepeatingCharacters2(_ str: String) -> Int {
    var max = 1
    var dict = [Character: Int]()
    var lastRepeatIdx = 0
    for i in 0..<str.count {
        let c = str[str.index(str.startIndex, offsetBy: i)]
        if dict.keys.contains(c) {
            let tMax = i - lastRepeatIdx
            if tMax > max {
                max = tMax
            }
            if dict[c]! > lastRepeatIdx {
                lastRepeatIdx = i
            }
        } else {
            dict[c] = i
        }
    }
    return max 
}


func main() {
    // let str = "abcabcbb"
    // let str = "bbbb"
    let str = "abcdeffqwerasdf"

    let start_1 = Date().timeIntervalSince1970
    for _ in 0...1000 {
        let max = findLongestSubstringWithoutRepeatingCharacters(str)
    }
    let end_1 = Date().timeIntervalSince1970
    print("time use = \(end_1 - start_1)")
    
    let start_2 = Date().timeIntervalSince1970
    for _ in 0...1000 {
        let max = findLongestSubstringWithoutRepeatingCharacters2(str)
    }
    let end_2 = Date().timeIntervalSince1970
    print("time use = \(end_2 - start_2)")

    // print("max = \(max)")
}

main()
