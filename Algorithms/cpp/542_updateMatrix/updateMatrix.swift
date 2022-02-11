
// BFS O(m*n)
class Solution2 {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        if mat.count == 0 || mat[0].count == 0 {
            return mat
        }

        var queue = [[Int]]()
        var matrix = mat
        for i in 0...matrix.count-1 {
            for j in 0...matrix[0].count-1 {
                let v = matrix[i][j]
                if v == 0 {
                    queue.append([i, j])
                } else {
                    matrix[i][j] = -1
                }
            }
        }

        let dxs = [-1, 1, 0, 0]
        let dys = [0, 0, -1, 1]
        while queue.count > 0 {
            let point = queue[0]
            queue.remove(at: 0)
            let x = point[0]
            let y = point[1]
            for i in 0..<dxs.count {
                let newX = x + dxs[i]
                let newY = y + dys[i]
                // print("current p = [\(x),\(y)], check newP = [\(newX),\(newY)]")
                
                if newX >= 0 && newY >= 0 && newX < matrix.count && newY < matrix[0].count && matrix[newX][newY] == -1 {
                    queue.append([newX, newY])
                    matrix[newX][newY] = matrix[x][y] + 1
                }
            }
        }
        return matrix
    }
}

// O(n)
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        if mat.count == 0 || mat[0].count == 0 {
            return mat
        }

        let max = mat.count+mat[0].count
        var m = mat
        for i in 0...m.count-1 {
            for j in 0...m[0].count-1 {
                // print("1, i = \(i), j = \(j)")
                var v = m[i][j]
                if v != 0 {
                    if i > 0 && j > 0 {
                        v = min(m[i-1][j], m[i][j-1]) + 1
                    } else if i > 0 {
                        v = m[i-1][j] + 1
                    } else if j > 0 {
                        v = m[i][j-1] + 1
                    } else {
                        v = max
                    }
                    m[i][j] = v
                }
            }
        }

        for i in (0...m.count-1).reversed() {
            for j in (0...m[0].count-1).reversed() {
                // print("2, i = \(i), j = \(j)")
                var v = m[i][j]
                if v != 0 {
                    if i < m.count-1 && j < m[i].count-1 {
                        v = min(m[i+1][j], m[i][j+1]) + 1
                    } else if i < m.count-1 {
                        v = m[i+1][j] + 1
                    } else if j < m[i].count-1 {
                        v = m[i][j+1] + 1
                    }
                    if v < m[i][j] {
                        m[i][j] = v
                    }
                }
            }
        }
        return m
    }
}

let mat = [[0,0,0],[0,1,0],[0,0,0]]
// let mat = [[0,0,0],[0,1,0],[1,1,1]]
let matrix = Solution().updateMatrix(mat)
print("matrix = \(matrix)")
let matrix2 = Solution2().updateMatrix(mat)
print("matrix2 = \(matrix2)")
