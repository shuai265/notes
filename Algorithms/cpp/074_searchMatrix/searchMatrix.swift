class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        for row in matrix {
            if row[0] <= target && row.last! >= target {
                var l = 0
                var r = row.count 
                while l < r {
                    let m = (l+r)/2
                    let midVal = row[m]
                    if midVal == target {
                        return true
                    } else if midVal > target {
                        r = m
                    } else {
                        l = m + 1
                    }
                }
            }
        }
        return false
    }
}