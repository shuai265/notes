/**
 * https://leetcode-cn.com/problems/rectangle-area-ii/
 * 我们给出了一个（轴对齐的）矩形列表 rectangles 。 对于 rectangle[i] = [x1, y1, x2, y2]，其中（x1，y1）是矩形 i 左下角的坐标，（x2，y2）是该矩形右上角的坐标。

找出平面中所有矩形叠加覆盖后的总面积。 由于答案可能太大，请返回它对 10 ^ 9 + 7 取模的结果。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/rectangle-area-ii
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func rectangleArea(_ rectangles: [[Int]]) -> Int {
        var area = 0
        var x = 0
        var haveBiggerX = true
        while haveBiggerX {
            haveBiggerX = false
            var ranges = [Range<Int>]()
            for rect in rectangles {
                if rect[0] <= x && rect[2] > x {
                    ranges.append(rect[1]..<rect[3])
                }
                if !haveBiggerX && rect[2] > x {
                    haveBiggerX = true
                }
            }

            var datas = Set<Int>()
            for range in ranges {
                for i in range {
                    datas.insert(i)
                }
            }
            print("x = \(x), ranges = \(ranges)")
            area += datas.count

            x += 1
        }
        return area % (10 ^ 9 + 7 )
    }
}

class Solution2 {
    func rectangleArea(_ rectangles: [[Int]]) -> Int {
        var total = 0
        for rectangle in rectangles {
            let area = (rectangle[2]-rectangle[0])*(rectangle[3]-rectangle[1])
            total += area
        }

        if rectangles.count <= 1 {
            return total
        }

        for i in 0..<rectangles.count-1 {
            let rect1 = rectangles[i]
            var deletedPoints = Set<String>()
            for j in i+1..<rectangles.count {
                let rect2 = rectangles[j]
                let delArea = crossArea(rect1, rect2, &deletedPoints)
                print("rect1 = \(rect1), rect2 = \(rect2), delArea = \(delArea)")
                total -= delArea
            }
        }

        return total
    }

    func crossArea(_ rect1: [Int], _ rect2: [Int], _ deletedPoints: inout Set<String>) -> Int {
        var area = 0
        var cw = Double(rect1[2] - rect1[0] + rect2[2] - rect2[0])/2.0
        let c1x = Double(rect1[0] + rect1[2])/2.0
        let c2x = Double(rect2[0] + rect2[2])/2.0
        let xCross = cw - abs(c1x - c2x)
        if xCross > 0{
            var ch = Double(rect1[3] - rect1[1] + rect2[3] - rect2[1])/2.0
            // var ch = 0
            let c1y = Double(rect1[1] + rect1[3])/2.0
            let c2y = Double(rect2[1] + rect2[3])/2.0
            let yCross = ch - abs(c1y - c2y)
            print("xCross = \(xCross.rounded(.up)), yCross = \(yCross.rounded(.up))")
            
            if yCross > 0 {
                // have cross area
                // area = Int(xCross.rounded(.up) * yCross.rounded(.up))
            }
        }
        return area
        // return points.count
        
    }
}

let rectangles = [[0,0,2,2],[1,0,2,3],[1,0,3,1]]
// let rectangles = [[0,0,1000000000,1000000000]]
let ans = Solution().rectangleArea(rectangles)
print("ans = \(ans)")

let ans2 = Solution2().rectangleArea(rectangles)
print("ans2 = \(ans2)")
