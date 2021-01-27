/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }

        var nodeList: [ListNode] = []
        // var headNode = head
        var node = head
        var tail: ListNode? = nil
        while node != nil {
            tail = node
            nodeList.append(node!)
            node = node!.next
        }
        let realK = k % nodeList.count
        if realK == 0 {
            return head
        }
        let offset = nodeList.count - realK
        let newHead = nodeList[offset]
        
        if offset > 0 {
            tail!.next = head
            let preNode = nodeList[offset-1]
            preNode.next = nil
        }
        return newHead
    }
}

// let data = [1,2,3,4,5]
// let data: [Int] = []
// let data = [0,1,2]
let data = [1]


let node: ListNode? = nodeFromList(data)
printNode(node)
// let k = 4
let k = 0
let ans = Solution().rotateRight(node, k)
// print("ans = \(ans)")
print("ans = ")
printNode(ans)


func printNode(_ node: ListNode?) {
    guard node != nil else {
        print("nil")
        return
    }
    var nodes: [Int] = []
    var n = node
    while n != nil {
        nodes.append(n!.val)
        n = n!.next
    }
    print("node = \(nodes)")
}

func nodeFromList(_ nodes: [Int]) -> ListNode? {
    if nodes.count > 0 {
        var head = ListNode(nodes[0])
        var node = head
        for i in 1..<nodes.count {
            var newNode = ListNode(nodes[i])
            node.next = newNode
            node = newNode
        }
        return head
    } else {
        return nil
    }
}