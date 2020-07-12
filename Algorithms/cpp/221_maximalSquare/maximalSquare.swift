/**
在一个由 0 和 1 组成的二维矩阵内，找到只包含 1 的最大正方形，并返回其面积。
示例:
输入: 
1 0 1 0 0
1 0 1 1 1
1 1 1 1 1
1 0 0 1 0
输出: 4
*/


class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var maxArea = 0
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let tmpArea = calcArea(matrix, i, j)
                if tmpArea > maxArea {
                    maxArea = tmpArea
                }
            }
        }
        return maxArea
    }

    func calcArea(_ matrix: [[Character]], _ row: Int, _ column: Int) -> Int {
        var area = 0
        let kOne = Character("1")
        var endRow = row + 1
        var endColumn = column + 1
        if matrix[row][column] == kOne {
            area = 1
            while (endRow < matrix.count && endColumn < matrix[0].count) {
                for r in row...endRow {
                    // print("valid vertical \(r),\(endColumn)")
                    
                    if matrix[r][endColumn] != kOne {
                        // print("vertical break")
                        return area
                    } 
                }
                for c in column...endColumn {
                    // print("valid horizon \(endRow),\(c)")
                    if matrix[endRow][c] != kOne {
                        // print("horizon break")
                        return area
                    }
                }
                // print("update area, \(row), \(column), \(endRow), \(endColumn)")
                
                area = (endRow-row+1)*(endColumn-column+1)
                endRow += 1
                endColumn += 1
            }
        }
        return area 
    }
}

// 动态规划
class Solution2 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var maxLenght = 0
        var container: [[Int]] = []
        let kOne = Character("1")
        for i in 0..<matrix.count {
            var tmp: [Int] = []
            for j in 0..<matrix[0].count {
                if matrix[i][j] == kOne {
                    tmp.append(1)
                } else {
                    tmp.append(0)
                }
            }
            container.append(tmp)
        }

        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == kOne {
                    var leftVal = 0
                    var topVal = 0
                    var topLeft = 0
                    if i>=1 {
                        leftVal = container[i-1][j]
                    }
                    if j>=1 {
                        topVal = container[i][j-1]
                    }
                    if i>=1, j>=1 {
                        topLeft = container[i-1][j-1]
                    }
                    let tmp = mini(leftVal, topVal, topLeft) + 1                    
                    container[i][j] = tmp 
                    if tmp > maxLenght {
                        maxLenght = tmp
                    }
                }
            }
        }
        
        return maxLenght*maxLenght
    }

    func mini(_ val1: Int, _ val2: Int, _ val3: Int) -> Int {        
        return min(min(val1, val2), val3)
    }
}


func genMatrix(_ chars: [[String]]) -> [[Character]] {
    var matr: [[Character]] = []
    for arr in chars {
        var tmp: [Character] = []
        for str in arr {
            tmp.append(Character(str))
        }
        matr.append(tmp)
    }
    return matr
}

// let chars = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
// let chars = [["1"]]
// let chars = [["1","0"],["1","0"]]
let chars = [["1","1"],["1","1"]]
let matrix = genMatrix(chars)
print("\(matrix)")
var area = Solution().maximalSquare(matrix)
print("area=\(area)")
var area2 = Solution2().maximalSquare(matrix)
print("area2=\(area2)")
