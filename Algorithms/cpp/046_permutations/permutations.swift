/********************************************************************************** 
* 
* Given a collection of numbers, return all possible permutations.
* 
* For example,
* [1,2,3] have the following permutations:
* [1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2], and [3,2,1].
* 
*               
**********************************************************************************/
/** no repeat nums in given numbers */

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        for num in nums {
            var tmpResult: [[Int]] = []
            for list in result {
                // print("origin result = \(result)")
                for i in (0...list.count).reversed() {
                    var newList = list
                    newList.insert(num, at:i)
                    tmpResult.append(newList)
                }
            }
            result = tmpResult
            // print("new result = \(result)")
            if result.count == 0 {
                result.append([num])
            }
        }
        return result
    }
}


let nums = [1,2,3]
let ans = Solution().permute(nums)
print("\(ans)")
