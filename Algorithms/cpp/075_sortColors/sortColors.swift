/**
 * 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
 * 
 * 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
 * 
 * 注意:
 * 不能使用代码库中的排序函数来解决这道题。
 * 
 * 示例:
 * 输入: [2,0,2,1,1,0]
 * 输出: [0,0,1,1,2,2]
 * 
 * 进阶：
 * 一个直观的解决方案是使用计数排序的两趟扫描算法。
 * 首先，迭代计算出0、1 和 2 元素的个数，然后按照0、1、2的排序，重写当前数组。
 * 你能想出一个仅使用常数空间的一趟扫描算法吗？
 */

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var zero: [Int] = []
        var one: [Int] = []
        var two: [Int] = []
        for num in nums {
            if num == 0 {
                zero.append(num)
            } else if num == 1 {
                one.append(num)
            } else {
                two.append(num)
            }
        }
        for i in 0..<zero.count {
            nums[i] = 0
        }
        for i in zero.count..<zero.count+one.count {
            nums[i] = 1
        }
        for i in zero.count+one.count..<zero.count+one.count+two.count {
            nums[i] = 2
        }
    }
}

class Solution2 {
    func sortColors(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count-1
        var i = 0
        while (left < right && i<=right) {
            print("i=\(i),l=\(left),r=\(right),nums=\(nums)")
            if nums[i] > nums[right] {
                swap(&nums, i, right)
            }
            if i<=right, nums[i] < nums[left] {                
                swap(&nums, left, i)
            }
            i += 1
            while (left<=right && nums[left] == 0) {
                left += 1
                i = left
            }
            while (right>=0 && nums[right] == 2) {
                right -= 1
            }
            print("after i=\(i),l=\(left),r=\(right),nums=\(nums)")
        }
    }
    func swap(_ nums: inout [Int], _ l: Int, _ r: Int) {        
        let val = nums[l]
        nums[l] = nums[r]
        nums[r] = val
    }
}

// var nums = [2,0,2,1,1,0]
// print("origin = \(nums)")

// Solution().sortColors(&nums)
// print("\(nums)")

var nums2 = [2,0,2,1,1,0]
// var nums2 = [2,2,0]
// var nums2 = [0,0]
// var nums2 = [0,2,1]
// var nums2 = [1,2,1]
// var nums2 = [0,2,2,2,0,2,1,1]
// var nums2 = [2,0,1]
Solution2().sortColors(&nums2)
print("\(nums2)")