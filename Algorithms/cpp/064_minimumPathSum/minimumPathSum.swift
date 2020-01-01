/***************************************************************************************************** 
 *
 * Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right 
 * which minimizes the sum of all numbers along its path.
 * 
 * Note: You can only move either down or right at any point in time.
 * 
 * Example:
 * 
 * Input:
 * [
 *   [1,3,1],
 *   [1,5,1],
 *   [4,2,1]
 * ]
 * Output: 7
 * Explanation: Because the path 1&rarr;3&rarr;1&rarr;1&rarr;1 minimizes the sum.
 * 
 ******************************************************************************************************/

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var map: [String: Int] = [:]
        return minPathSumHelper(grid, grid[0].count-1, grid.count-1, &map)
    }

    func minPathSumHelper(_ grid: [[Int]], _ m: Int, _ n: Int, _ map: inout [String: Int]) -> Int {
        var sum = 0
        if (m==0) {
            for i in 0...n {
                sum += grid[i][0]
            }
        } else if (n==0) {
            for i in 0...m {
                sum += grid[0][i]
            }
        } else {
            sum = min(minPathSumHelper(grid, m-1, n, &map), minPathSumHelper(grid, m, n-1, &map)) + grid[n][m]
        }
        print("m=\(m), n=\(n), sum=\(sum),grid[m][n]=\(grid[m][n]) ")
        return sum
    }
}

class Solution2 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let column = grid[0].count
        var newGrid: [[Int]] = []
        var result = -1
        for i in 0..<rows {
            var newRow: [Int] = []
            newGrid.append(newRow)
            for j in 0..<column {
                var minVal = 0
                if i==0, j==0 {
                    minVal = 0
                } else if i==0 {
                    minVal = newGrid[0][j-1]
                } else if j==0 {
                    minVal = newGrid[i-1][j]
                } else {
                    minVal = min(newGrid[i-1][j], newGrid[i][j-1])
                }
                // newRow.append(minVal + grid[i][j])
                result = minVal + grid[i][j]
                print("(\(i),\(j)), val=\(result), minVal=\(minVal), grid[i][j]=\(grid[i][j])")
                newRow.append(result)
                newGrid[i] = newRow
            }
        }
        return result
    }
}

// let grid = [[1,3,1],[1,5,1],[4,2,1]]
let grid = [[5,0,1,1,2,1,0,1,3,6,3,0,7,3,3,3,1],[1,4,1,8,5,5,5,6,8,7,0,4,3,9,9,6,0],[2,8,3,3,1,6,1,4,9,0,9,2,3,3,3,8,4],[3,5,1,9,3,0,8,3,4,3,4,6,9,6,8,9,9],[3,0,7,4,6,6,4,6,8,8,9,3,8,3,9,3,4],[8,8,6,8,3,3,1,7,9,3,3,9,2,4,3,5,1],[7,1,0,4,7,8,4,6,4,2,1,3,7,8,3,5,4],[3,0,9,6,7,8,9,2,0,4,6,3,9,7,2,0,7],[8,0,8,2,6,4,4,0,9,3,8,4,0,4,7,0,4],[3,7,4,5,9,4,9,7,9,8,7,4,0,4,2,0,4],[5,9,0,1,9,1,5,9,5,5,3,4,6,9,8,5,6],[5,7,2,4,4,4,2,1,8,4,8,0,5,4,7,4,7],[9,5,8,6,4,4,3,9,8,1,1,8,7,7,3,6,9],[7,2,3,1,6,3,6,6,6,3,2,3,9,9,4,4,8]]
/*
[
    [5,0,1,1,2,1,0,1,3,6,3,0,7,3,3,3,1],
    [1,4,1,8,5,5,5,6,8,7,0,4,3,9,9,6,0],
    [2,8,3,3,1,6,1,4,9,0,9,2,3,3,3,8,4],
    [3,5,1,9,3,0,8,3,4,3,4,6,9,6,8,9,9],
    [3,0,7,4,6,6,4,6,8,8,9,3,8,3,9,3,4],
    [8,8,6,8,3,3,1,7,9,3,3,9,2,4,3,5,1],
    [7,1,0,4,7,8,4,6,4,2,1,3,7,8,3,5,4],
    [3,0,9,6,7,8,9,2,0,4,6,3,9,7,2,0,7],
    [8,0,8,2,6,4,4,0,9,3,8,4,0,4,7,0,4],
    [3,7,4,5,9,4,9,7,9,8,7,4,0,4,2,0,4],
    [5,9,0,1,9,1,5,9,5,5,3,4,6,9,8,5,6],
    [5,7,2,4,4,4,2,1,8,4,8,0,5,4,7,4,7],
    [9,5,8,6,4,4,3,9,8,1,1,8,7,7,3,6,9],
    [7,2,3,1,6,3,6,6,6,3,2,3,9,9,4,4,8]
]
*/

// let ans = Solution().minPathSum(grid)
// print("\(ans)")

let ans2 = Solution2().minPathSum(grid)
print("\(ans2)")
