
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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
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