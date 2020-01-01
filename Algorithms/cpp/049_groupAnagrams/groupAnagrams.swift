/********************************************************************************** 
 * 
 * Given an array of strings, group anagrams together.
 * 
 * For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"], 
 * Return:
 * 
 * [
 *   ["ate", "eat","tea"],
 *   ["nat","tan"],
 *   ["bat"]
 * ]
 * 
 * Note:
 * 
 * For the return value, each inner list's elements must follow the lexicographic order.
 * All inputs will be in lower-case.
 * 
 * Update (2015-08-09):
 * The signature of the function had been updated to return list<list<string>> instead 
 * of list<string>, as suggested here. If you still see your function signature return 
 * a list<string>, please click the reload button  to reset your code definition.
 * 
 **********************************************************************************/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var ans: [[String]] = []
        var map: [String:[String]] = [:]
        for str in strs {
            let key = calcKey(str)
            if map.keys.contains(key) {
                var list = map[key]
                list!.append(str)
                map[key] = list
            } else {
                map[key] = [str]
            }
        }
        for key in map.keys {
            ans.append(map[key]!)
        }
        return ans
    }

    func calcKey(_ str: String) -> String {
        return String(str.sorted())
    }
}

let data = ["eat", "tea", "tan", "ate", "nat", "bat"]
// let key = Solution().calcKey(data[0])
// print("key=\(key)")
let ans = Solution().groupAnagrams(data)
print("ans=\(ans)")

