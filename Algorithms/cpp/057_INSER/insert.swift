/**
 * https://leetcode-cn.com/problems/insert-interval/
 * 
 */


class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count == 0 else {
            return [newInterval]
        }
        // var res = Array<[Int]>()
        var res = [intervals[0]]
        
        for i in 0..<intervals.count {
            var last: [Int]! = res.last

            if newInterval[0] < last[0] && newInterval[1]+1 >= last[0] {
                last[0] = newInterval[0]
            }
            if newInterval[0]-1 <= last[1] && newInterval[1] > last[1] {
                last[1] = newInterval[1]
            }

            let current = intervals[i]
            // merge current & last

            // update
            if last[0] != res.last![0] || last[1] != res.last![1] {
                res[res.count-1] = last
            }

            // try append new


            // append current 

        }
        
        return res
    }
}

let intervals = [[1,3],[6,9]]
let newInterval = [2,5]
let res = Solution().insert(intervals, newInterval)
print("res = \(res)")

