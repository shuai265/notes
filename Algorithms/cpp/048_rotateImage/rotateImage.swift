/********************************************************************************** 
* 
* You are given an n x n 2D matrix representing an image.
* Rotate the image by 90 degrees (clockwise).
* Follow up:
* Could you do this in-place?
*               
**********************************************************************************/

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for x in 0..<n/2 {
            for y in x..<n-1-x {
                // pos (i, j)
                swap(&matrix, x, y, n)
            }
        }
    }

    func swap(_ matrix: inout [[Int]], _ x: Int, _ y: Int, _ n: Int) {
        print("swap (\(x),\(y))")
        
        var sourceVal = matrix[x][y]
        var i = x
        var j = y
        repeat {
            // print("source (\(i),\(j)), sourceVal=\(sourceVal)")
            let t = i
            i = j
            j = n - t - 1
            let tmp = matrix[i][j]
            matrix[i][j] = sourceVal
            sourceVal = tmp
        } while (i != x || j != y)
    }
}

// var matrix = [[1,2,3],[4,5,6],[7,8,9]]
var matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
print("before \(matrix)")
// Solution().swap(&matrix,0,0,3)
Solution().rotate(&matrix)
print("after \(matrix)")
// matrix[0][0] = 3
// print("after \(matrix)")