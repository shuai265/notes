/**
 * 给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。
 * 
 * 示例 1:
 * 输入: "(()"
 * 输出: 2
 * 解释: 最长有效括号子串为 "()"
 * 
 * 示例 2:
 * 输入: ")()())"
 * 输出: 4
 * 解释: 最长有效括号子串为 "()()"
 */

// 解法1: 生成有效括号，判断字符串中是否contain有效括号，利用二分法降低时间复杂度
class Solution1 {
    func longestValidParentheses(_ s: String) -> Int {
        return 0
    }
}

// 解法2: 循环遍历，掐头去尾， warning 有 bug
class Solution2 {
    func longestValidParentheses(_ s: String) -> Int {
        let s = validStr(s)!
        return s.count
    }

    func validStr(_ s: String) -> String? {
        print("validStr of s = \(s), s.count = \(s.count)")
        if s.count == 0 {
            return s
        }

        if isValid(s) {
            return s
        }

        var result: String? = nil
        if s.count > 1 {
            let subStr1 = String(s.prefix(s.count-1))
            if isValid(subStr1) {
                result = subStr1
            } 
            
            let subStr2 = String(s.suffix(s.count-1))
            if isValid(subStr2) {
                result = subStr2
            }
            if result == nil {
                let s1 = validStr(subStr1)
                let s2 = validStr(subStr2)
                if s1!.count > s2!.count {
                    result = s1
                } else {
                    result = s2
                }
            }
        }
        
        if result == nil {
            result = ""
        }
        return result
    }

    func isValid(_ s: String) -> Bool {
        var i = 0
        for c in s {
            if c == "(" {
                i += 1
            } else {
                i -= 1
            }
            if i<0 {
                return false
            }
        }
        return i == 0
    }
}

// 解法3: 最长子字符串特性-从头开始一定不回出现 ） 比 （ 多的情况，从头遍历，记录上一个错误位置和所有左括号的位置，用当前长度减去上个错误或者上个对应括号（左括号）前的位置
// 有效字符串满足左右括号数相同，当出现这种情况时，计算当前最大长度
class Solution3 {
    func longestValidParentheses(_ s: String) -> Int {
        var max = 0
        var lastError = -1
        var stack: [Int] = []
        for i in 0..<s.count {
            let c = s[s.index(s.startIndex, offsetBy: i)]
            if c == "(" {
                stack.append(i)
            } else {
                if stack.count == 0 {
                    // update lastError position
                    lastError = i
                } else {
                    stack.removeLast()
                    var len = 0
                    if stack.count == 0 { // 更新最大值
                        len = i - lastError
                    } else {
                        len = i - stack[stack.count - 1]
                    }
                    if len > max {
                        max = len
                    }
                }
            }
        }
        return max
    }
}

// let str = "(()()))"
// let str = ")("
// let str = "()"
let str = ")(()(()(((())(((((()()))((((()()(()()())())())()))()()()())(())()()(((()))))()((()))(((())()((()()())((())))(())))())((()())()()((()((())))))((()(((((()((()))(()()(())))((()))()))())"
// let str = ")(("
// var valid = Solution2().isValid(str)
// print("\(valid)")

// var count = Solution2().longestValidParentheses(str)
// print("longest = \(count)")

var count = Solution3().longestValidParentheses(str)
print("longest = \(count)")

// print("\(str[1,str.count])")

