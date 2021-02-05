/********************************************************************************** 
* 
* Given a linked list, remove the nth node from the end of list and return its head.
* 
* For example,
* 
*    Given linked list: 1->2->3->4->5, and n = 2.
* 
*    After removing the second node from the end, the linked list becomes 1->2->3->5.
* 
* Note:
* Given n will always be valid.
* Try to do this in one pass.
* 
*               
**********************************************************************************/

// 使用一次循环解决问题

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

// public class ListNode {
//     public var val: Int
//     public var next: ListNode?
//     public init(_ val: Int) {
//         self.val = val
//         self.next = nil
//     }
//  }

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution2 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let _ = head else {
            return head
        }
        let pre = ListNode(-1, head!)
        var nodes = [pre]

        var node = head
        while node != nil {
            nodes.append(node!)
            node = node!.next
        }
        // print("nodes = \(nodes)")
        let target = nodes[nodes.count-n]
        let preNode = nodes[nodes.count-n-1] // 注意边界
        preNode.next = target.next
        return pre.next
    }
}


class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if (head == nil) {
            return head
        }
        let preHead = ListNode(-1)
        preHead.next = head
        var pre: ListNode? = preHead
        var del = head

        var idx = 0
        var cur = del
        while (cur != nil) {
            cur = cur!.next
            if idx < n {
                idx = idx + 1
            } else {
                pre = del 
                del = del!.next                
            }
        }
        pre!.next = pre!.next!.next
        return preHead.next
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


// let nums = [1,2,3,4,5]
// let n = 1
let nums = [1]
let n = 1

let head = listToNode(nums)

var ans = Solution2().removeNthFromEnd(head, n)
printNode(ans)