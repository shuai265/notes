class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var using = [[Int]]()
        for _ in 0..<board.count {
            var usingLine = [Int]()
            for _ in 0..<board[0].count {
                usingLine.append(0)
            }
            using.append(usingLine)
        }
        let chars = Array(word)
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                var tmpUsing = using.map { $0 }
                if checkExist(board, &tmpUsing, chars, 0, [i, j]) {
                    return true
                }
            }
        }
        return false
    }

    private func checkExist(_ board: [[Character]], _ using: inout [[Int]], _ chars: [Character], _ charStart: Int, _ pos: [Int]) -> Bool {
        if chars.count == charStart {
            return true
        }
        let x = pos[0]
        let y = pos[1]
        if using[x][y] != 0 {
            return false
        }

        let steps = [[0, -1], [0, 1], [1, 0], [-1, 0]]
        if chars[charStart] == board[x][y] {
            using[x][y] = 1 // mark used
            if chars.count == charStart+1 {
                return true
            }
            for step in steps {
                let newX = step[0] + x
                let newY = step[1] + y
                if newX >= 0 && newX < board.count && newY >= 0 && newY < board[0].count {
                    let found  = checkExist(board, &using, chars, charStart+1, [newX, newY])
                    if found {
                        return found
                    }
                }
            }
        }
        using[x][y] = 0 // mark unused
        return false
    }
}

let boardStrs = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
let word = "ABCCED" //true

// let boardStrs = [["a","b"],["c","d"]]
// let word = "abcd"
// [["a"]]
// "a"

// let boardStrs = [["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]]
// let word = "ABCESEEEFS"

var board = [[Character]]()
for i in 0..<boardStrs.count {
    var chars = [Character]()
    for j in 0..<boardStrs[0].count {
        chars.append(Character(boardStrs[i][j]))
    }
    board.append(chars)
}
let found = Solution().exist(board, word)
print("found = \(found)")
