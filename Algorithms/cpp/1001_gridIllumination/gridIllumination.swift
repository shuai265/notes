class Solution {
    func gridIllumination(_ n: Int, _ lamps: [[Int]], _ queries: [[Int]]) -> [Int] {
        // var lampsM = lamps
        var lampSet = Set<[Int]>()
        for (_, lamp) in lamps.enumerated() {
            lampSet.insert(lamp)
        }
        var ans = [Int]()
        for (idx, query) in queries.enumerated() {
            var checkedPoints = [[Int]]()
            ans.append(checkAndRemove(n, &lampSet, query, &checkedPoints))
        }
        return ans
    }

    func checkAndRemove(_ n: Int, _ lampSet: inout Set<[Int]>, _ query: [Int], _ checkedPoints: inout [[Int]]) -> Int {
        let directions = [[-1, 0], [-1, 1], [0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1]]
        var ans = 0
        for direct in directions {
            while query[0]+direct[0] >= 0 && query[0]+direct[0] < n && query[1]+direct[1] >= 0 && query[1]+direct[1] < n {
                let pos = [query[0]+direct[0], query[1]+direct[1]]
                if lampSet.contains(pos) {
                    ans = 1
                    break
                }
            }
        }

        // remove lamps
        for direct in directions {
            let pos = [query[0]+direct[0], query[1]+direct[1]]
                if lampSet.contains(pos) {
                    lampSet.remove(pos)
                }
        }        

        return ans
    }
}