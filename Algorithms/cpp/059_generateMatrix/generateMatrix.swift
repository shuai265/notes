
/**
 * https://leetcode-cn.com/problems/spiral-matrix-ii/
 * 给定一个正整数 n，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。
    输入: 3
    输出:
    [
    [ 1, 2, 3 ],
    [ 8, 9, 4 ],
    [ 7, 6, 5 ]
    ]
*/
/**
 * Array performance: append() vs reserveCapacity()
 * https://www.hackingwithswift.com/articles/128/array-performance-append-vs-reservecapacity
*/

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = [[Int]]()
        res.reserveCapacity(n)
        for i in 0..<n {
            var sub = [Int]()
            sub.reserveCapacity(n)
            res[i] = reserveCapacity
        }
        
        var end = pow(n, 2)
        var current = 1
        var round = 0
        while current <= end {
            // do insert
            // ---> x
            // | 
            // y
            for i in round...n-round {
                res[round][i] = current 
                current += 1
            }
            // 处理角
            for i in round...n-round {
                res[i][n-round] = current
                current += 1
            }

            for i in (round...n-round).reversed() {
                res[n-round][i] = current
                current += 1
            }
            
            for i in (round...n-round).reversed() {
                res[n-round][i] = current
                current += 1
            }

        }

    }
}