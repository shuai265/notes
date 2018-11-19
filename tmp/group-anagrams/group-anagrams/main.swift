//
//  main.swift
//  group-anagrams
//
//  Created by shuai.liu on 2018/11/19.
//  Copyright © 2018 ihandy. All rights reserved.
//

import Foundation


class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var rd = [String:[String]]()
        for item in strs {
            let key = String(Array(item).sorted())
            if rd.keys.contains(key) {
                var array = rd[key]
                array?.append(item)
                rd.updateValue(array!, forKey: key)
            } else {
                rd.updateValue([item], forKey:key )
            }
        }
        var result = [[String]]()
        for item in rd.values {
            result.append(item)
        }
        return result
    }
}

var s = Solution.init()
var result = s.groupAnagrams(["sb","bs","abc","bca","dd","cba"])
print("\(result)")
