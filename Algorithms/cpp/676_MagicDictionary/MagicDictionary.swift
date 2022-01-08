/*
* https://leetcode-cn.com/problems/implement-magic-dictionary/
*/

class MagicDictionary {
    var words = [String]()
    // var mDict = [String:Set<String>]()
    var mDict = [String:[String]]()
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
        for key in mDict.keys {
                        if key == searchWord || key.count != searchWord.count {
                continue
            }
            var found = false
            let mWords = mDict[key]!
            for i in 0..<key.count {
                let tWord = searchWords[i]
                let mWord = mWords[i]
                if tWord == mWord {
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

    func getSubwords(_ word: String) -> [String] {
        var subwords = [String]()
        for i in 0..<word.count {
            var subword = word 
            subword.remove(at: subword.index(subword.startIndex, offsetBy: i))
            subwords.append(subword)
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