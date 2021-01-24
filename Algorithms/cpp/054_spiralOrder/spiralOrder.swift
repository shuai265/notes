class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var maxX = matrix[0].count
        var maxY = matrix.count
        var res = Array<Int>()

        var x = 0
        var y = 0

        while (maxX>2*x && maxY>2*y) {
            print("start(\(x), \(y), maxY=\(maxY))")
            res = res + spiralEdges(matrix, x, y)
            // print("new res = \(res)")
            
            x += 1
            y += 1
        }
        return res
    }

    private func spiralEdges(_ matrix: [[Int]], _ x: Int, _ y: Int) -> [Int] {
        var res = Array<Int>()
        let minX = x
        var minY = y
        var maxX = matrix[0].count-minY
        var maxY = matrix.count-minY
        var sub = Array<Int>()
        for i in stride(from: minX, to: maxX, by: 1) {
            sub += [matrix[minY][i]]
        }
        if sub.count>0 {
            res += sub
            minY += 1
            sub = Array<Int>()
            print("1 \(res)")
        }

        if (minX <= maxX && minY <= maxY) {   
            for i in minY..<maxY {
                sub += [matrix[i][maxX-1]]
            }
        }
        if sub.count>0 {
            res += sub
            maxX -= 1
            sub = Array<Int>()
            print("2 \(res)")
        }
        
        if (minX <= maxX && minY < maxY) {
            for i in (minX..<maxX).reversed() {
                sub += [matrix[maxY-1][i]]
            }
        }
        if sub.count>0 {
            res += sub
            maxY -= 1
            sub = Array<Int>()
            print("3 \(res)")
        }
        
        if (minX < maxX && minY <= maxY) {
            for i in (minY..<maxY).reversed() {
                res += [matrix[i][minX]]
            }
            print("4 \(res)")
        }
        
        return res
    }
}

let data = [[1,2,3],[4,5,6],[7,8,9]]
// let data = [
//   [1, 2, 3, 4],
//   [5, 6, 7, 8],
//   [9,10,11,12]
// ]

// let data = [[6,9,7]]

// let data = [[3],[2]]
// let data = [[2,5],[8,4],[0,-1]]


let res = Solution().spiralOrder(data)

print("\(res)")
