// Source : https://oj.leetcode.com/problems/reverse-nodes-in-k-group/
/*
https://leetcode-cn.com/problems/reverse-nodes-in-k-group/

给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
k 是一个正整数，它的值小于或等于链表的长度。
如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
示例 :
给定这个链表：1->2->3->4->5
当 k = 2 时，应当返回: 2->1->4->3->5
当 k = 3 时，应当返回: 3->2->1->4->5
说明 :
你的算法只能使用常数的额外空间。
你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let fake = ListNode(-1)
        var pre: ListNode? = fake
        pre?.next = head
        var node = head
        while (node != nil && nodeCount(node)>=k ) {
            let nextNode = reverseKNodes(pre, node, k)            
            pre = node
            node = nextNode
            pre?.next = nextNode
            // print("current nodeList: \(nodeStr(fake.next))")
        }
        return fake.next
    }

    func nodeCount(_ head: ListNode?) -> Int {
        var cnt = 0
        var node = head 
        while node != nil {
            cnt += 1
            node = node?.next
        }
        return cnt
    }
    
    func reverseKNodes(_ pre: ListNode?, _ head: ListNode?, _ k: Int) -> ListNode? {
        var node = head
        var nextNode = node?.next
        node?.next = nil
        // var nextNextNode: ListNode? = nil
        var count = 1
        while (nextNode != nil && count < k) {
            count += 1            
            let tmp = nextNode?.next
            nextNode!.next = node
            node = nextNode
            nextNode = tmp
        }
        pre?.next = node
        return nextNode
    }
}

func nodeStr(_ head: ListNode?) -> String {
    var node = head
    var str = ""
    while node != nil {
        str += String(node!.val)
        node = node?.next
    }
    return str
}

func genNode(_ nums:[Int]) -> ListNode? {
    let pre = ListNode(-1)
    var node: ListNode? = nil
    for i in 0..<nums.count {
        let newNode = ListNode(nums[i])
        node?.next = newNode
        node = newNode
        if (i == 0) {
            pre.next = node
        }
    }
    return pre.next
}

let nums = [1,2,3,4,5]
// let nums = [1,2,3,4,5,6]
// let nums = [1,2,3,4,5,6,7]
// let k = 1
// let k = 2
let k = 3
let node = genNode(nums)
print("before: \(nodeStr(node))")

let reversedNode = Solution().reverseKGroup(node, k)
print("after: \(nodeStr(reversedNode))")



