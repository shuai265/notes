
/********************************************************************************** 
* 
* The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: 
* (you may want to display this pattern in a fixed font for better legibility)
* 
* P   A   H   N
* A P L S I I G
* Y   I   R
* 
* And then read line by line: "PAHNAPLSIIGYIR"
* 
* Write the code that will take a string and make this conversion given a number of rows:
* 
* string convert(string text, int nRows);
* 
* convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
* 
*               
**********************************************************************************/

// O(n)
class Solution {
    func convert(_ str: String, _ lineCnt: Int) -> String {
        if str.count <= lineCnt {
            return str
        }

        var subStrs = [String]()
        var pos = 0
        var flag = true
        while flag {
            var tail = pos + lineCnt - 1 
            if tail >= str.count {
                tail = str.count - 1
                flag = false
            }
            let subStr = str[str.index(str.startIndex, offsetBy: pos)...str.index(str.startIndex, offsetBy: tail)]
            subStrs.append(String(subStr))
            pos = tail
        }
        print("subStrs = \(subStrs)")
        var ans = [[Character]](repeating: [], count: lineCnt) // init size

        print("ans = \(ans)")

        // p * q = n
        for i in 0..<lineCnt { // i -> line
            var idx = 0 // idx -> str of row
            while idx<subStrs.count {
                let str = subStrs[idx]
                var offset = -1
                if idx%2 == 0 {
                    offset = i
                } else {
                    offset = lineCnt-i-1
                }
                if offset >= 0 && offset < str.count {
                    let char = str[str.index(str.startIndex, offsetBy: offset)]
                    ans[i].append(char)
                }
                idx += 1
                if i==0 || i==lineCnt-1 {
                    idx += 1
                }
            }
        }

        var chars = [Character]()
        for charArr in ans {
            chars.append(contentsOf: charArr)
        }
        return String(chars)
    }
}

let str = "PAYPALISHIRING"
let ans = Solution().convert(str, 3)
let t = "PAHNAPLSIIGYIR" == ans
print("ans = \(ans), ans is \(t)")
