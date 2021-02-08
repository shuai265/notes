

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var longList = a.map { Int(String($0))! }
        var shortList = b.map { Int(String($0))! }
        if a.count < b.count {
            let tmp = longList
            longList = shortList
            shortList = tmp
        }

        var enter = 0
        for i in 1...longList.count {
            if i <= shortList.count {
                let num1 = longList[longList.count - i]
                let num2 = shortList[shortList.count - i]
                let sum = num1 + num2 + enter 
                enter = sum / 2
                longList[longList.count-i] = sum % 2
            } else {
                // 进位
                if enter == 0 {
                    break
                } else {
                    let num1 = longList[longList.count - i]
                    let sum = num1 + enter
                    enter = sum / 2
                    longList[longList.count-i] = sum % 2
                }
            }
            if i == longList.count && enter == 1 {
                longList.insert(1, at: 0)
            }
        }
        // print("longList = \(longList), typeof = \(type(of: longList))")
        return longList.map { String($0) }.reduce("", +)
    }
}


// let a = "1011"
// let b = "1"

// let a = "11"
// let b = "1"

// let a = "11"
// let b = "11"

// let a = "101"
// let b = "101"

let a = "0"
let b = "0"

let ans = Solution().addBinary(a, b)
print("ans = \(ans)")
