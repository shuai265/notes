/********************************************************************************** 
* 
* You are climbing a stair case. It takes n steps to reach to the top.
* 
* Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
* 
*               
**********************************************************************************/

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        } else if n == 2 {
            return 2
        } else {
            return climbStairs(n-1)+climbStairs(n-2)
        }
    }
}

class Solution2 {
    func climbStairs(_ n: Int) -> Int {
        var map: [Int: Int] = [:]
        return climbHelper(n, &map)
    }

    func climbHelper(_ n: Int, _ map: inout [Int: Int]) -> Int {
        if map.keys.contains(n) {
            return map[n]!
            } else {
                if n <= 1 {
                return 1
            } else if n == 2 {
                return 2
            } else {
                let result = climbHelper(n-1, &map)+climbHelper(n-2, &map)
                map[n] = result
                return result
            }
        }
    }
}

class Solution3 {
    func climbStairs(_ n: Int) -> Int {
        var list: [Int] = []
        if n <= 1 {
            return 1
        }
        if n == 2 {
            return 2
        }

        list.append(1)
        list.append(2)
        for i in 2...n-1 {
            list.append(list[i-1] + list[i-2])
        }
        return list[list.count-1]
    }
}

let n = 44
// let ans = Solution().climbStairs(n)
// print("ans=\(ans)")

let ans2 = Solution2().climbStairs(n)
print("ans2=\(ans2)")

let ans3 = Solution3().climbStairs(n)
print("ans3=\(ans3)")

// for i in 2...2 {
//     print("test i = \(i)")
// }