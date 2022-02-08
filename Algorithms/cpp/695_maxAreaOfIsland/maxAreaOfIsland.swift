
class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 && grid[0].count > 0 else {
            return 0
        }
        var checkedPoints = Set<Point>()
        var max = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                let p = Point(i, j)
                if checkedPoints.contains(p) {
                    continue
                } else {
                    var currentPoints = Set<Point>()
                    helper(grid, &checkedPoints, p, &currentPoints)
                    if currentPoints.count > max {
                        max = currentPoints.count
                    }
                }
            }       
        }
        return max
    }

    private func helper(_ grid: [[Int]], _ checkedPoints: inout Set<Point>, _ point: Point, _ currentPoints: inout Set<Point>) {
        if checkedPoints.contains(point) {
            return
        }
        if point.x < 0 || point.x == grid.count || point.y < 0 || point.y == grid[0].count {
            return
        }
        if grid[point.x][point.y] == 0 {
            return
        }
        checkedPoints.insert(point)
        currentPoints.insert(point)
        let steps = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        for pair in steps {
            let p = Point(point.x+pair.0, point.y+pair.1)
            helper(grid, &checkedPoints, p, &currentPoints)
        }
    }
}

struct Point: Hashable {
  let x: Int
  let y: Int
  init (_ x: Int, _ y: Int) {
      self.x = x
      self.y = y
  }
}

let grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]

let cnt = Solution().maxAreaOfIsland(grid)
print("cnt = \(cnt)")