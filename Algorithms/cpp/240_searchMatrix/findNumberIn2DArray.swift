class Solution {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix[0].count == 0 {
            return false
        }
        return helper(matrix, target, [0,0], [matrix.count-1,matrix[0].count-1])
    }

    private func helper(_ matrix: [[Int]], _ target: Int, _ start: [Int], _ end: [Int]) -> Bool {
        // print("start = \(start), end = \(end)")
        if start[0] > end[0] || start[1] > end[1] 
        || start[0] >= matrix.count || end[0] >= matrix.count 
        || start[1] >= matrix[0].count || end[1] >= matrix[0].count  {
            return false
        }
        if start == end {
            return target == matrix[start[0]][start[1]]
        }

        let x1 = start[0]
        let y1 = start[1]
        let x2 = end[0]
        let y2 = end[1]

        let mx = (x1 + x2)/2
        let my = (y1 + y2)/2
        let mid = matrix[mx][my]
        // print("mid = \(mid), target = \(target)")
        if mid == target {
            return true
        } else if mid > target {
            // print("mid > target, n1 = \([start[0], my])\([mx-1, end[1]]), n2 = \([mx-1, start[1]]),\([end[0], my-1])")
            return helper(matrix, target, start, [mx-1, my-1])
            ||  helper(matrix, target, [start[0], my], [mx-1, end[1]])
            ||  helper(matrix, target, [mx, start[1]], [end[0], my-1])
        } else {
            // print("mid < target, n1 = \([start[0], my+1])\([mx, end[1]]), n2 = \([mx+1, start[1]]),\([end[0], my])")
            return helper(matrix, target, [mx+1, my+1], end)
            ||  helper(matrix, target, [start[0], my+1], [mx, end[1]])
            ||  helper(matrix, target, [mx+1, start[1]], [end[0], my])
        }
    }
}

// let matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
// let target = 5
// let target = 11
// let target = 23
// let target = 20
let matrix = [[-1,3]]
let target = 3

let found = Solution().findNumberIn2DArray(matrix, target)
print("target = \(target), found = \(found)")