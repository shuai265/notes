
// 时间复杂度 最坏 O(log n) 最优 O(1) 平均 O(log n) 空间复杂度 迭代: O(1), 递归 O(log n)
// 非递归
func binary_search(_ datas: [Int], _ k: Int) -> Int {
    var idx = -1;
    var l = 0;
    var r = datas.count-1;
    while (l <= r) {
        let mid = (l+r)/2
        if (datas[mid] == k) {
            idx = mid
            break
        } else if (datas[mid] < k) {
            l = mid
        } else {
            r = mid
        }
    }
    return idx;
}

// 递归
func binary_search_r(_ data: [Int], _ start: Int, _ end: Int, _ key: Int) -> Int {
    if (start > end) { return -1 }
    let mid = start + (end - start)/2
    if (data[mid] > key) {
        return binary_search_r(data, start, mid-1, key)
    } else if (data[mid] < key) {
        return binary_search_r(data, mid+1, end, key)
    } else {
        return mid
    }
}

let d = [1,2,3,4,5,6,7,8,9]
let k = 6

let idx = binary_search(d, k)
print("idx of k:\(k) in \(d) is \(idx)")

let idx2 = binary_search_r(d, 0, d.count-1, k)
print("idx of k:\(k) in \(d) is \(idx2)")


