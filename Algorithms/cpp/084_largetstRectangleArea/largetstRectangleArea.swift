


// 方法1: 暴力
class Solution1 {
    // func largestRectangleArea(_ heights: [Int]) -> Int {
    //     var 
    // }
}

// 方法2: 动态规划+存储, maxArea(0,n) = max[maxArea(0,n-1),area(0,n),maxArea(1,n)]
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.count == 0 {
            return 0
        }
        var knownArea: [String: Int] = [:]
        return helper(heights, 0, heights.count-1, &knownArea)
    }

    func helper(_ heights: [Int], _ left: Int, _ right: Int, _ knownArea: inout [String: Int]) -> Int {
        if left == right {
            return heights[left]
        }
        let key = String(left)+","+String(right)
        if knownArea.keys.contains(key) {
            return knownArea[key]!
        }
        var area = calcArea(heights, left, right)
        let leftArea = helper(heights, left, right-1, &knownArea) 
        let rightArea = helper(heights, left+1, right, &knownArea)
        area = max(leftArea, area)
        area = max(rightArea, area)
        knownArea[key] = area 
        return area
    }

    func calcArea(_ heights: [Int], _ left: Int, _ right: Int) -> Int {
        var min = Int.max
        for i in left...right {
            let height = heights[i]
            if height < min {
                min = height
            }
        }
        return (right-left+1)*min
    }
}

//方法3:分治法，找到最短柱子，这时候有三种情况：左侧大，右侧大，自己大
class Solution2 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.count == 0 {
            return 0
        }
        return helper(heights, 0, heights.count-1)
    }

    func helper(_ heights: [Int], _ left: Int, _ right: Int) -> Int {
        // print("l=\(left),r=\(right)")
        
        if left == right {
            return heights[left]
        }
        var min = Int.max
        var minPos = -1
        for i in left...right {
            if heights[i] < min {
                min = heights[i]
                minPos = i
            }
        }
        var area = (right-left+1)*min
        if minPos > left {
            let leftArea = helper(heights, left, minPos-1)
            area = max(area, leftArea)
        }
        if minPos < right {
            let rightArea = helper(heights, minPos+1, right)
            area = max(area, rightArea)
        }
        return area
    }
}


// let heights = [2,1,5,6,2,3]
// let heights: [Int] = []
let heights: [Int] = [2,1,3]

let area = Solution().largestRectangleArea(heights)
print("area=\(area)")

let area2 = Solution2().largestRectangleArea(heights)
print("area2=\(area2)")