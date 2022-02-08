// Source : https://oj.leetcode.com/problems/remove-duplicates-from-sorted-array/
// Author : Hao Chen
// Date   : 2014-06-22
// https://github.com/haoel/leetcode/blob/master/algorithms/cpp/removeDuplicatesFromSortedArray/removeDuplicatesFromSortedArray.cpp
// https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/

/********************************************************************************** 
* 
* Given a sorted array, remove the duplicates in place such that each element appear 
* only once and return the new length.
* 
* Do not allocate extra space for another array, you must do this in place with constant memory.
* 
* For example,
* Given input array A = [1,1,2],
* 
* Your function should return length = 2, and A is now [1,2].
* 
*               
**********************************************************************************/


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var pre = Int.max
        var i = nums.count-1
        while i >= 0 {
            if nums[i] == pre {
                nums.remove(at: i)
            } else {
                pre = nums[i]
            }
            i -= 1
        }
        return nums.count
    }
}

class Solution2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        for i in (0..<nums.count).reversed() {
            // print("i = \(i)")
            if i > 0 && nums[i] == nums[i-1] {
                // print("delete nums[i] = \(nums[i]), i = \(i)")
                nums.remove(at: i)
            }
        }
        return nums.count
    }
}

 var nums = [1,2,3,4,4,5,5]
// var nums = [1,2,3,4,4,5]
// var nums = [1,2,3,4,4,5,6]
print("before \(nums), length = \(nums.count)")

// let newLen = Solution().removeDuplicates(&nums)
let newLen = Solution2().removeDuplicates(&nums)
print("after \(nums), length = \(newLen)")
