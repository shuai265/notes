/********************************************************************************** 
 * 
 * Given a 2D board and a word, find if the word exists in the grid.
 * 
 * The word can be constructed from letters of sequentially adjacent cell, 
 * where "adjacent" cells are those horizontally or vertically neighboring. 
 * The same letter cell may not be used more than once.
 * 
 * For example,
 * Given board = 
 * 
 * [
 *   ["ABCE"],
 *   ["SFCS"],
 *   ["ADEE"]
 * ]
 * 
 * word = "ABCCED", -> returns true,
 * word = "SEE", -> returns true,
 * word = "ABCB", -> returns false.
 * 
 *               
 **********************************************************************************/

struct Pos: Hashable{
    var x: Int 
    var y: Int
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let wordList = Array(word)
        var usingPos = Set<Pos>()
        for x in 0..<board.count {
            for y in 0..<board[0].count {
                if find(board, wordList, Pos(x, y), &usingPos) {
                    return true
                }
            }
        }
        return false
    }

    func find(_ board: [[Character]], _ word: [Character], _ pos: Pos, _ usingPos: inout Set<Pos>) -> Bool {
        if usingPos.contains(pos) {
            return false
        } else {
            if board[pos.x][pos.y] == word[0] {
                usingPos.insert(pos)
                let nextword = Array(word[1..<word.count])
                if nextword.count == 0 {
                    return true
                }
                // 找下一个
                let steps = [(0,1),(0,-1),(1,0),(-1,0)]
                for step in steps {
                    let nextPos = Pos(pos.x+step.0, pos.y+step.1)
                    if nextPos.x>=0, nextPos.x<board.count, nextPos.y>=0, nextPos.y<board[0].count  {
                        if usingPos.contains(nextPos) {
                            continue
                        }
                        if find(board, nextword, nextPos, &usingPos) {
                            return true
                        }
                    }
                }
                // pop
                usingPos.remove(pos)
            }
        }
        return false
    }
}


let strsList = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
// let strsList = [["a"]]
var board: [[Character]] = []
for strs in strsList {
    var chars: [Character] = []
    for str in strs {
        chars.append(Character(str))
    }
    board.append(chars)
}

let word = "ABCCED"
// let word = "SEE"
// let word = "ABCB"
// let word = "a"
let ans = Solution().exist(board, word)
print("ans=\(ans)")
