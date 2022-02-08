/*
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
链接：https://leetcode-cn.com/problems/integer-to-roman
*/

class Solution {
    func intToRoman(_ num: Int) -> String {
        let steps = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        var result = ""
        var n = num 
        for st in steps {
            if n >= st {
                let count = n/st
                let sts = romanForInt(st)
                for _ in 1...count {
                    result += sts
                }                
                n = n%st
            }
        }
        return result
    }

    private func romanForInt(_ num: Int) -> String {
        let map = [
            "1": "I",
            "4": "IV",
            "5": "V",
            "9": "IX",
            "10": "X",
            "40": "XL",
            "50": "L",
            "90": "XC",
            "100": "C",
            "400": "CD",
            "500": "D",
            "900": "CM",
            "1000": "M"
        ]
        let k = String(num)
        let res = map[k]
        if res == nil {
            return ""
        } else {
            return res!
        }
    }
}

class Solution2 {
    func intToRoman(_ num: Int) -> String {
        let steps = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let chars = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
        var result = ""
        var n = num 
        for i in 0..<steps.count {
            let st = steps[i]
            while n >= st {
                result += chars[i]            
                n = n-st
            }
        }
        return result
    }
}

// let num = 3
// let num = 4
// let num = 5
// let num = 9
// let num = 58
let num = 3
// let num = 1994  // MCMXCIV
// let result = Solution().intToRoman(num)
let result = Solution2().intToRoman(num)
print("num = \(num), result = \(result)")