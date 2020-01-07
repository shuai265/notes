
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var numSet = Set<Int>()
        var d: [Int: Bool] = [:]
        for num in nums {
            if numSet.contains(num) {
                d[num] = false
            } else {
                numSet.insert(num)
                d[num] = true
            }
        }
        for num in numSet {
            if d[num]! {
                return num
            }
        }
        return -1
    }
}

class Solution2 {
    func singleNumber(_ nums: [Int]) -> Int {
        return 0
    }
}