/**
 * https://leetcode-cn.com/problems/top-k-frequent-elements/
 * 给定一个非空的整数数组，返回其中出现频率前 k 高的元素。

 

示例 1:

输入: nums = [1,1,1,2,2,3], k = 2
输出: [1,2]
示例 2:

输入: nums = [1], k = 1
输出: [1]
 

提示：
你可以假设给定的 k 总是合理的，且 1 ≤ k ≤ 数组中不相同的元素的个数。
你的算法的时间复杂度必须优于 O(n log n) , n 是数组的大小。
题目数据保证答案唯一，换句话说，数组中前 k 个高频元素的集合是唯一的。
你可以按任意顺序返回答案。
 */

// O(nk)
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var valCntMap: [Int:Int] = [:]
        for num in nums {
            if valCntMap.keys.contains(num) {
                valCntMap[num] = valCntMap[num]! + 1
            } else {
                valCntMap[num] = 1
            }
        }
        var ans: [Int] = []
        for _ in 0..<k {
            var maxCnt = 0
            var val = 0
            for k in valCntMap.keys {
                if valCntMap[k]! > maxCnt {
                    maxCnt = valCntMap[k]!
                    val = k
                }
            }
            ans.append(val)
            valCntMap.removeValue(forKey: val)
        }
        return ans
    }
}


class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var valCntMap: [Int:Int] = [:]
        for num in nums {
            if valCntMap.keys.contains(num) {
                valCntMap[num] = valCntMap[num]! + 1
            } else {
                valCntMap[num] = 1
            }
        }
        var ans: [Int] = []
        var countList: [Int] = []
        for k in valCntMap.keys {
            let cnt = countList[k]
            if countList.count == 0 {
                ans.append(k)
                countList.append(cnt)
            } else if countList.count < k {
                // do insert 
                for i in 0..<countList.count {
                    if cnt > countList[i] {
                        countList.insert(newElement: Int, at: Int)
                        break
                    }
                }
            } else {

            }
        }


        for _ in 0..<k {
            var maxCnt = 0
            var val = 0
            for k in valCntMap.keys {
                if valCntMap[k]! > maxCnt {
                    maxCnt = valCntMap[k]!
                    val = k
                }
            }
            ans.append(val)
            valCntMap.removeValue(forKey: val)
        }
        return ans
    }
}

// let nums = [1,1,1,2,2,3]
// let k = 2

// let nums = [1]
// let k = 1

let nums = [-1,-1]
let k = 1

let ans = Solution().topKFrequent(nums, k)
print("ans = \(ans)")
