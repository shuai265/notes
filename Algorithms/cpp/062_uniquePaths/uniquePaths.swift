/********************************************************************************** 
 * 
 * A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 * 
 * The robot can only move either down or right at any point in time. The robot is trying to reach 
 * the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 *    
 *    
 *    start                                                  
 *    +---------+----+----+----+----+----+                   
 *    |----|    |    |    |    |    |    |                   
 *    |----|    |    |    |    |    |    |                   
 *    +----------------------------------+                   
 *    |    |    |    |    |    |    |    |                   
 *    |    |    |    |    |    |    |    |                   
 *    +----------------------------------+                   
 *    |    |    |    |    |    |    |----|                   
 *    |    |    |    |    |    |    |----|                   
 *    +----+----+----+----+----+---------+                   
 *                                   finish                  
 *    
 * 
 * How many possible unique paths are there?
 * 
 * Above is a 3 x 7 grid. How many possible unique paths are there?
 * 
 * Note: m and n will be at most 100.
 *               
 **********************************************************************************/

import Foundation

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        print("start \(Date().description(with: Locale.current))")
        if (m==1 || n==1) {
            return 1
        }
        let result = uniquePaths(m-1, n) + uniquePaths(m, n-1)
        print("start \(Date().description(with: Locale.current))")
        return result
    }
}

class Solution2 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        print("start \(Date().description(with: Locale.current))")
        var map: [String: Int] = [:]
        let result = uniquePathsHelper(m, n, &map)
        print("start \(Date().description(with: Locale.current))")
        return result
    }
    func uniquePathsHelper(_ m: Int, _ n: Int, _ map: inout [String: Int]) -> Int {
        if (m==1 || n==1) {
            return 1
        }
        let key1 = String(m)+","+String(n)
        let key2 = String(n)+","+String(m)
        if map.keys.contains(key1) {
            return map[key1]!
        }
        let result = uniquePathsHelper(m-1, n, &map) + uniquePathsHelper(m, n-1, &map)
        map[key1] = result
        map[key2] = result
        return result
    }
}

// let m = 3
// let n = 2
let m = 19
let n = 13
let ans = Solution().uniquePaths(m, n)
print("\(ans)")
let ans2 = Solution2().uniquePaths(m, n)
print("\(ans2)")