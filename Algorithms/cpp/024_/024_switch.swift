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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if (head == nil) {
            return nil
        }

        let fake = ListNode(-1)
        fake.next = head
        var pre: ListNode? = fake
        var first = head
        var second = first?.next
        
        while(first != nil && second != nil) {
            pre?.next = first?.next
            first?.next = second?.next
            second?.next = first
            
            pre = first
            first = first?.next
            if (first != nil) {
                second = first?.next
            }
        }
        return fake.next
    }
}