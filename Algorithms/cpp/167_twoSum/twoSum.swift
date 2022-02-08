class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var numSet = Set<Int>()
        var numMap = [Int: [Int]]() // num: idxs
        for (idx, num) in numbers.enumerated() {
            if numSet.contains(num) {
                var idxs = numMap[num]!
                idxs.append(idx)
                numMap[num] = idxs
            } else {
                numSet.insert(num)
                numMap[num] = [idx]
            }
        }
        var ans = [Int]()
        for (idx, num) in numbers.enumerated() {
            print("idx = \(idx), num=\(num)")
            let d = target - num
            if d == num {
                ans = [idx+1, idx+2]
                break
            } else if numSet.contains(d) {
                // var numIdxs = numMap[num]!
                // let first = numIdxs[0]
                ans.append(idx+1)
                let dIdxs = numMap[d]!
                let second = dIdxs[0]
                ans.append(second+1)
                break
            }
        }
        return ans
    }
}

// let numbers = [2,7,11,15]
// let target = 9
// let numbers = [2,3,4]
// let target = 6
// let numbers = [-1,0]
// let target = -1
let numbers = [0,0,3,4]
let target = 0

let ans = Solution().twoSum(numbers, target)
print("ans = \(ans)")