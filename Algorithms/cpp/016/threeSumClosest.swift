class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 3 {
            var total = 0
            for (_, num) in nums.enumerated() {
                total += num
            }
            return total
        }

        var closest = Int.max
        var result = Int.max
        var sortedNums = nums
        quickSort(&sortedNums, 0, sortedNums.count-1)

        for i in 0...sortedNums.count-3 {
            if i > 0 && sortedNums[i] == sortedNums[i-1] {
                continue
            }
            
            var l = i+1
            var r = sortedNums.count-1
            while l < r {
                let sum = sortedNums[i] + sortedNums[l] + sortedNums[r]
                var distance = Int.max
                distance = sum - target

                if abs(distance) < closest {
                    closest = abs(distance)
                    result = sum
                    // print("update min, distance = \(distance), sum = \(sum)")
                }
                
                if distance == 0 {
                    break
                } else if distance > 0 {
                    r -= 1
                } else {
                    l += 1
                }
            }

            if closest == 0 {
                break
            }
        }

        return result
    }

    func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        let begin = nums[left] 
        var l = left
        var r = right
        while l < r {
            while nums[r] > begin && l < r {
                r -= 1
            }
            if l < r {
                nums[l] = nums[r]
                l += 1
            }
            while nums[l] < begin && l < r {
                l += 1
            }
            if l < r {
                nums[r] = nums[l]
                r -= 1
            }
        }
        nums[l] = begin
        if l - left > 1 {
            quickSort(&nums, left, l-1)
        }
        if right-l > 1 {
            quickSort(&nums, l+1, right)
        }
    }
}

let nums = [-1,2,1,-4]
let target = 1
// let nums = [0,0,0]
// let target = 1
// let nums = [1,2,4,8,16,32,64,128]
// let target = 82  // 82
// Solution().quickSort(&nums, 0, nums.count-1)
// print("nums = \(nums)")
let closest = Solution().threeSumClosest(nums, target)
print("closest = \(closest)")


