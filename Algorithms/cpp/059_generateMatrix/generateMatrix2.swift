class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {

        var ans = [[Int]]()
        for _ in 0..<n {
            var tmp = [Int]()
            for _ in 0..<n {
                tmp.append(0)
            }
            ans.append(tmp)
        }
        // var startP = [0, 0]
        var startVal = 1
        for i in 0..<(n+1)/2 {
            // startP = [i, i]
            let startP = (i, i)
            let width = n - 2*i
            // print("startP = \(startP), width = \(width), startVal = \(startVal), ans = \(ans)")
            if width == 1 {
                ans[startP.0][startP.1] = startVal
            } else {
                // horizon
                for dy in 0...width-1 {
                    ans[startP.0][startP.1+dy] = startVal
                    startVal += 1
                }
                for dx in 1...width-1 {
                    ans[startP.0+dx][startP.1+width-1] = startVal
                    startVal += 1
                }
                for dy in (0...width-2).reversed() {
                    ans[startP.0+width-1][startP.1+dy] = startVal
                    startVal += 1
                }
                if width > 2 {
                    for dx in (1...width-2).reversed() {
                        ans[startP.0+dx][startP.1] = startVal
                        startVal += 1
                    }
                }
            }
        }
        return ans
    }
}

// let n = 3
// let n = 1
let n = 20
let ans = Solution().generateMatrix(n)
print("ans = \(ans)")