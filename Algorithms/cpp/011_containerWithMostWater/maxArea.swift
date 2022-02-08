class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var ans = 0
        var left = 0
        var right = height.count-1
        while left <= right {
            var area = min(height[left], height[right]) * (right - left)
            ans = max(ans, area)

            if height[left] < height[right] {
                repeat {
                    left += 1
                } while left < right && height[left] < height[left-1]
            } else {
                repeat {
                    right -= 1
                } while left < right && height[right] < height[right+1]
            }
        }
        return ans
    }
}

// let height = [1,8,6,2,5,4,8,3,7] // 49
// let ans = 49

// let height = [4,3,2,1,4]
// let ans = 16

// let height = [1,2,1]
// let ans = 2

// let height = [1,1]
// let ans = 1

let height = [2,3,10,5,7,8,9]
let ans = 36

let area = Solution().maxArea(height)

print("area = \(area), ans is \(ans == area)")

