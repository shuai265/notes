class Solution {
    func myAtoi(_ s: String) -> Int {
        var characters = Array(s)
        characters = removeSpaces(characters)
        let symbol = checkSymbol(characters)
        characters = removeSymbol(characters)
        // return symbol * convertToInt(characters)
        return convertToInt(characters, symbol)
    }

    private func removeSpaces(_ characters: Array<Character>) -> Array<Character> {
        var chars = characters
        while chars.count > 0 {
            if chars[0] == " " {
                chars.remove(at: 0)
            } else {
                break
            }
        }
        return chars
    }

    private func checkSymbol(_ characters: Array<Character>) -> Int {
        if characters.count == 0 {
            return 0
        }
        if characters[0] == "-" {
            return -1
        } else {
            return 1
        }
    }

    private func removeSymbol(_ characters: Array<Character>) -> Array<Character> {
        if characters.count == 0 {
            return characters
        }
        
        var chars = characters
        if characters[0] == "+" || characters[0] == "-" {
            chars.remove(at: 0)
        }
        return chars
    }

    private func convertToInt(_ characters: Array<Character>, _ symbol: Int) -> Int {
        var hold = 0
        var ans = 0
        let zeroC = Character("0")
        let nineC = Character("9")
        let _max = Int(Int32.max)
        let _min = Int(Int32.min)
        // print("int.max = \(Int.max)")
        for i in 0..<characters.count {
            let char = characters[i]
            // print("i = \(i), char = \(char)")
            if char.asciiValue! < zeroC.asciiValue! || char.asciiValue! > nineC.asciiValue! {
                break
            }

            hold = hold*10 + char.wholeNumberValue!
            ans = hold * symbol

            if ans > _max {
                ans = _max
                break
            } else if ans < _min {
                ans = _min
                break
            }
        }
        return ans
    }
}

// let str = "  +12553"
// let str = "  +125539999999999"
// let str = "  125539999999999"
// let str = "  -125539999999999"
// let str = "  +12553999"
// let str = "4193 with words"
// let str = "words and 987"
// let str = "-91283472332"  // -2147483648
// let str = "20000000000000000000"
// let str = "-91283472332"
let str = "21474836460" // 2147483647
let num = Solution().myAtoi(str)
print("num = \(num)")