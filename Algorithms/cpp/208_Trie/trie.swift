class Trie {
    // var trieDict: [String: String] = [:]
    var trieSet = Set<String>()
    var wordSet = Set<String>()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        wordSet.insert(word)
        for i in 0...word.count {
            let key = String(word.prefix(i))
            trieSet.insert(key)
        }
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        if wordSet.contains(word) {
            return true
        }
        return false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        if trieSet.contains(prefix) {
            return true
        }
        return false
    }
}