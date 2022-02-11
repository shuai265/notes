class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var bads = [[Int]]()
        var goodSet = Set<[Int]>()
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                let val = grid[i][j]
                if val == 2 {
                    bads.append([i, j])
                } else if val == 1 {
                    goodSet.insert([i, j])
                }
            }
        }
        // print("goodSet = \(goodSet)")
        // print("bads = \(bads)")
        
        var step = 0
        let dxs = [-1, 1, 0, 0]
        let dys = [0, 0, -1, 1]
        while goodSet.count > 0 && bads.count > 0 {
            // print("----loop----")
            // print("goodSet = \(goodSet)")
            // print("bads = \(bads)")
            var newBads = [[Int]]()
            for bad in bads {
                for i in 0...dxs.count-1 {
                    let newX = bad[0] + dxs[i]
                    let newY = bad[1] + dys[i]
                    let pos = [newX, newY]
                    if goodSet.contains(pos) {
                        goodSet.remove(pos)
                        newBads.append(pos)
                    }
                }
            }
            step += 1
            bads = newBads
        }
        if goodSet.count > 0 {
            step = -1
        }
        return step
    }
}

// let grid = [[2,1,1],[1,1,0],[0,1,1]]
// let grid = [[0,2]]
let grid = [[2,1,1],[0,1,1],[1,0,1]]
let steps = Solution().orangesRotting(grid)
print("steps = \(steps)")