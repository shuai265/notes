// Source : https://oj.leetcode.com/problems/swap-nodes-in-pairs/

/********************************************************************************** 
* 
* Given a linked list, swap every two adjacent nodes and return its head.
* 
* For example,
* Given 1->2->3->4, you should return the list as 2->1->4->3.
* 
* Your algorithm should use only constant space. You may not modify the values in the list, 
* only nodes itself can be changed.
* 
*               
**********************************************************************************/

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
            // print("start swap: \(first?.val),\(second?.val))")
            
            pre?.next = second
            first?.next = second?.next
            second?.next = first
            
            pre = first
            first = pre?.next
            if (first != nil) {
                second = first?.next
            }
            // printNode(fake)
        }
        return fake.next
    }
}



func printNode(_ node: ListNode?) {
    var nodeStr = ""
    var n: ListNode? = node
    while (n != nil) {
        nodeStr += String(n!.val)
        nodeStr += " "
        n = n?.next
    }
    print("\(nodeStr)")
}


class Solution2 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let fake = ListNode(-1)
        var preNode: ListNode? = fake
        preNode?.next = head
        var first: ListNode? = head
        while (first != nil) {
            if let second = first!.next {
                preNode?.next = second
                first!.next = second.next
                second.next = first
                preNode = first
                first = preNode?.next
            } else {
                break
            }
            // printNode(fake)
        }
        return fake.next
    }
}

func generateNodeFromNums(_ nums: [Int]) -> ListNode? {
    var head: ListNode? = nil
    var node: ListNode? = nil
    for i in (0..<nums.count) {
        if i == 0 {
            head = ListNode(nums[i])
            node = head
        } else {
            let n = ListNode(nums[i])
            node!.next = n
            node = n
        }
    }
    return head
}

//  let nums = [1,2,3,4,5,6]
let nums = [1,2,3,4,5]
//  let nums = [1,2,3,4]
//  let nums: [Int] = []
let node = generateNodeFromNums(nums)
printNode(node)
print("solution1:")
let swapedNode1 = Solution().swapPairs(node)
printNode(swapedNode1)

print("node:")
printNode(node)

print("solution2:")
let swapedNode = Solution2().swapPairs(swapedNode1)
printNode(swapedNode)
