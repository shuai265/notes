class Solution {
    func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
        if k == 1 {
            return 0
        }
        let sortedNums = popSort(nums)
        var min = Int.max
        for i in k-1..<sortedNums.count {
            let d = sortedNums[i-k+1] - sortedNums[i] 
            if d < min {
                min = d
            }
        }
        return min
    }

    func popSort(_ nums: [Int]) -> [Int] {
        var ns = nums
        for i in 0..<ns.count {
            for j in i+1..<ns.count {
                if ns[i] < ns[j] {
                    swap(&ns, i, j)
                }
            }
        }
        print("ns = \(ns)")
        return ns
    }

    func swap(_ nums: inout [Int], _ l: Int, _ r: Int) {
        let tmp = nums[l]
        nums[l] = nums[r]
        nums[r] = tmp
    }
}

let nums = [9,4,1,7]
let k = 2
let min = Solution().minimumDifference(nums, k)
print("min = \(min)")