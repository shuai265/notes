/********************************************************************************** 
* 
* There are two sorted arrays A and B of size m and n respectively. 
* Find the median of the two sorted arrays. 
* The overall run time complexity should be O(log (m+n)).
*               
* nums1 = [1, 3], nums2 = [2], median = 2.0
* nums1 = [1, 2], nums2 = [3, 4], (2 + 3)/2 = 2.5
* 
**********************************************************************************/

/**
 * idea 查找中位数 
 * 二分法
 * [1,2,3,4] [1]
 */

// 二分法
class Solution2 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    }
}

// 查找中位数
// 合并查找 O(m+n)
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let nums = self.merge(nums1, nums2)
        if nums.count == 0 {
            return 0.0
        } else if nums.count%2 == 0 {
            let idx = nums.count/2            
            return Double(nums[idx] + nums[idx-1])/2.0
        } else {
            let idx = nums.count/2
            return Double(nums[idx])
        }
    }

    func merge(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var l1 = 0
        var l2 = 0
        var ans = [Int]()
        while l1 < nums1.count || l2 < nums2.count {
            if l1 < nums1.count && l2 < nums2.count {
                if nums1[l1] < nums2[l2] {
                    ans.append(nums1[l1])
                    l1 += 1
                } else {
                    ans.append(nums2[l2])
                    l2 += 1
                }
            } else {
                while l1 < nums1.count {
                    ans.append(nums1[l1])
                    l1 += 1
                }
                while l2 < nums2.count {
                    ans.append(nums2[l2])
                    l2 += 1
                }
            } 
        }
        return ans
    }
}


let nums1 = [1, 2]
let nums2 = [3, 4]
// let nums1 = [1, 3]
// let nums2 = [2]
// let nums1 = [3,4]
// let nums2:[Int] = []

let ans = Solution().findMedianSortedArrays(nums1, nums2)
print("ans = \(ans)")