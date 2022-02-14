class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var m = n 
        var weight = 0
        while m > 0 {
            if m%2 == 1 {
                weight += 1
            }
            m /= 2
        }
        return weight
    }
}

// let num = 00000000000000000000000000001011
let num = 11
let weight = Solution().hammingWeight(num)
print("ans = \(weight)")