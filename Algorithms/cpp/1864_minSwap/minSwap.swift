class Solution {
    func minSwaps(_ s: String) -> Int {
        let chars = Array(s)
        var zeroCnt = 0
        var oneCnt = 0
        var zeroMove = 0
        var oneMove = 0
        var chars1 = chars
        for (idx, c) in chars1.enumerated() {
            if c.wholeNumberValue! == 1 {
                oneCnt += 1
            } else {
                zeroCnt += 1
            }
            if idx > 0 {
                // print("idx = \(idx), c = \(c), chars[idx-1] = \(chars[idx-1])")
                if c == chars1[idx-1] {
                    if c.wholeNumberValue! == 1 {
                        chars1[idx] = Character("0")
                        oneMove += 1
                    } else {
                        chars1[idx] = Character("1")
                        zeroMove += 1 
                    }
                }
            }
        }
        var min1 = max(oneMove, zeroMove)
        if abs(zeroCnt-oneCnt) > 1 {
            return -1
        } 
        
        var chars2 = chars
        var zeroMove2 = 0
        var oneMove2 = 0
        for (idx, c) in chars2.enumerated() {
            if idx < chars.count-1 {
                // print("idx = \(idx), c = \(c), chars[idx-1] = \(chars[idx-1])")
                if c == chars2[idx+1] {
                    if c.wholeNumberValue! == 1 {
                        chars2[idx] = Character("0")
                        oneMove2 += 1
                    } else {
                        chars2[idx] = Character("1")
                        zeroMove2 += 1 
                    }
                }
            }
        }
        print("oneMove2 = \(oneMove2), zeroMove2 = \(zeroMove2)")
        var min2 = max(oneMove2, zeroMove2)

        return min(min1, min2)
    }
}

// let s = "111000" // 1
// let s = "010"  // 0
// let s = "1110" // 1
// let s = "100" // 1
let s = "0010111"
// let s = "001011"
let cnt = Solution().minSwaps(s)
print("cnt = \(cnt)")