
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var resDict: [String: Bool] = [:]
        return helper(matrix, target, 0, 0, &resDict)
    }

    func helper(_ matrix: [[Int]], _ target: Int, _ i: Int, _ j: Int, _ resDict: inout [String: Bool]) -> Bool {
        if (i>=matrix.count || j >= matrix[0].count) {
            return false
        }
        
        let key = String(i)+"_"+String(j)
        if resDict.keys.contains(key) {
            return resDict[key]!
        }

        var result = true
        if matrix[i][j] == target {
            result = true
        } else if matrix[i][j] > target {
            result = false
        } else {
            result = helper(matrix, target, i+1, j, &resDict) || helper(matrix, target, i, j+1, &resDict)
        }
        resDict[key] = result
        return result
    }
}

// 二分法
class Solution2 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix[0].count == 0 {
            return false
        }
        return helper(matrix, target, 0, matrix.count-1)
    }

    func helper(_ matrix: [[Int]], _ target: Int, _ start: Int, _ end: Int) -> Bool {
        // print("\(start), \(end)")
        let columnCount = matrix[0].count-1 // 0,1,2
        if (matrix[start][0]>target || matrix[end][columnCount] < target) {
            return false
        } else {
            let mid = start + (end-start)/2
            // print("mid=\(mid)")
            
            if (matrix[mid][0] > target) { // mid 之后的数都大于target，向前找
                return helper(matrix, target, start, mid-1)
            } else if (matrix[mid][columnCount] < target) { // mid 之前的数都小于arget，向后找
                return helper(matrix, target, mid+1, end)
            } else { // 遍历
                for i in start...end {
                    for j in 0..<matrix[0].count {
                        if matrix[i][j] == target {
                            return true
                        }
                    }
                }
                return false
            }
        }
    }
}

// let matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
// let target = 5
// let target = 20

// let matrix = [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]
// let target = 15

// let matrix = [[5,6,10,14],[6,10,13,18],[10,13,18,19]]
// let target = 14

// [5,6,10,14],
// [6,10,13,18],
// [10,13,18,19]

// [2,5]
// [2,8]
// [7,9]
// [7,11]
// [9,11]

// 7, 8
// let matrix = [[2,5],[2,8],[7,9],[7,11],[9,11]]
// let target = 7

let matrix = [[5],[6]]
let target = 6

let ans = Solution().searchMatrix(matrix, target)
print("\(ans)")

let ans2 = Solution2().searchMatrix(matrix, target)
print("\(ans2)")
