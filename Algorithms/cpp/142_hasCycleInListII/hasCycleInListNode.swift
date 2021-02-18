
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        // var pos = -1
        // var idx = 0
        var node = head
        var target: ListNode? = nil
        var dict = [Int: ListNode]()
        // var nodes = Set<ListNode>()
        while node != nil {
            if dict.keys.contains(node!.val) {
            // if nodes.contains(node!.val) {
                // pos = dict[node!.val]!
                // target = node
                // target = dict[node!.val]
                target = node
                break
            } else {
                dict[node!.val] = node
                // idx += 1
                // nodes.insert(node!)
            }
            node = node!.next
        }
        // return pos
        return target
    }
}

func listToNode(_ list: [Int]) -> ListNode? {
    guard list.count > 0 else {
        return nil
    }
    let fake = ListNode(-1)
    var node = fake
    for num in list {
        let newNode = ListNode(num)
        node.next = newNode
        node = newNode
    }
    return fake.next
}

func printNode(_ head: ListNode?) {
    var nums = [Int]()
    var node = head
    while node != nil {
        nums.append(node!.val)
        node = node!.next
    }
    print(nums)
}

let list = [-1,-7,7,-4,19,6,-9,-5,-2,-5]
let node = listToNode(list)
let ans = Solution().detectCycle(node)
