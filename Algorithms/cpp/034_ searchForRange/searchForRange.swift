/********************************************************************************** 
* 
* Given a sorted array of integers, find the starting and ending position of a given target value.
* 
* Your algorithm's runtime complexity must be in the order of O(log n).
* 
* If the target is not found in the array, return [-1, -1].
* 
* For example,
* Given [5, 7, 7, 8, 8, 10] and target value 8,
* return [3, 4].
* 
*               
**********************************************************************************/


class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [-1, -1]
        if nums.count == 0 {
            return result
        }
        let low = binarySearchLeft(nums, target)
        let high = binarySearchRight(nums, target)
        if nums[low] != target {
            return result
        } else {
            result = [low, high]
        }
        return result 
    }

    func binarySearchLeft(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count-1
        var mid = (low+high)/2
        while (low < high) {
            // print("l \(mid)")
            if (target == nums[mid]) {
                high = mid
            } else if (target > nums[mid]) {
                low = mid+1
            } else if (target < nums[mid]) {
                high = mid
            }
            mid = (low+high)/2
        }
        return low
    }

    func binarySearchRight(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count-1
        var mid = (low+high)/2
        while (low <= high) {
            // print("\(mid), l = \(low), high = \(high)")
            if nums[mid] == target {
                low = mid + 1
            } else if nums[mid] > target {
                high = mid - 1
            } else if nums[mid] < target {
                low = mid + 1
            }
            mid = (low+high)/2
        }
        return low-1
    }
}

let nums = [5,7,7,8,8,10]
// let nums = [2, 2]
// let target = 3
// let target = 2
let target = 8

let result = Solution().searchRange(nums, target)
print("\(result)")
