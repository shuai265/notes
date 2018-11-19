//
//  main.swift
//  group-anagrams
//
//  Created by shuai.liu on 2018/11/19.
//  Copyright © 2018 ihandy. All rights reserved.
//

import Foundation

print("Hello, World!")

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var rd = NSMutableDictionary.init()
        for (index,item) in strs.enumerated() {
            print("idx = \(index), item = \(item)")
            var ch = Array(item).sorted()
            if rd.allKeys.contains(where: ch) {
                
            }
        }
        
        var ra = [[""]]
        return ra
    }
}
