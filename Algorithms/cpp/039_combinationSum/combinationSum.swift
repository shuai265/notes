/**
 * 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 * candidates 中的数字可以无限制重复被选取。
 * 
 * 说明：
 * 所有数字（包括 target）都是正整数。
 * 解集不能包含重复的组合。 
 * 示例 1:
 * 
 * 输入: candidates = [2,3,6,7], target = 7,
 * 所求解集为:
 * [
 *   [7],
 *   [2,2,3]
 * ]
 * 示例 2:
 * 
 * 输入: candidates = [2,3,5], target = 8,
 * 所求解集为:
 * [
 *   [2,2,2,2],
 *   [2,3,3],
 *   [3,5]
 * ]
 */

// SOLUTION1
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        var sortedCandidates = candidates 
        sortedCandidates.sort()

        var solution: [Int] = []
        var result: [[Int]] = []
        combinationSumHelper(sortedCandidates, target, &solution, &result)
        return result
    }

    func combinationSumHelper(_ candidates: [Int], _ target: Int, _ solution: inout [Int], _ result: inout [[Int]]) {
        if target < 0 {
            return
        }
        if target == 0 {
            result.append(solution)
            return
        }
        // for (index,num) in candidates.enumerated() {
        for num in candidates {
            if solution.count > 0, num < solution[solution.count-1] {
                continue
            }
            solution.append(num)
            combinationSumHelper(candidates, target-num, &solution, &result)
            solution.removeLast()
        }
    }
}

// let candidates = [2,3,6,7]
// let target = 7

// let candidates = [2,3,5]
// let target = 8

let candidates = [1,5,11]
let target = 15

let result = Solution().combinationSum(candidates, target)
print("\(result)")
