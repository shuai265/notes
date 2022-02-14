class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count == 1 {
            return triangle[0][0]
        }
        var mins = triangle.last!
        for i in (0..<triangle.count-1).reversed() {
            let nums = triangle[i]
            var newMins = [Int]()
            for j in 0..<nums.count {
                let newMin = nums[j] + min(mins[j], mins[j+1])
                newMins.append(newMin)
            }
            mins = newMins
        }
        return mins[0]
    }
}

// let triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
// let triangle = [[-10]]
let triangle = [[-10],[3,4]]
let ans = Solution().minimumTotal(triangle)
print("ans = \(ans)")