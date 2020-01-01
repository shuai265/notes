/********************************************************************************** 
* 
* Given a collection of intervals, merge all overlapping intervals.
* 
* For example,
* Given [1,3],[2,6],[8,10],[15,18],
* return [1,6],[8,10],[15,18].
* 
*               
**********************************************************************************/

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var ans: [[Int]] = []
        if intervals.count <= 1 {
            return intervals
        }
        for i in 0..<intervals.count {
            var currentNums = intervals[i]
            if ans.count > 0 {
                var tmpAns: [[Int]] = []
                for j in (0..<ans.count) {
                    let tNums = ans[j]
                    if (currentNums[0] > tNums[1] || currentNums[1]<tNums[0]) { // 没有重叠
                        tmpAns.append(tNums)
                    } else {
                        if tNums[0] < currentNums[0]  {
                            currentNums[0] = tNums[0]
                        }
                        if tNums[1] > currentNums[1] {
                            currentNums[1] = tNums[1]
                        }
                    }
                }
                tmpAns.append(currentNums)
                ans = tmpAns
                // let lasPos = ans.count-1
                // var lastNums = ans[lasPos]
                // let currentNums = intervals[i]
                // if (currentNums[0] > lastNums[1] || currentNums[1]<lastNums[0]) {
                //     ans.append(currentNums)
                // } else {// MERGE
                //     if currentNums[0] < lastNums[0] {
                //         lastNums[0] = currentNums[0]
                //     }
                //     if currentNums[1] > lastNums[1] {
                //         lastNums[1] = currentNums[1]
                //     }
                //     ans[lasPos] = lastNums
                // }
            } else {
                ans.append(currentNums)
            }
        }
        return ans
    }
}

// let intervals = [[1,3],[2,6],[8,10],[15,18]]

// let intervals = [[1,3]]
// let intervals = [[1,4],[0,0]]
let intervals = [[2,3],[4,5],[6,7],[8,9],[1,10]]

let ans = Solution().merge(intervals)
print("\(ans)")
