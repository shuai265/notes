class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var tmp: [Int] = []
        for num in nums {
            if num != 0 {
                tmp.append(num)
            }
        }
        for (idx,num) in tmp.enumerated() {
            nums[idx] = num
        }
        if tmp.count < nums.count {
            for i in tmp.count..<nums.count {
                nums[i] = 0
            }
        }
    }
}

// 不拷贝额外数组
class Solution2 {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroCnt = 0
        for (idx,num) in nums.enumerated() {
            if num != 0 {
                nums[idx-zeroCnt] = num
            } else {
                zeroCnt += 1
            }
        }
        if zeroCnt > 0 {
            for i in nums.count-zeroCnt..<nums.count {
                nums[i] = 0
            }
        }
    }
}

var nums = [0,1,0,3,12]
// var nums = [0]
// var nums = [1]
// var nums: [Int] = []
print("\(nums)")
// Solution().moveZeroes(&nums)
Solution2().moveZeroes(&nums)
print("\(nums)")
