
/**
 * 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 * 示例:
 * 输入:
 * [
 *   1->4->5,
 *   1->3->4,
 *   2->6
 * ]
 * 输出: 1->1->2->3->4->4->5->6
*/


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
// }

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let prehead = ListNode(-1)
        var l = l1
        var r = l2
        var c: ListNode? = prehead
        while (l != nil && r != nil) {
            if (l!.val < r!.val) {
                c!.next = l
                l = l!.next            
            } else {
                c!.next = r 
                r = r!.next
            }
            c = c!.next
        }

        if (l == nil) {
            c!.next = r 
        } else {
            c!.next = l
        }
        return prehead.next
    }
}

class Solution2 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil, l2 != nil else {
            return l1 != nil ? l1 : l2
        }
        var n1 = l1
        var n2 = l2
        let fake = ListNode(-1)
        var node = fake
        while n1 != nil && n2 != nil {
            // print("n1 = \(n1!.val), n2 = \(n2!.val)")
            if n1!.val < n2!.val {
                node.next = n1
                node = n1!
                n1 = n1!.next
            } else {
                node.next = n2
                node = n2!
                n2 = n2!.next
            }
        }
        var leftNode = n1 != nil ? n1 : n2
        node.next = leftNode
        return fake.next
    }
}

class Solution3 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1 = list1
        var l2 = list2
        let fake = ListNode(-1)
        var n = fake
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                n.next = l1
                l1 = l1!.next
            } else {
                n.next = l2
                l2 = l2!.next
            }
            n = n.next!
        }
        if l1 != nil {
            n.next = l1
        } else if l2 != nil {
            n.next = l2
        }
        return fake.next
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


let l1 = [1,2,4]
let l2 = [1,3,4]

let n1 = listToNode(l1)
let n2 = listToNode(l2)
printNode(n1)
// let node = Solution2().mergeTwoLists(n1, n2)
let node = Solution3().mergeTwoLists(n1, n2)
printNode(node)
