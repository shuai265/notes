/**
 * 实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
 * 
 * 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
 * 
 * 必须原地修改，只允许使用额外常数空间。
 * 
 * 以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
 * 1,2,3 → 1,3,2
 * 3,2,1 → 1,2,3
 * 1,1,5 → 1,5,1
 */
/*
class Solution {
    func nextPermutation(_ nums: inout [Int]) {

        var swapIdx = -1

        for i in (0..<nums.count).reversed() {
            if i-1 >= 0, nums[i] > nums[i-1] {
                swapIdx = i-1
                break
            }
        }
        print("swapIdx = \(swapIdx)")
        
        
        if swapIdx >= 0 {
            for j in (swapIdx+1..<nums.count).reversed() {
                if nums[j] > nums[swapIdx] {
                    print("j = \(j)")
                    
                    swap(&nums, swapIdx, j)
                    sortArray(&nums, swapIdx+1)
                    break
                }
            }
        } else {
            reverseArray(&nums)
        }
    }

    func swap(_ nums: inout [Int], _ l: Int, _ r: Int) {
        let val = nums[l]
        nums[l] = nums[r]
        nums[r] = val
    }

    func reverseArray(_ nums: inout [Int]) {
        for i in (0..<nums.count/2) {
            swap(&nums, i, nums.count-1-i)
        }
    }

    func sortArray(_ nums: inout [Int], _ start: Int) {
        for i in 0..<nums.count-1-start {
            for j in start..<nums.count-1-i {
                if nums[j] > nums[j+1] {
                    swap(&nums, j, j+1)
                }
            }
        }
    }
}
*/
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        var resortNums: [Int] = [nums.last!]
        var foundCorner = false

        for i in (0..<nums.count-1).reversed() {
            let num = nums[i]
            let last = resortNums.last!
            resortNums.append(num)
            if num < last {
                // find node
                foundCorner = true
                break
            }
        }
        // print("resortNums = \(resortNums)")
        // resort
        if foundCorner {
            let head = resortNums.last!
            resortNums.removeLast()
            for i in 0..<resortNums.count {
                if resortNums[i] > head {
                    // print("do switch i=\(i), head = \(head), num=\(resortNums[i])")
                    let tmp = resortNums[i]
                    resortNums[i] = head
                    resortNums.reverse()
                    resortNums.append(tmp)
                    break
                }
            }
        } else {
            resortNums.reverse()
        }

        // print("resortNums = \(resortNums)")
        let totalCnt = nums.count
        for i in 0..<resortNums.count {
            nums[totalCnt-i-1] = resortNums[i]
        }
    }
}

// var nums = [1,2,3,4]
// var nums = [1,3,2]
// var nums = [3,2,1]
// var nums = [1,2,3]
// var nums = [1,1,5]
// var nums = [1]
var nums = [1,3,2]

// print("\(nums)")
// Solution().reverseArray(&nums)
// print("\(nums)")

// Solution().sortArray(&nums, 4)
// print("\(nums)")

for _ in 0...0 {
    print("pre \(nums)")
    Solution().nextPermutation(&nums)
    print("after \(nums)")
}

