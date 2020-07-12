class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var tnums = nums
        for i in 0..<k {
            for j in i..<nums.count {
                if tnums[j] > tnums[i] {
                    swap(&tnums, i, j)
                }
            }
        }
        return tnums[k-1]
    }

    func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        let tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    }
}

class Solution2 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let low = 0
        let high = nums.count-1
        var tmpNums = nums 
        var tmpK = nums.count-k
        quickSortFind(&tmpNums, low, high, tmpK)
        return tmpNums[tmpK]
    }

    func quickSortFind(_ nums: inout [Int], _ left: Int, _ right: Int, _ k: Int) {
        print("find \(nums), \(left), \(right),\(k)")
        
        var l = left
        var r = right
        let val = nums[left]
        while l < r {
            while nums[r] > val {
                r -= 1
            }
            swap(&nums, l, r)
            while nums[l] < val {
                l += 1
            }
            swap(&nums, l, r)
        }
        nums[l] = val
        if l == k {
            return 
        } else if l > k {
            quickSortFind(&nums, left, l-1, k)
        } else if l < k {
            quickSortFind(&nums, l, right, k)
        }
    }

    func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        let tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    }
}

let nums = [3,2,1,5,6,4] 
// let k = 6
let k = 5
let ans = Solution().findKthLargest(nums, k)
print("ans=\(ans)")
let ans2 = Solution2().findKthLargest(nums, k)
print("ans2=\(ans2)")