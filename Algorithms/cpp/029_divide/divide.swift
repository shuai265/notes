


/**
 * 给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。
 * 返回被除数 dividend 除以除数 divisor 得到的商。
 * 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2
 */


class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        
        var itemList: [Int] = []
        var idxList: [Int] = []
        var currentItem = 0

        // var flag = ((dividend>0) != (divisor>0)) ? 1 : -1
        let isNeg = ((dividend>0) != (divisor>0))

        let uDividend = abs(dividend)
        let uDivisor = abs(divisor)

        while currentItem < uDividend {
        // while true {
            if itemList.count > 0 {
                currentItem = itemList.last! + itemList.last!
                if (currentItem <= uDividend) {
                    itemList.append(currentItem)
                    idxList.append(idxList.last! + idxList.last!)
                } else {
                    break
                }
            } else {
                currentItem = uDivisor
                itemList.append(currentItem)
                idxList.append(1)
            }
        }
        
        print("itemList = \(itemList), idxList = \(idxList)")

        var res = 0
        var left = uDividend
        for i in (0..<itemList.count).reversed() {
            let item = itemList[i]
            let idx = idxList[i]
            if item <= left {
                left -= item
                res += idx
            }
        }
        return isNeg ? -res : res
    }
}

//  let dividend = 10
 let dividend = -15
 
//  let divisor = 3
 let divisor = -2
 
 let ans = Solution().divide(dividend, divisor)
 print("ans = \(ans)")