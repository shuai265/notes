/**
 * 
 */


class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var m: [Int: Int] = [:]
        var maxNum = 0
        var maxCnt = 0

        for num in nums {
            if nil != m[num] {
                let cnt = m[num]! + 1
                m[num] = cnt
                if cnt > maxCnt {
                    maxCnt = cnt 
                    maxNum = num
                }
            } else {
                m[num] = 1
                if maxCnt == 0 {
                    maxCnt = 1
                    maxNum = num
                }
            }
        }
        return maxNum
    }
}
