
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var g = grid
        let kOneChar = Character("1")
        var cnt = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if kOneChar == g[i][j] {
                    cnt += 1
                    turnToZero(&g, i, j)
                }
            }
        }
        return cnt
    }

    func turnToZero(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        let kZero = Character("0")
        let kOneChar = Character("1")
        grid[i][j] = kZero
        let steps = [(0,1),(1,0),(0,-1),(-1,0)]
        for step in steps {
            let row = i + step.0
            let column = j + step.1
            if row >= 0, row < grid.count, column>=0, column<grid[0].count, grid[row][column] == kOneChar {
                turnToZero(&grid, row, column)
            }
        }
    }
}

func strToChar(_ grid: [[String]]) -> [[Character]] {
    var cG: [[Character]] = []
    for list in grid {
        var cList: [Character] = []
        for s in list {
            cList.append(Character(s))
        }
        cG.append(cList)
    }
    return cG
}

// let sg = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]
let sg = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","1"]]
let grid = strToChar(sg)
let cnt = Solution().numIslands(grid)
print("cnt = \(cnt)")
