
class Solution {
    func removeInvalidParentheses(_ s: String) -> [String] {
        var mark = 0
        let lParenthes = Character("(")
        let rParenthes = Character(")")
        var badRightPos: [Int] = []
        var badLeftPos: [Int] = []
        for (idx,c) in s.enumerated() {
            if c == lParenthes {
                mark += 1
            } else if c == rParenthes {
                mark -= 1
            }
            // 多了一个右括号
            if mark < 0 {
                badRightPos.append(idx)
                // badRightPos.append(idx-badRightPos.count)
                mark = 0
            }
        }

        mark = 0
        for (idx,c) in s.reversed().enumerated() {
            if c == lParenthes {
                mark += 1
            } else if c == rParenthes {
                mark -= 1
            }
            // 多了一个左括号
            if mark > 0 {
                // badLeftPos.append(s.count-idx-1)
                badLeftPos.append(s.count-idx-1)
            }
        }

        print("badRightPos=\(badRightPos), badLeftPos=\(badLeftPos)")
        
        return []
    }

    func rmBadRight(_ s: String, _ badRightPos: [Int]) -> [String] {
        var result: [String] = []
        var badRightPos = badRightPos
        let lParenthes = Character("(")
        let rParenthes = Character(")")
        for i in 0..<s.count {
            // if badRightPos.count > 0 && i<badRightPos[0]
        }
        for (i,c) in s.enumerated() {
            if badRightPos.count > 0 {

            } else {

            }
            if c == rParenthes {

            } else {
                
            }
        }

        // for (idx,rightPos) in badRightPos.enumerated() {
        //     for (i,c) in s.enumerated() {
        //         if c == rParenthes {

        //         } else {
                    
        //         }
        //     }
        // }
        return result
    }

    func helper(_ s: String) -> [String] {
        var mark = 0
        let lParenthes = Character("(")
        let rParenthes = Character(")")
        for c in s {
            if c == lParenthes {
                mark += 1
            } else if c == rParenthes {
                mark -= 1
            }
            // 多了一个右括号
            if mark < 0 {
                
            }
        }

        return []
    }
}

// let str = "()())()"
// let str = "()())())("
let str = ")("
// for c in str.reversed() {
//     if c == Character("(") {
//         print("l")
//     } else if c == Character(")") {
//         print("r")
//     }
// }

// let ans = Solution().removeInvalidParentheses(str)
// 

// let str1: String? = "def"
// // let str2: String? = "abc"
// // let str2: String? = "abc"
// let str2: Any? = nil
// let s: String = str2 as? String ?? "NULL"
// let s2 = str2 as? String ?? "NULL"
// print("\(str2) \(type(of: str2))")
// print("\(s) \(type(of: s))")
// print("\(s2) \(type(of: s2))")


let str1: Any? = "def"
// let str1: Any? = nil
// let str2: Any? = nil
// let s: String = str2 as? String ?? str1
// let s2 = str1 as! String ?? "NULL"
let s2 = str1 as? String ?? "NULL"
// print("\(str2) \(type(of: str2))")
// print("\(s) \(type(of: s))")
print("xxx")

// print("\(s2) \(type(of: s2))")

// let str1: Any? = "def"
// print("\(str1 as? String) \(type(of: str1 as? String))")

print("\(str1 as? String == nil ? "NULL" : str1 as! String)")
