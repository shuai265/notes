

/**
 * https://leetcode-cn.com/problems/permutation-sequence/
 * 给出集合 [1,2,3,...,n]，其所有元素共有 n! 种排列。

按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：

"123"
"132"
"213"
"231"
"312"
"321"
给定 n 和 k，返回第 k 个排列。

示例 1：
输入：n = 3, k = 3
输出："213"
示例 2：
输入：n = 4, k = 9
输出："2314"
示例 3：
输入：n = 3, k = 1
输出："123"

提示：
1 <= n <= 9
1 <= k <= n!
*/

class Solution2 {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var ans = 0
        var nums = [Int]()
        // var allNums = [Int]()
        for i in 0..<n {
            nums.append(i+1)
            // allNums
        }
        var left = k
        while nums.count > 0 {
            if left == 1 {
                for n in nums {
                    ans = ans*10 + n
                }
                break
            }
            // left > 1
            let current = left / helper(nums.count-1) // idx
            print("left = \(left), current = \(current), nums.count = \(nums.count)")
            ans = ans*10 + nums[current]
            if let index = nums.firstIndex(of: current) {
                nums.remove(at: index) // array is now ["world"]
            }
            left -= helper(nums.count)
            
            // if nums.contains(current) {
            //     ans = ans*10 + nums[current]
            //     if let index = nums.firstIndex(of: current) {
            //         nums.remove(at: index) // array is now ["world"]
            //     }
            //     // nums.remove(at: current-1)
            //     left -= helper(nums.count)
            // } else { // 0 , fetch min
            //     ans = ans*10 + nums[0]
            //     nums.remove(at: 0)
            // }
        }
        return String(ans)
    }

    // k > 0
    func pGet(_ nums: inout [Int], _ k: inout Int) -> Int {
        var index = 0
        if k > 1 {
            index = k / helper(nums.count - 1) + 1
        }
        
        let target = nums[index]
        nums.remove(at: index)
        k -= index * helper(nums.count)
        return target

        // if k == 1 {
        //     let target = nums[0]
        //     nums.remove(at: 0)
        //     return target
        // } else {
        //     let index = k / helper(nums.count - 1) + 1
        //     let target = nums[index]
        //     nums.remove(at: index)
        //     k -= index * helper(nums.count)
        // }
    }
    
    func helper(_ n: Int) -> Int {
        var t = n
        var ans = 1
        while t > 1 {
            ans *= t
            t -= 1
        }
        return ans
    }
}

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var ans = 0
        var nums = [Int]()
        for i in 0..<n {
            nums.append(i+1)
        }
        var left = k
        while nums.count > 0 {
            ans = ans * 10 + pGet(&nums, &left)
        }
        return String(ans)
    }

    // k > 0
    func pGet(_ nums: inout [Int], _ k: inout Int) -> Int {
        print("nums = \(nums), k = \(k)")
        var index = 0
        let page = helper(nums.count - 1)
        if page == 1 { // [1,2]
            index = k - page
            k -= 1
        } else {
            if k < page { // 在第一组内
                index = 0
                k -= 1
            } else if k > page { 
                index = k / page
                k = k - index * page 
                // k = k % page
            } else { // k == page, k 不变，传递给后面

            }
        }
        // } else if k == page {
        //     k = 1
        // } else {
        //     k -= 1
        // }
        let target = nums[index]
        nums.remove(at: index)
        // k -= index * helper(nums.count)
        print("index = \(index), target = \(target) \n")
        
        return target
    }
    
    func helper(_ n: Int) -> Int {
        // if n == 0 {
        //     return 0
        // }
        var t = n
        var ans = 1
        while t > 1 {
            ans *= t
            t -= 1
        }
        return ans
    }
}

// let n = 4
// let k = 9 // "2314"
// let n = 3
// let k = 3
// let n = 3
// let k = 1

// let n = 2
// let k = 2

let n = 3
let k = 2

let ans = Solution().getPermutation(n, k)
print("ans = \(ans)")

/**
 * left: 当前 n 个数字，第 k 个
 * left cnt nums    idx       target    next_left
 * 9    4   [1234]  1(9/3!) 2         3  
 * 3    3   [134]   1(3/2!) 3         1
 * 1    2   [14]    0(1/1!)
 * 
 * 9 - 3! * 1 = 3
 * 24 - 3! * 3 = 6
 * 
*/ 


// 24
// 4 -> 3! == 6
// 3 
// 2 
// 1 

// 4321
// 16
// 1
// 2 = 2 

// n * (n-1)!

// 4 * 3 * 2 * 1 = 24

// 9 /24 * 6 = 
// 9 / 4! * 3! = 9 / 4 = 2

// 9 - (n-1)! = 3

// 0 

// 0-6 1
// 7-12 2 

