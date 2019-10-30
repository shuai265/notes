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
                    // print("not equal, tmp=\(tmp[tmp.index(before: tmp.endIndex)]), c = \(c)")
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
let input = "(]"

if Solution().isValid(input) {
    print("true")
} else {
    print("false")
}