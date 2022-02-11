class Solution {
    func maximumSwap(_ num: Int) -> Int {
        var nums = [Int]()
        var tmp = num
        while tmp > 0 {
            nums.insert(tmp%10, at: 0)
            tmp = tmp/10
        }
        // print("nums = \(nums)")
        for i in 0..<nums.count {
            let n = nums[i]
            if n < 9 {
                var max = n
                var idx = i
                for j in (i..<nums.count).reversed() {
                    if nums[j] > max {
                        max = nums[j]
                        idx = j
                    }
                }
                if max > n {
                    // let tmp = n
                    nums[i] = max
                    nums[idx] = n
                    break
                }
            } else {
                continue
            }
        }

        var ans = 0
        for i in 0..<nums.count {
            ans = ans*10 + nums[i]
        }
        return ans
    }
}


let num = 2736
// let num = 9973
// let num = 9973435

let ans = Solution().maximumSwap(num)
print("ans = \(ans)")

let ans3 = Solution3().maximumSwap(num)
print("ans3 = \(ans3)")

class Solution2 {
    func maximumSwap(_ num: Int) -> Int {
        if num < 10 {
            return num
        }

        var nums:[Int] = []
        var n = num
        while n > 0 {
            let m = n%10
            nums.insert(m, at: 0)
            n = n/10
        }
        var ans = num
        var swapped = false
        for i in 0..<nums.count-1 {
            let ni = nums[i]
            for j in i..<nums.count {
                if nums[j] > ni {
                    let tmp = numSwap(num, i, j)
                    // var an
                    if tmp > ans {
                        ans = num
                        swapped = true
                    }
                }
            }
            if swapped {
                break
            }
        }
        return ans
    }

    func numSwap(_ num: Int, _ i: Int, _ j: Int) -> Int {
        return 1
    }
}

// quick sort 
class Solution3 {
    func maximumSwap(_ num: Int) -> Int {
        if num <= 10 {
            return num
        }
        var n = num 
        var nums = [Int]()
        while n > 0 {
            nums.append(n%10)
            n /= 10
        }
        nums = nums.reversed()

        var sortedNums = nums.map{ $0 }

        quickSort(&sortedNums, 0, nums.count-1)
        if nums == sortedNums {
            return num
        }

        for i in 0..<nums.count {
            if nums[i] != sortedNums[i] {
                let target = sortedNums[i]
                for j in (0..<nums.count).reversed() {
                    if target == nums[j] {
                        nums[j] = nums[i]
                        nums[i] = target
                        var ans = 0
                        for i in 0..<nums.count {
                            ans = ans * 10 + nums[i]
                        }
                        return ans
                    }
                }
            }
        }
        return num
    }

    func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        let flag = nums[left]
        var l = left 
        var r = right
        while l < r {
            while nums[r] < flag && l < r {
                r -= 1
            }
            if l < r {
                nums[l] = nums[r] 
                l += 1
            }
            while nums[l] > flag && l < r {
                l += 1
            }
            if l < r {
                nums[r] = nums[l]
                r -= 1
            }
        }
        nums[l] = flag
        if l-1 > left {
            quickSort(&nums, left, l-1)
        }
        if l+1 < right {
            quickSort(&nums, l+1, right)
        }
    }
}