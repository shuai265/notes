class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let chars = [
            ["a", "b", "c"],
            ["d", "e", "f"],
            ["g", "h", "i"],
            ["j", "k", "l"],
            ["m", "n", "o"],
            ["p", "q", "r", "s"],
            ["t", "u", "v"],
            ["w", "x", "y", "z"]
            ]
        
        var nums = [Int]()
        for (_, char) in Array(digits).enumerated() {
            nums.append(char.wholeNumberValue!)
        }

        var result = [String]()
        for i in 0..<nums.count {
            let num = nums[i]
            let numChars = chars[num-2]
            // print("i = \(i), numChars = \(numChars), result = \(result)")

            if result.count == 0 {
                result = numChars
                continue
            }

            var newRes = [String]()
            for (idx, char) in numChars.enumerated() {
                var substrs = result
                // print("substr begin = \(substrs), char = \(char)")
                for j in 0..<substrs.count {
                    var str = substrs[j]
                    str += char
                    substrs[j] = str
                }
                // print("substr end = \(substrs)")
                newRes += substrs
            }
            result = newRes
        }
        return result
    }
}

let digits = "23"
let ans = Solution().letterCombinations(digits)
print("ans = \(ans)")
