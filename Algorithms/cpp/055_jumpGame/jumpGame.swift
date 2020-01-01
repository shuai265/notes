/********************************************************************************** 
* 
* Given an array of non-negative integers, you are initially positioned at the first index of the array.
* 
* Each element in the array represents your maximum jump length at that position. 
* 
* Determine if you are able to reach the last index.
* 
* For example:
* A = [2,3,1,1,4], return true.
* 
* A = [3,2,1,0,4], return false.
* 
*               
**********************************************************************************/

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var map:[Int: Bool] = [:]
        return jumpHelper(nums, 0, &map)
    }

    func jumpHelper(_ nums: [Int], _ startPosition: Int, _ map: inout [Int: Bool]) -> Bool {
        let leftSteps = nums.count - 1 - startPosition        
        var canJump = false
        if map.keys.contains(startPosition) {
            return map[startPosition]!
        }
        if nums[startPosition] >= leftSteps {
            canJump = true
        } else {
            for i in (0...nums[startPosition]).reversed() {
                if i > 0 {
                    // print("startPosition=\(startPosition), leftSteps=\(leftSteps), num = \(nums[startPosition]), i=\(i), newStart = \(i + startPosition)")
                    if jumpHelper(nums, i + startPosition, &map) {
                        canJump = true
                        break
                    }
                }
            }
        }
        map[startPosition] = canJump
        return canJump
    }
}

// 从后向前
class Solution2 {
    func canJump(_ nums: [Int]) -> Bool {
        return jumpHelper(nums, nums.count-1)
    }

    func jumpHelper(_ nums: [Int], _ pos: Int) -> Bool {
        
        if pos == 0 {
            return true
        }
        for i in 1...pos {
            if nums[pos-i] >= i { // 可以跳
                return jumpHelper(nums, pos-i)
            }
        }
        return false
    }
}

// let nums = [2,3,1,1,4]
// let nums = [3,2,1,0,4]
// let nums = [2,0,6,9,8,4,5,0,8,9,1,2,9,6,8,8,0,6,3,1,2,2,1,2,6,5,3,1,2,2,6,4,2,4,3(34),0,0,0,3,8,2,4,0,1,2,0,1,4,6,5,8,0,7,9,3,4,6,6,5,8,9,3,4,3,7,0,4,9,0,9,8,4,3,0,7,7,1,9,1,9,4,9,0,1,9,5,7,7,1,5,8,2,8,2,6,8,2,2,7,5,1,7,9,6]
let nums = [2,0,6,9,8,4,5,0,8,9,1,2,9,6,8,8,0,6,3,1,2,2,1,2,6,5,3,1,2,2,6,4,2,4,3,0,0,0,3,8,2,4,0,1,2,0,1,4,6,5,8,0,7,9,3,4,6,6,5,8,9,3,4,3,7,0,4,9,0,9,8,4,3,0,7,7,1,9,1,9,4,9,0,1,9,5,7,7,1,5,8,2,8,2,6,8,2,2,7,5,1,7,9,6]
// let nums = [1,2,3,0,0,0,1,4]
// let nums = [2,0,6,9,8,4,5,0,8,9,1,2,9,6,8,8,0,6,3,1,2,2,1,2,6,5,3,1,2,2,6,4,2,4,3,0,0,0,3,8,2,4,0,1,2,0,1,4,6,5,8,0,7,9,3,4,6,6,5,8,9,3,4,3,7]
// let nums = [2,0,6,9,8,4,5,0,8,9,1,2,9,6,8,8,0,6,3,1,2,2,1,2,6,5,3,1,2,2,6,4,2,4,3,0,0,0,1]
// let nums = [8,0,6,3,1,2,2,1,2,6,5,3,1,2,2,6,4,2,4,3,0,0,0,1]
let ans = Solution().canJump(nums)
print("\(ans)")
let ans2 = Solution2().canJump(nums)
print("\(ans2)")