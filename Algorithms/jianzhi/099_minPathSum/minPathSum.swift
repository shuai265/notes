// 记忆+递归
class Solution1 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var cache = [String: Int]()
        let end = [grid.count-1, grid[0].count-1] 
        return helper(grid, [0, 0], end, &cache)
    }

    func helper(_ grid: [[Int]], _ start: [Int], _ end: [Int], _ cache: inout [String: Int]) -> Int {
        let key = String(end[0])+"_"+String(end[1])
        if let cnt = cache[key] {
            return cnt
        }
        // if start == end {
        //     return grid[start[0]][start[1]]
        // }
        var ans = grid[end[0]][end[1]]
        let nx = end[0] - 1
        let ny = end[1] - 1
        if nx >= 0 && ny >= 0 {
            ans += min(helper(grid, start, [nx, end[1]], &cache), helper(grid, start, [end[0], ny], &cache))
        } else if nx >= 0 {
            ans += helper(grid, start, [nx, end[1]], &cache)
        } else if ny >= 0 {
            ans += helper(grid, start, [end[0], ny], &cache)
        } else {
            // do nothing
        }
        cache[key] = ans 
        return ans
    }
}

// 说明：一个机器人每次只能向下或者向右移动一步。 
class Solution2 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var distance = [[Int]]()
        for i in 1...grid.count {
            var rowDist = [Int]()
            for j in 1...grid[0].count {
                if i == 1 && j == 1 {
                    rowDist.append(grid[0][0])
                } else if i > 1 && j > 1 {
                    let min = grid[i-1][j-1] + min(distance[i-2][j-1], rowDist[j-2])
                    rowDist.append(min)
                } else if i > 1 && j == 1 {
                    let min = grid[i-1][j-1] + distance[i-2][j-1]
                    rowDist.append(min)
                } else if i == 1 && j > 1 {
                    let min = grid[i-1][j-1] + rowDist[j-2]
                    rowDist.append(min)
                }
            }
            distance.append(rowDist)
        }
        return  distance.last!.last!
    }
}

// let grid = [[1,3,1],[1,5,1],[4,2,1]]
let grid = [[1]]
let distance = Solution2().minPathSum(grid)
print("distance = \(distance)")