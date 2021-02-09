class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        var l2r = [Int]()
        for i in 0..<seats.count {
            let num = seats[i]
            if i == 0 || num == 1 {
                l2r.append(num-1)
            } else { // num == 0
                if l2r[i-1] >= 0 {
                    l2r.append(l2r[i-1] + 1)
                } else {
                    l2r.append(-1)
                }
            }
        }
        print("l2r   = \(l2r)")

        var r2l = [Int]()
        for i in 0..<seats.count {
            let num = seats[seats.count-1-i]
            if i == 0 || num == 1 {
                r2l.append(num-1)
            } else { // num == 0
                if r2l[i-1] >= 0 {
                    r2l.append(r2l[i-1] + 1)
                } else {
                    r2l.append(-1)
                }
            }
        }
        print("r2l   = \(r2l)")

        var maxDist = 0
        for i in 0..<l2r.count {
            let l = l2r[i]
            let r = r2l[r2l.count-i-1]
            var cMax = 0
            if min(l, r) == -1 {
                cMax = max(l, r)
            } else {
                cMax = (l+r)/2
            }
            if cMax > maxDist {
                maxDist = cMax
            }
        }
        
        return maxDist
    }
}

// let seats = [1,0,0,0,1,0,1]
// let seats = [1,0,0,0]
// let seats = [0,0,0,1]
// let seats = [0,0,0,1,0,0,1]
let seats = [0,0,0,1,0,0,0,0,0,0,0,1]
print("seats = \(seats)\n-----------------------------")

let ans = Solution().maxDistToClosest(seats)
print("ans = \(ans)")

