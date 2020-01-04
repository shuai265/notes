/********************************************************************************** 
* 
* Given a set of distinct integers, S, return all possible subsets.
* 
* Note:
* 
* Elements in a subset must be in non-descending order.
* The solution set must not contain duplicate subsets.
* 
* For example,
* If S = [1,2,3], a solution is:
* 
* [
*   [3],
*   [1],
*   [2],
*   [1,2,3],
*   [1,3],
*   [2,3],
*   [1,2],
*   []
* ]
* 
*               
**********************************************************************************/

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        var current: [Int] = []
        subsetHelper(nums, 0, &current, &ans)
        return ans
    }
    func subsetHelper(_ nums: [Int], _ idx: Int, _ current: inout [Int], _ ans: inout [[Int]]) {
        ans.append(current)
        if idx >= nums.count {
            return
        }
        for i in idx..<nums.count {
            current.append(nums[i])
            subsetHelper(nums, i+1, &current, &ans)
            current.removeLast()
        }
    }
}

let nums = [1,2,3]
let ans = Solution().subsets(nums) 
print("\(ans)")
