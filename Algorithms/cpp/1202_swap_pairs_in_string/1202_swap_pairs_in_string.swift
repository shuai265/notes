class Solution {
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        var map : [Int: Set<Character>] = [:]
        var allChars : Set<Character> = Set<Character>()
        for i in 0..<s.count {
            // print("i = \(i)")
            //str[str.index(str.startIndex, offsetBy: i)
            allChars.insert(s[s.index(s.startIndex, offsetBy: i)])
        }
        print("allChars = \(allChars)")
        
        var idxMap : [Int: Set<Int>] = [:]
        for i in 0..<pairs.count {
            let pair = pairs[i]
            // print("pair = \(pair)")
            for j in 0..<pair.count {
                let num = pair[j]
                var idxSet = Set<Int>()
                if idxMap.keys.contains(num) {
                    idxSet = Set(idxMap[num]!)
                    // print("already exist set = \(idxSet)")
                }
                idxSet.insert(num)
                idxSet.insert(pair[pair.count-j-1])
                // print("new set = \(idxSet)")
                idxMap[num] = idxSet
            }
        }
        print("idxMap = \(idxMap), idxMap.keys = \(idxMap.keys), \(type(of: idxMap.keys))")

        for num in idxMap.keys {
            print("\(num), \(type(of: num))")
            var idxSet = Set(idxMap[num]!)
            for j in idxSet {
                let jSet = idxMap[j]
                for k in jSet! {
                    idxSet.insert(k)
                }
            }
            idxMap[num] = idxSet
        }
        print("idxMap = \(idxMap), idxMap.keys = \(idxMap.keys), \(type(of: idxMap.keys))")

        for i in 0..<s.count {
            // print("i = \(i)")
            
        }
        return ""
    }
}


let s = "dcab"
let pairs = [[0,3],[1,2],[0,2]]
let res = Solution().smallestStringWithSwaps(s, pairs)
