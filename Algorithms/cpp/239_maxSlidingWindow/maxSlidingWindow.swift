class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var ans: [Int] = []
        if nums.count == 0 {
            return ans
        }
        for i in 0...nums.count-k {
            ans.append(findMax(nums, k, i))
        }
        return ans 
    }

    func findMax(_ nums: [Int], _ k: Int, _ start: Int) -> Int {
        var max = Int.min
        for i in start..<start+k {
            if nums[i] > max {
                max = nums[i]
            }
        }
        return max
    }
}

// // 动态规划
// class Solution2 {
//     func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//         var left: [[Int]] = []
//         var right: [[Int]] = []
//         var ans: [Int] = []
//         for i in 0...nums.count/k {
//             let currentSize = ((i+1)*k > nums.count) ? nums.count%k : k
            
//             var sub: [Int] = []
//             var max = Int.min
//             var subRight: [Int] = []
//             var maxRight = Int.min
//             for _ in 0..<currentSize {
//                 sub.append(max)
//                 subRight.append(maxRight)
//             }

//             for j in 0..<currentSize {
//                 let idx = i*k+j
//                 if idx < nums.count {
//                     // left
//                     if nums[idx] > max {
//                         max = nums[idx]
//                     }
//                     sub[j] = max
//                     // right
//                     let idx2 = k*i+currentSize-j-1
//                     // print("idx2 = \(idx2),currentSize=\(currentSize),j=\(j),i=\(i)")
                    
//                     if nums[idx2]>maxRight {
//                         maxRight = nums[idx2]
//                     }
//                     subRight[currentSize-j-1] = maxRight
//                 }
//             }
//             left.append(sub)
//             right.append(subRight)
//         }
//         print("\(left), \n\(right)")
        
//         return nums
//     }
// }

// 动态规划
class Solution2 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 {
            return []
        }
        var left: [Int] = []
        var right: [Int] = []
        var ans: [Int] = []
        for _ in 0..<nums.count {
            left.append(Int.min)
            right.append(Int.min)
        }
        for i in 0..<nums.count {
            // left
            if i%k == 0 {
                left[i] = nums[i]
            } else {
                left[i] = max(left[i-1], nums[i])
            }
            // right
            let idx = nums.count - i - 1
            if (i == 0 || (idx+1)%k == 0) {
                right[idx] = nums[idx]
            } else {
                right[idx] = max(right[idx+1], nums[idx])
            }
        }
        // print("left = \(left)\nright=\(right)")
        for i in 0...nums.count-k {
            if i%k == 0 {
                ans.append(right[i])
            } else {
                let l = left[i+k-1]
                let r = right[i]
                ans.append(max(l, r))
            }
        }
        return ans
    }
}

// let nums = [1,3,-1,-3,5,3,6,7]
let nums: [Int] = []
print("nums=\(nums)")

let k = 3
let ans = Solution().maxSlidingWindow(nums, k)
print("ans=\(ans)")

let ans2 = Solution2().maxSlidingWindow(nums, k)
print("ans2=\(ans2)")
