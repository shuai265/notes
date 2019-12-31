/********************************************************************************** 
* 
* Given n non-negative integers representing an elevation map where the width of each bar is 1, 
* compute how much water it is able to trap after raining. 
* 
* For example, 
* Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
*   
*     ^                                             
*     |                                             
*   3 |                       +--+                  
*     |                       |  |                  
*   2 |          +--+xxxxxxxxx|  +--+xx+--+         
*     |          |  |xxxxxxxxx|  |  |xx|  |         
*   1 |   +--+xxx|  +--+xxx+--+  |  +--+  +--+      
*     |   |  |xxx|  |  |xxx|  |  |  |  |  |  |      
*   0 +---+--+---+--+--+---+--+--+--+--+--+--+----->
*       0  1   0  2  1   0  1  3  2  1  2  1        
* 
* The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 
* 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
*               
**********************************************************************************/

// 找左右最大区间
class Solution {
    func trap(_ height: [Int]) -> Int {
        var result = 0
        var start = findStartIndex(height, 0) 
        while start != -1 {
            let end = findEndIndex(height, start)
            if end != -1 {
                let low = min(height[start],height[end])
                var area = low * (end-start)
                for i in start+1..<end {
                    if height[i] > low {
                        area -= low
                    } else {
                        area = area - height[i]
                    }
                }
                area -= low
                
                result += area
                start = findStartIndex(height, end)
            } else {
                break
            }
        }
        return result
    }

    func findStartIndex(_ height: [Int], _ startPoint: Int) -> Int {
        var result = -1
        if (startPoint >= height.count) {
            return result
        }
        for (index, num) in height.enumerated() {
            if index < startPoint {
                continue
            }
            if index+1<height.count, num > height[index+1] {
                result = index
                break
            }
        }
        return result
    }

    func findEndIndex(_ height: [Int], _ startPoint: Int) -> Int {
        var result = -1
        if (startPoint >= height.count) {
            return result
        }
        let startVal = height[startPoint]
        for (index, num) in height.enumerated() {
            if index <= startPoint {
                continue
            }
            if index-1>0, num >= height[index-1] {
                result = index
                // 当出现高于 startVal
                if num >= startVal {
                    break
                }
                // 下降情况 需要判断后面是否有更大值
                if index+1<height.count, num > height[index+1] {
                    for i in index+1..<height.count {
                        if height[i] > height[result] {
                            result = i 
                        }
                        if height[i] > startVal {
                            break
                        }
                    }
                    break
                }
            }
        }
        return result
    }
}

// 解法2: 每个元素的雨水值为 min(maxLeft, maxRight)-height[i]
class Solution2 {
    func trap(_ height: [Int]) -> Int {
        var maxVal = -1
        var leftMax: [Int] = []
        for i in 0..<height.count {
            maxVal = max(maxVal, height[i])
            leftMax.append(maxVal)
        }
        maxVal = -1
        var rightMax: [Int] = []
        for i in (0..<height.count).reversed() {
            maxVal = max(maxVal, height[i])
            rightMax.append(maxVal)
        }
        var ans = 0
        for i in 0..<height.count {
            ans += min(leftMax[i], rightMax[height.count-i-1]) - height[i]
        }
        return ans
    }
}

// let height = [0,1,0,2,1,0,1,3,2,1,2,1] //6 
// let height = [5,4,1,2] // 1
// let height = [5,2,1,2,1,5] // 14

// let height = [6,4,2,0,3,2,0,3,1,4,5,3,2,7,5,3,0,1,2,1,3,4,6,8,1,3] //83
// let height = [6,4,2,0,3,2,0,3,1,4,5,3,2,7]
// let height = [7,5,3,0,1,2,1,3,4,6,8,1,3]

let height = [9,6,8,8,5,6,3] //3

let area = Solution().trap(height)
print("s1 area = \(area)")

let area2 = Solution2().trap(height)
print("s2 area = \(area2)")