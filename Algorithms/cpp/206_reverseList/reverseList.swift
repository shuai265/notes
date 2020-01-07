/**
 * 输入: 1->2->3->4->5->NULL
 * 输出: 5->4->3->2->1->NULL
 */

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        let fake = ListNode(-1)
        fake.next = head
        var p0 = head
        var p1 = head!.next
        p0!.next = nil

        while p1 != nil {
            let tmp = p1!.next
            fake.next = p1
            p1!.next = p0
            p0 = p1
            p1 = tmp
        }
        return fake.next
    }
}