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
        let str: String = ""
        generate(n, n, &result, str)
        return result
    }

    func generate(_ l: Int, _ r: Int, _ result: inout [String], _ str: String) {
        if l==0, r==0 {
            result.append(str)
        }
        
        if (l > 0) {
            generate(l-1, r, &result, str+"(")
        }
        if (r>l) {
            generate(l, r-1, &result, str+")")
        }
    }
}


let r = Solution().generateParenthesis(3)
print("\(r)")


class Solution4 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result:[Int] = []
        var map: [Int: Int] = [:]
        for i in 0..<nums.count {            
            if map.keys.contains(nums[i]) {
                result.append(map[nums[i]]!)
                result.append(i)
            } else {
                let delta = target - nums[i]
                map[delta] = i
            }
        }
        return result 
    }
}


let d = [-10,-1,-18,-19]
let t = -19

// let d = [3,2,4]
// let t = 6

let re = Solution4().twoSum(d, t)
print("re = \(re)")
