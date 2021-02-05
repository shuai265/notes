/********************************************************************************** 
* 
* Given a string containing just the characters '(', ')', '{', '}', '[' and ']', 
* determine if the input string is valid.
* 
* The brackets must close in the correct order, "()" and "()[]{}" are all valid 
* but "(]" and "([)]" are not.
* 
*               
**********************************************************************************/

class Solution2 {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for char in s {
            if char == Character("(") || char == Character("[") || char == Character("{") {
                stack.append(char)
            } else {
                if stack.count == 0 {
                    stack.append(char)
                } else if stack.last == Character("(") && char == ")" {
                    stack.removeLast()
                } else if stack.last == Character("[") && char == "]" {
                    stack.removeLast()
                } else if stack.last == Character("{") && char == "}" {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
        }
        return stack.count == 0
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count == 0 {
            return true
        }
        
        let leftList = ["{", "[", "("]
        let rightList = ["}", "]", ")"]
        var idxList: [Int] = []

        for c in s {
            if leftList.contains(String(c)) {
                idxList.append(leftList.firstIndex(of: String(c))!)
            }
            if rightList.contains(String(c)) {
                if idxList.count == 0 {
                    return false
                }
                let rightIdx = rightList.firstIndex(of: String(c))
                if idxList[idxList.count-1] == rightIdx {
                    idxList.removeLast()
                } else {
                    return false
                }
            }
        }
        if idxList.count == 0 {
            return true 
        } else {
            return false
        }
    }
}

// let input = "()[]{}"
// let input = "(]"
let input = "([)]"

// if Solution().isValid(input) {
//     print("true")
// } else {
//     print("false")
// }

var ans1 = Solution().isValid(input)
print("ans1 = \(ans1)")

var ans2 = Solution2().isValid(input)
print("ans2 = \(ans2)")