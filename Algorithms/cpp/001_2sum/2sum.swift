

class Solution2 {
    func findSub(_ nums:[Int], _ sum: Int) -> (Int, Int) {
        var numSet = Set<Int>()
        var numMap = [Int: Int]()
        for (idx,num) in nums.enumerated() {
            numSet.insert(num)
            numMap[num] = idx
        }
        var p1 = -1
        var p2 = -1
        for (idx,num) in nums.enumerated() {
            let d = sum - num
            if numSet.contains(d) {
                p1 = idx
                p2 = numMap[d]!
                break
            }
        }
        return (min(p1, p2), max(p1, p2))
    }
}

let nums = [2, 7, 11, 15]
let sum = 1
let ans = Solution2().findSub(nums, sum)
print("ans = \(ans)")

/********************************************************************************** 
* 
* 
* Given an array of integers, find two numbers such that they add up to a specific target number.
* The function twoSum should return indices of the two numbers such that they add up to the target, 
* where index1 must be less than index2. Please note that your returned answers (both index1 and index2) 
* are not zero-based.
* 
* You may assume that each input would have exactly one solution.
* 
* Input: numbers={2, 7, 11, 15}, target=9
* Output: index1=1, index2=2
* 
*               
**********************************************************************************/

class Solution {
    func twoSum(_ nums:[Int], _ target: Int) -> [Int] {
        var numSet = Set<Int>()
        var numMap = Dictionary<Int,Int>() // num -> idx
        for i in 0..<nums.count {
            let n = nums[i]
            numSet.insert(n)
            numMap[n] = i
        }

        var ans = [Int]()
        
        for i in 0..<nums.count {
            let n = nums[i]
            let left = target - n
            if (numSet.contains(left)) {
                let j = numMap[left]!
                if i > j {
                    ans = [j, i]
                } else {
                    ans = [i, j]
                }
            }
        }        

        return ans
    }
}

let numbers = [2, 7, 11, 15]
// let target = 9
let target = 13
let ans = Solution().twoSum(numbers, target)
print("ans = \(ans)")

