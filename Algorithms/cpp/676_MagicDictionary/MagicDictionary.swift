/*
* https://leetcode-cn.com/problems/implement-magic-dictionary/
*/

class MagicDictionary {
    var words = [String]()
    var mDict = [String:Set<String>]()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    func buildDict(_ dictionary: [String]) {
        words = dictionary
        for word in dictionary {
            let subwords = getSubwords(word)
            mDict[word] = subwords
        }
        print("mDict = \(mDict)")
    }
    
    func search(_ searchWord: String) -> Bool {
        let searchWords = getSubwords(searchWord) 
        // for tword in searchWords {
        //     for key in mDict.keys {
        //         let wordSet = mDict[key]!
        //         if key != searchWord && wordSet.contains(tword) {
        //             return true
        //         }
        //     }
        // }
        for key in mDict.keys {
            if key == searchWord {
                break
            }
            var found = false
            for tword in searchWords {
                let wordSet = mDict[key]!
                if wordSet.contains(tword) {
                    if found {
                        found = false
                        break
                    }
                    found = true
                }
            }
            if found {
                return true
            }
        }
        return false
    }

    func getSubwords(_ word: String) -> Set<String> {
        var subwords = Set<String>()
        for i in 0..<word.count {
            var subword = word 
            subword.remove(at: subword.index(subword.startIndex, offsetBy: i))
            subwords.insert(subword)
        }
        return subwords
    }
}

/**
 * Your MagicDictionary object will be instantiated and called as such:
 * let obj = MagicDictionary()
 * obj.buildDict(dictionary)
 * let ret_2: Bool = obj.search(searchWord)
 */

// let dictionary = ["hello", "leetcode"]
// let obj = MagicDictionary()
// obj.buildDict(dictionary)
// let hello = obj.search("hello")
// print("hello = \(hello)")

// let hhllo = obj.search("hhllo")
// print("hhllo = \(hhllo)")

// let hell = obj.search("hell")
// print("hell = \(hell)")

let dictionary = [String]()
let obj = MagicDictionary()
obj.buildDict(dictionary)
let a = obj.search("a")
print("a = \(a)")

// let hhllo = obj.search("hhllo")
// print("hhllo = \(hhllo)")

// let hell = obj.search("hell")
// print("hell = \(hell)")