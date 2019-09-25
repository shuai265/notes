#!/usr/bin/swift

/********************************************************************************** 
* 
* You are given two linked lists representing two non-negative numbers. 
* The digits are stored in reverse order and each of their nodes contain a single digit. 
* Add the two numbers and return it as a linked list.
* 
* Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
* Output: 7 -> 0 -> 8
*               
**********************************************************************************/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */

class ListNode {
    var val: Int?
    var next: ListNode?
    init(_ x: Int) {
        val = x
        next = nil
    }
}

func generateList(_ nums: [Int]) -> ListNode? {
    let fake = ListNode(-1)
    var preNode = fake
    for i in nums {
        let node = ListNode(i)
        preNode.next = node
        preNode = node
    }
    return fake.next
}

func printList(_ node: ListNode) {
    var t: ListNode? = node
    var tmp:[Int] = []
    while (t != nil) {
        tmp.append(t!.val!)
        t = t!.next
    }
    print("\(tmp)")
}

func addTwoSum(_ node1: ListNode, _ node2: ListNode) -> ListNode? {
    var tmp_l: ListNode? = node1
    var tmp_r: ListNode? = node2
    let fake: ListNode = ListNode(-1)
    var node: ListNode = fake
    var upper: Int = 0 // 进位
    while tmp_l != nil || tmp_r != nil {
        var sum = upper
        // 重复代码需要抽象成函数
        if tmp_l != nil {
            sum += tmp_l!.val!
            tmp_l = tmp_l!.next
        }
        if tmp_r != nil {
            sum += tmp_r!.val!
            tmp_r = tmp_r!.next
        }
        upper = sum/10
        let n = ListNode(sum%10)
        node.next = n
        node = n
    }
    return fake.next
}

func main() {
    let nums1 = [2, 4, 3]
    let nums2 = [5, 6, 4]
    let node1 = generateList(nums1)
    let node2 = generateList(nums2)
    printList(node1!)
    printList(node2!)
    let sumNode = addTwoSum(node1!, node2!) 
    printList(sumNode!)
}

main()
