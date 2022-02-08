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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let fake = ListNode(-1, head)
        var n = fake
        while n.next != nil {
            let current = n.next
            var nextNode = n.next!.next
            var needCut = false
            while nextNode != nil {
                if current!.val != nextNode!.val {
                    break
                } else {
                    nextNode = nextNode!.next
                    needCut = true
                }
            }
            if needCut {
                n.next = nextNode
            } else {
                n = current!
            }
        }
        return fake.next
    }
}

