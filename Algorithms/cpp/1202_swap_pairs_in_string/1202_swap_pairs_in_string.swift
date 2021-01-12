class Solution {
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        if pairs.count == 0 {
            return s
        }

        var setList: [Set<Int>] = []
        for i in 0..<pairs.count {
            let pair = pairs[i]
            setList.append(Set<Int>(pair))
        }
        print("setList = \(setList)")
        var arrow = 0
        while arrow < setList.count {
            let currentSet = setList[arrow]

            var i = 0
            while i<setList.count {
                if i == arrow {
                    print("do continue")
                    i += 1
                    continue
                }
                let otherSet = setList[i]
                print("currentSet = \(currentSet), otherSet = \(otherSet)")
                if let mergedSet = mergeSets(currentSet, otherSet) {
                    print("do merge, setList = \(setList), arrow = \(arrow), i = \(i), currentSet = \(currentSet), otherSet = \(otherSet), mergedSet = \(mergedSet)")
                    setList[arrow] = mergedSet
                    print("xxx")
                    setList.remove(at: i)
                    if i > arrow {
                        i -= 1
                    }
                }
                i += 1
            }
            
            arrow += 1
        }
        print("final setList = \(setList)")

        var chars = Array(s) 
        for idxSet in setList {
            var subChars: [Character] = []
            var sortedIdxs: [Int] = []
            for idx in idxSet {
                let char = chars[idx]
                subChars.append(char)
                sortedIdxs.append(idx)
            }
            subChars.sort{ $0 < $1 }
            sortedIdxs.sort{ $0 < $1 }
            print("subChars = \(subChars), sortedIdxs = \(sortedIdxs)")
            for i in 0..<sortedIdxs.count {
                let idx = sortedIdxs[i]
                let char = subChars[i]
                chars[idx] = char
            }
        }
        print("result chars = \(chars)")
        return String(chars)
    }

    func mergeSets(_ numSet1: Set<Int>, _ numSet2: Set<Int>) -> Set<Int>? {
        let intersectS = numSet1.intersection(numSet2)
        if (intersectS.count > 0) {
            return numSet1.union(numSet2)
        } else {
            return nil
        }
    }

    // func smallestStringWithSwapsOld(_ s: String, _ pairs: [[Int]]) -> String {
    //     var map : [Int: Set<Character>] = [:]
    //     var allChars : Set<Character> = Set<Character>()
    //     for i in 0..<s.count {
    //         // print("i = \(i)")
    //         //str[str.index(str.startIndex, offsetBy: i)
    //         allChars.insert(s[s.index(s.startIndex, offsetBy: i)])
    //     }
    //     print("allChars = \(allChars)")
        
    //     var idxMap : [Int: Set<Int>] = [:]
    //     for i in 0..<pairs.count {
    //         let pair = pairs[i]
    //         // print("pair = \(pair)")
    //         for j in 0..<pair.count {
    //             let num = pair[j]
    //             var idxSet = Set<Int>()
    //             if idxMap.keys.contains(num) {
    //                 idxSet = Set(idxMap[num]!)
    //                 // print("already exist set = \(idxSet)")
    //             }
    //             idxSet.insert(num)
    //             idxSet.insert(pair[pair.count-j-1])
    //             // print("new set = \(idxSet)")
    //             idxMap[num] = idxSet
    //         }
    //     }
    //     print("idxMap = \(idxMap), idxMap.keys = \(idxMap.keys), \(type(of: idxMap.keys))")
    //     for num in idxMap.keys {
    //         print("\(num), \(type(of: num))")
    //         var idxSet = Set(idxMap[num]!)
    //         for j in idxSet {
    //             let jSet = idxMap[j]
    //             for k in jSet! {
    //                 idxSet.insert(k)
    //             }
    //         }
    //         idxMap[num] = idxSet
    //     }
    //     print("idxMap = \(idxMap), idxMap.keys = \(idxMap.keys), \(type(of: idxMap.keys))")

    //     for i in 0..<s.count {
    //         // print("i = \(i)")
            
    //     }
    //     return ""
    // }
}


// let s = "dcab"
// let pairs = [[0,3],[1,2],[0,2]]

// let s = "dcab"
// let pairs = [[0,3],[1,2]]
let s = "qdwyt"
let pairs = [[2,3],[3,2],[0,1],[4,0],[3,2]]
let res = Solution().smallestStringWithSwaps(s, pairs)
print(res)
