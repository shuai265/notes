/********************************************************************************** 
* 
* Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
* 
* For example, given n = 3, a solution set is:
* 
* "((()))", "(()())", "(())()", "()(())", "()()()"
* 
*               
**********************************************************************************/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        result = []

        // var l = n
        // var r = n
        // let substr = self.generateParenthesis(n-1)
        for i in 0..<n-1 {
            // var t = i 
            print("i=\(i)")
            
        }

        return result
    }
}