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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
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

func p() {
    print("xxx")
}
p()