/**
 * 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 * 示例 1:
 * 输入: 4->2->1->3
 * 输出: 1->2->3->4
 * 示例 2:
 * 输入: -1->5->3->4->0
 * 输出: -1->0->3->4->5
 * 链接：https://leetcode-cn.com/problems/sort-list
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

// 遍历 + 二分法查找
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        var nodeList: [ListNode] = []
        var node = head
        while node != nil {
            let nextNode = node!.next
            // insert(node!, &nodeList, 0, nodeList.count)
            insert(node!, &nodeList)
            node = nextNode
        }
        return nodeList.count>0 ? nodeList[0] : nil
    }

    func insert(_ node: ListNode, _ nodeList: inout [ListNode]) {
        print("start with \(node.val), nodeList = \(nodeToList(nodeList.count > 0 ? nodeList[0]: nil))")
        
        node.next = nil
        if nodeList.count == 0 {
            print("append \(node.val)")
            nodeList.append(node)
            return
        }
        var low = 0
        var high = nodeList.count
        var mid = (low + high)/2
        while low < high {
             if node.val > nodeList[mid].val {
                 low = mid + 1
             } else {
                 high = mid
             }
             mid = (low + high)/2
        }
        if low > 0 {
            let leftNode = nodeList[low-1]
            leftNode.next = node
        }
        if low < nodeList.count {
            print("insert \(node.val), at \(low)")
            let rightNode = nodeList[low]
            node.next = rightNode
            nodeList.insert(node, at: low)
        } else {
            print("append \(node.val)")
            nodeList.append(node)
        }
    }
}

func printNode(_ node: ListNode?) {
    var p: ListNode? = node
    var arr: [Int] = []
    while p != nil {
        arr.append(p!.val)
        p = p!.next
    }
    print("\(arr)")
}

func nodeToList(_ node: ListNode?) -> [Int] {
    var p: ListNode? = node
    var arr: [Int] = []
    while p != nil {
        arr.append(p!.val)
        p = p!.next
    }
    return arr
}

func listToNode(_ nums: [Int]) -> ListNode? {
    var head: ListNode? = nil
    var node = head
    for n in nums {
        let newNode = ListNode(n)
        if head == nil {
            head = newNode
            node = newNode
        } else {
            node!.next = newNode
            node = newNode
        }
    }
    return head
}

// let arr = [4,2,1,3]
let arr = [-1,5,3,4,0]
let node = listToNode(arr)
printNode(node)
let sortedNode = Solution().sortList(node)
printNode(sortedNode)
