class Solution {
    // 0000, 0010, 0011, 0101
    func letterCasePermutation(_ s: String) -> [String] {
        var chars = Array(s)
        var charPos = [Int]()
        for (idx, char) in chars.enumerated() {
            print("char = \(char), char > a = \(char >= Character("a"))")
            if char >= Character("a") && char <= Character("z") {
                charPos.append(idx)
            } else if char >= Character("A") && char <= Character("Z") {
                charPos.append(idx)
                let lowerChar = Character(String(char).lowercased())
                chars[idx] = lowerChar
            }
        }
        if charPos.count == 0 {
            return [s]
        }
        print("charPos = \(charPos)")
        var totalCnt = 1
        for _ in 1...charPos.count {
            totalCnt = totalCnt*2
        }
        print("totalCnt = \(totalCnt)")

        var charTyps = [String]()
        for i in 0..<totalCnt {
            charTyps.append(decToBin(i))
        }
        print("charTypes = \(charTyps)")

        var ans = [String]()
        for charType in charTyps {
            var currentChars = chars
            let typeChars = Array(charType)
            var pos = charPos.count-1
            if typeChars.count > 0 {
                for i in (0...typeChars.count-1).reversed() {
                    if typeChars[i] == Character("1") {
                        let target = charPos[pos]
                        let upperChar = Character(String(currentChars[target]).uppercased())
                        // upperChar += Character("A")-Character("a")
                        currentChars[target] = upperChar
                    }
                    pos -= 1
                }
            }
            ans.append(String(currentChars))
        }
        return ans
    }

    // MARK: - 十进制转二进制
    func decToBin(_ number:Int) -> String {
        var num = number
        var str = ""
        while num > 0 {
            str = "\(num % 2)" + str
            num /= 2
        }
        return str
    }
}

class Solution {
    // 0000, 0010, 0011, 0101
    func letterCasePermutation(_ s: String) -> [String] {

    }
    func helper(_ charLists:[[Character]], _ chars: [Character], _ idx: Int) -> [[Character]] {
        
    }
}

// let S = "a1b2"
// let S = "12345"
// let S = "3z4"
let S = "C"
let ans = Solution().letterCasePermutation(S)
print("ans = \(ans)")