class Solution {
    func numberOfWeakCharacters(_ properties: [[Int]]) -> Int {
        var ppts = properties
        quickSort(&ppts, 0, properties.count-1)
        // print("sorted = \(ppts)")
        var ans = 0
        var currentMax = ppts[0] // 上一个 
        var preMax = ppts[0] // 上一个 
        for (_, property) in ppts.enumerated() {
            // print("defense = \(defense), maxDefense = \(maxDefense)")
            if property[0] < currentMax[0] && property[1] < currentMax[1] 
            || property[0] < preMax[0] && property[1] < preMax[1]  {
                // print("find \(property)")
                ans += 1
                continue
            }

            if property[0] == currentMax[0] && property[1] > currentMax[1] {
                currentMax = property
                continue
            }

            if property[0] < currentMax[0] && property[1] > currentMax[1] {
                if preMax[1] < currentMax[1] {
                    preMax = currentMax
                }
                currentMax = property
                continue
            }
        }
        return ans
    }

    // attack high->low
    func quickSort(_ properties: inout [[Int]], _ left: Int, _ right: Int) {
        // print("properties = \(properties), left = \(left), right = \(right)")
        let flag = properties[left]
        var l = left
        var r = right
        while l < r {
            while properties[r][0] <= flag[0] && l < r {
                r -= 1
            }
            if l < r {
                properties[l] = properties[r]
                l += 1
            }
            while properties[l][0] > flag[0] && l < r {
                l += 1
            }
            if l < r {
                properties[r] = properties[l]
                r -= 1
            }
        }
        properties[l] = flag
        if l - left > 1 {
            quickSort(&properties, left, l-1)
        }
        if right - r > 1 {
            quickSort(&properties, l+1 ,right)
        }
    }
}


// let properties = [[2,2],[3,3]]
// let properties = [[5,5],[6,3],[3,6]]
// let properties = [[1,5],[10,4],[4,3]]
// let properties = [[1,1],[2,1],[2,2],[1,2]]
// let properties = [[7,9],[10,7],[6,9],[10,4],[7,5],[7,10]] // 2
let properties = [[10,3],[4,6],[4,5],[5,7],[5,9],[2,1]] // 3
let ans = Solution().numberOfWeakCharacters(properties)
print("ans = \(ans)")