
class Solution {
    func oneEditAway(_ first: String, _ second: String) -> Bool {
        if first == second {
            return true
        }
        let dela = first.count - second.count
        if dela > 1 || dela < -1 {
            return false
        }
        var fcs = Array(first)
        var scs = Array(second)

        var changeCnt = 0
        while fcs.count > 0 && scs.count > 0 {
            let ic = fcs[0]
            let jc = scs[0]
            
            if ic != jc {
                if changeCnt > 0 {
                    return false
                } else {
                    changeCnt += 1
                    if dela == 1 {
                        fcs.remove(at: 0)
                    } else if dela == -1 {
                        scs.remove(at: 0)
                    } else {
                        fcs.remove(at: 0)
                        scs.remove(at: 0)
                    }
                }
            } else {
                fcs.remove(at: 0)
                scs.remove(at: 0)
            }
        }

        if changeCnt == 0 {
            return fcs.count==0 && scs.count <= 1 || fcs.count<=1 && scs.count == 0
        } else {
            return fcs.count==0 && scs.count == 0
        }
    }
}

class Solution2 {
    func oneEditAway(_ first: String, _ second: String) -> Bool {
        if first == second {
            return true
        }
        let dela = first.count - second.count
        if dela > 1 || dela < -1 {
            return false
        }
        let fcs = Array(first)
        let scs = Array(second)

        var i = 0
        var j = 0
        var changeCnt = 0
        while i < fcs.count && j < scs.count {
            let ic = fcs[i]
            let jc = scs[j]
            if ic != jc {
                if changeCnt > 0 {
                    return false
                } else {
                    changeCnt += 1
                    // cut or move both
                    if dela == 1 {
                        i += 1
                    } else if dela == -1 {
                        j += 1
                    } else {
                        i += 1
                        j += 1
                    }
                }
            } else {
                i += 1
                j += 1
            }
        }
        return true
    }
}

// let s1 = ""
// let s2 = "a"
// let s1 = "a"
// let s2 = ""
let s1 = "ab"
let s2 = "bc"
let ok = Solution2().oneEditAway(s1, s2)
print("ok = \(ok)")