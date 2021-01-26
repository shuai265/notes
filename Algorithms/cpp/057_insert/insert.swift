/**
 * https://leetcode-cn.com/problems/insert-interval/
 * 
 */


class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count != 0 else {
            return [newInterval]
        }
        var res = Array<[Int]>()
        var mergedOrInserted = false
        var closed = false
        for i in 0..<intervals.count {
            let current = intervals[i]
            if !mergedOrInserted {
                // check if can merge with current OR insert
                // merge
                if let mergedRange = mergeTwo(current, newInterval) {
                    res.append(mergedRange)
                    mergedOrInserted = true
                } else {
                    // insert before current
                    if newInterval[1] < current[0] {
                        res.append(newInterval)
                        res.append(current)
                        mergedOrInserted = true
                        closed = true
                    } else if i == intervals.count-1 {
                    // check insert behind last one
                        if newInterval[0] > current[1] {
                            res.append(current)
                            res.append(newInterval)
                            mergedOrInserted = true
                            closed = true
                        } else {
                            // do nothing, error
                        }
                    } else {
                        res.append(current)
                    }
                }
            } else if !closed {
                // merged but not closed, check current with res.last 
                let last = res.last 
                if let mergedRange = mergeTwo(last!, current) {
                    res[res.count-1] = mergedRange
                } else {
                    res.append(current)
                    closed = true
                }
            } else {
                // merged & closed, just append new elements
                res.append(current)
            }
        }
        return res
    }


    func mergeTwo(_ range1: [Int], _ range2: [Int]) -> [Int]? {
        if range2[0] <= range1[1] && range2[1] >= range1[0] {
            // print("merged: \([min(range1[0], range2[0]), max(range1[1], range2[1])])")
            return [min(range1[0], range2[0]), max(range1[1], range2[1])]
        } else {
            // print("try merge \(range1) with \(range2)) failed")
            return nil
        }
    }
}

class Solution2 {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count != 0 else {
            return [newInterval]
        }
        var res: [[Int]] = []
        var preMerged = false
        var merged = false
        for i in 0..<intervals.count {
            let current = intervals[i]
            // print("start handle \(current)")
            if current[0] > newInterval[1] || current[1] < newInterval[0] {
                // print("no common, just append")
                if !merged && current[0] > newInterval[1]{
                    res.append(newInterval)
                    merged = true
                }
                res.append(current)
                preMerged = false
            } else {
                // 有交集
                if preMerged {
                    let newInter = res.last!
                    let mergedRange = [min(current[0], newInter[0]), max(current[1], newInter[1])]
                    res[res.count-1] = mergedRange
                } else {
                    let mergedRange = [min(current[0], newInterval[0]), max(current[1], newInterval[1])]
                    res.append(mergedRange)
                }
                preMerged = true
                merged = true
            }
        }
        if !merged {
            res.append(newInterval)
        }
        return res
    }
}


let intervals = [[1,3],[6,9]]
let newInterval = [2,5]

// let intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
// let newInterval = [4,8]

// let intervals = [[1,5]]
// let newInterval = [6,8]

print("intervals = \(intervals)\nnewInterval = \(newInterval)")
let res = Solution().insert(intervals, newInterval)
let res2 = Solution2().insert(intervals, newInterval)
print("res = \(res) \nres2 = \(res2)")

