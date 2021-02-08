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


// let num = 2736
// let num = 9973
let num = 9973435

let ans = Solution().maximumSwap(num)
print("ans = \(ans)")
