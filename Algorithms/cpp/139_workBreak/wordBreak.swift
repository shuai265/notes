
/**
 * 给定一个非空字符串 s 和一个包含非空单词列表的字典 wordDict，判定 s 是否可以被空格拆分为一个或多个在字典中出现的单词。
 * 说明：
 * 拆分时可以重复使用字典中的单词。
 * 你可以假设字典中没有重复的单词。
 * 示例 1：
 * 
 * 输入: s = "leetcode", wordDict = ["leet", "code"]
 * 输出: true
 * 解释: 返回 true 因为 "leetcode" 可以被拆分成 "leet code"。
 * 示例 2：
 * 输入: s = "applepenapple", wordDict = ["apple", "pen"]
 * 输出: true
 * 解释: 返回 true 因为 "applepenapple" 可以被拆分成 "apple pen apple"。
 *      注意你可以重复使用字典中的单词。
 * 示例 3：
 * 输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 * 输出: false
 * 链接：https://leetcode-cn.com/problems/word-break
 */

// import Foundation

// class Solution {
//     func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//         if s.count == 0 {
//             return true
//         }
//         var canBreak = false
//         for word in wordDict {
//             if let range = s.range(of: word) {
//                 let leftStr = String(s.prefix(upTo: range.lowerBound))
//                 let rightStr = String(s.suffix(from: range.upperBound))
//                 if wordBreak(leftStr, wordDict), wordBreak(rightStr, wordDict) {
//                     canBreak = true
//                     break
//                 }
//             }
//         }
//         return canBreak
//     }
// }

class Solution2 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var wordSet = Set<String>()
        for word in wordDict {
            wordSet.insert(word)
        }
        return helper(s, wordSet)
    }

    func helper(_ s: String, _ wordSet: Set<String>) -> Bool {
        // print("validate s=\(s)")
        if s.count == 0 {
            return true
        }
        if wordSet.contains(s) {
            return true
        }
        var canBreak = false
        for i in 0..<s.count {
            for j in i..<s.count {
                let range = i...j
                let startIndex = s.index(s.startIndex, offsetBy: range.lowerBound)
                let endIndex = s.index(s.startIndex, offsetBy: range.upperBound)
                let subStr = String(s[startIndex..<endIndex])
                if wordSet.contains(subStr) {
                    let leftStr = String(s.prefix(range.lowerBound))
                    let rightStr = String(s.suffix(s.count - range.upperBound))
                    // print("subStr=\(subStr),left = \(leftStr), right = \(rightStr)")
                    if helper(leftStr, wordSet), helper(rightStr, wordSet) {
                        canBreak = true
                        break
                    }
                }
            }
        }
        return canBreak
    }
}

class Solution3 {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var wordSet = Set<String>()
        for word in wordDict {
            wordSet.insert(word)
        }
        var map: [Int: Bool] = [:]
        return helper(s, wordSet, 0, &map)
    }

    func helper(_ s: String, _ wordSet: Set<String>, _ start: Int, _ map: inout [Int: Bool]) -> Bool {
        // print("start=\(start)")
        if s.count == start {
            return true
        }
        if nil != map[start] {
            return map[start]!
        }
        for end in start...s.count {            
            let startIndex = s.index(s.startIndex, offsetBy: start)
            let endIndex = s.index(s.startIndex, offsetBy: end)
            let subStr = String(s[startIndex..<endIndex])            
            if wordSet.contains(subStr), helper(s, wordSet, end, &map) {
                map[start] = true
                return true
            }
        }
        map[start] = false
        return false
    }
}

// let s = "leetcodeleetleet"
// let wordDict = ["leet", "code"]
let s = "fohhemkkaecojceoaejkkoedkofhmohkcjmkggcmnami"
let wordDict = ["kfomka","hecagbngambii","anobmnikj","c","nnkmfelneemfgcl","ah","bgomgohl","lcbjbg","ebjfoiddndih","hjknoamjbfhckb","eioldlijmmla","nbekmcnakif","fgahmihodolmhbi","gnjfe","hk","b","jbfgm","ecojceoaejkkoed","cemodhmbcmgl","j","gdcnjj","kolaijoicbc","liibjjcini","lmbenj","eklingemgdjncaa","m","hkh","fblb","fk","nnfkfanaga","eldjml","iejn","gbmjfdooeeko","jafogijka","ngnfggojmhclkjd","bfagnfclg","imkeobcdidiifbm","ogeo","gicjog","cjnibenelm","ogoloc","edciifkaff","kbeeg","nebn","jdd","aeojhclmdn","dilbhl","dkk","bgmck","ohgkefkadonafg","labem","fheoglj","gkcanacfjfhogjc","eglkcddd","lelelihakeh","hhjijfiodfi","enehbibnhfjd","gkm","ggj","ag","hhhjogk","lllicdhihn","goakjjnk","lhbn","fhheedadamlnedh","bin","cl","ggjljjjf","fdcdaobhlhgj","nijlf","i","gaemagobjfc","dg","g","jhlelodgeekj","hcimohlni","fdoiohikhacgb","k","doiaigclm","bdfaoncbhfkdbjd","f","jaikbciac","cjgadmfoodmba","molokllh","gfkngeebnggo","lahd","n","ehfngoc","lejfcee","kofhmoh","cgda","de","kljnicikjeh","edomdbibhif","jehdkgmmofihdi","hifcjkloebel","gcghgbemjege","kobhhefbbb","aaikgaolhllhlm","akg","kmmikgkhnn","dnamfhaf","mjhj","ifadcgmgjaa","acnjehgkflgkd","bjj","maihjn","ojakklhl","ign","jhd","kndkhbebgh","amljjfeahcdlfdg","fnboolobch","gcclgcoaojc","kfokbbkllmcd","fec","dljma","noa","cfjie","fohhemkka","bfaldajf","nbk","kmbnjoalnhki","ccieabbnlhbjmj","nmacelialookal","hdlefnbmgklo","bfbblofk","doohocnadd","klmed","e","hkkcmbljlojkghm","jjiadlgf","ogadjhambjikce","bglghjndlk","gackokkbhj","oofohdogb","leiolllnjj","edekdnibja","gjhglilocif","ccfnfjalchc","gl","ihee","cfgccdmecem","mdmcdgjelhgk","laboglchdhbk","ajmiim","cebhalkngloae","hgohednmkahdi","ddiecjnkmgbbei","ajaengmcdlbk","kgg","ndchkjdn","heklaamafiomea","ehg","imelcifnhkae","hcgadilb","elndjcodnhcc","nkjd","gjnfkogkjeobo","eolega","lm","jddfkfbbbhia","cddmfeckheeo","bfnmaalmjdb","fbcg","ko","mojfj","kk","bbljjnnikdhg","l","calbc","mkekn","ejlhdk","hkebdiebecf","emhelbbda","mlba","ckjmih","odfacclfl","lgfjjbgookmnoe","begnkogf","gakojeblk","bfflcmdko","cfdclljcg","ho","fo","acmi","oemknmffgcio","mlkhk","kfhkndmdojhidg","ckfcibmnikn","dgoecamdliaeeoa","ocealkbbec","kbmmihb","ncikad","hi","nccjbnldneijc","hgiccigeehmdl","dlfmjhmioa","kmff","gfhkd","okiamg","ekdbamm","fc","neg","cfmo","ccgahikbbl","khhoc","elbg","cbghbacjbfm","jkagbmfgemjfg","ijceidhhajmja","imibemhdg","ja","idkfd","ndogdkjjkf","fhic","ooajkki","fdnjhh","ba","jdlnidngkfffbmi","jddjfnnjoidcnm","kghljjikbacd","idllbbn","d","mgkajbnjedeiee","fbllleanknmoomb","lom","kofjmmjm","mcdlbglonin","gcnboanh","fggii","fdkbmic","bbiln","cdjcjhonjgiagkb","kooenbeoongcle","cecnlfbaanckdkj","fejlmog","fanekdneoaammb","maojbcegdamn","bcmanmjdeabdo","amloj","adgoej","jh","fhf","cogdljlgek","o","joeiajlioggj","oncal","lbgg","elainnbffk","hbdi","femcanllndoh","ke","hmib","nagfahhljh","ibifdlfeechcbal","knec","oegfcghlgalcnno","abiefmjldmln","mlfglgni","jkofhjeb","ifjbneblfldjel","nahhcimkjhjgb","cdgkbn","nnklfbeecgedie","gmllmjbodhgllc","hogollongjo","fmoinacebll","fkngbganmh","jgdblmhlmfij","fkkdjknahamcfb","aieakdokibj","hddlcdiailhd","iajhmg","jenocgo","embdib","dghbmljjogka","bahcggjgmlf","fb","jldkcfom","mfi","kdkke","odhbl","jin","kcjmkggcmnami","kofig","bid","ohnohi","fcbojdgoaoa","dj","ifkbmbod","dhdedohlghk","nmkeakohicfdjf","ahbifnnoaldgbj","egldeibiinoac","iehfhjjjmil","bmeimi","ombngooicknel","lfdkngobmik","ifjcjkfnmgjcnmi","fmf","aoeaa","an","ffgddcjblehhggo","hijfdcchdilcl","hacbaamkhblnkk","najefebghcbkjfl","hcnnlogjfmmjcma","njgcogemlnohl","ihejh","ej","ofn","ggcklj","omah","hg","obk","giig","cklna","lihaiollfnem","ionlnlhjckf","cfdlijnmgjoebl","dloehimen","acggkacahfhkdne","iecd","gn","odgbnalk","ahfhcd","dghlag","bchfe","dldblmnbifnmlo","cffhbijal","dbddifnojfibha","mhh","cjjol","fed","bhcnf","ciiibbedklnnk","ikniooicmm","ejf","ammeennkcdgbjco","jmhmd","cek","bjbhcmda","kfjmhbf","chjmmnea","ifccifn","naedmco","iohchafbega","kjejfhbco","anlhhhhg"]
// let s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
// let wordDict = ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]
// print("s.count=\(s.count)")

// let ans = Solution().wordBreak(s, wordDict)
// print("\(ans)")
// let ans2 = Solution2().wordBreak(s, wordDict) 
// print("\(ans2)")
let ans3 = Solution3().wordBreak(s, wordDict) 
print("\(ans3)")


// let s = "abcdd"
// let word = "cd"
// let word = "ab"
// let range = s.range(of: word)!
// let leftStr = s.prefix(upTo: range.lowerBound)
// print("\(leftStr)")
// let rightStr = s.suffix(from: range.upperBound)
// print("\(rightStr)")

