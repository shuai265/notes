
// https://leetcode-cn.com/problems/implement-strstr/

// Source : https://oj.leetcode.com/problems/implement-strstr/
/********************************************************************************** 
* 
* Implement strStr().
* 
* Returns a pointer to the first occurrence of needle in haystack, or null if needle is not part of haystack.
* 
*               
**********************************************************************************/



/*
实现 strStr() 函数。

给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。

示例 1:

输入: haystack = "hello", needle = "ll"
输出: 2
示例 2:

输入: haystack = "aaaaa", needle = "bba"
输出: -1
*/

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0
        }
        if haystack.count < needle.count {
            return -1
        }
        let hayChars = Array(haystack)
        let needChars = Array(needle)
        for (idx, char) in hayChars.enumerated() {
            if hayChars.count - idx < needChars.count {
                break
            }
            print("char = \(char), needChars[0] = \(needChars[0])")
            if char == needChars[0] {
                print("start match")
                var match = true
                for (j, c) in needChars.enumerated() {
                    print("idx+j = \(idx+j),hayChars[idx+j] = \(hayChars[idx+j]), c = \(c)")
                    
                    if hayChars[idx+j] != c {
                        match = false
                        break
                    }
                }
                if match {
                    return idx
                }
            }
        }
        return -1
    }
}

let haystack = "hello"
let needle = "ll"
let ans = Solution().strStr(haystack, needle)
print("ans = \(ans)")