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
    var val: Int
    var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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
        tmp.append(t!.val)
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
            sum += tmp_l!.val
            tmp_l = tmp_l!.next
        }
        if tmp_r != nil {
            sum += tmp_r!.val
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

// main()

class Solution {
<<<<<<< Updated upstream
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var h1 = l1
        var h2 = l2 
        var head: ListNode?
        var tail: ListNode?
        var carry = 0 // 进位
        while h1 != nil || h2 != nil || carry > 0 {
            var v = 0
            if h1 != nil {
                v += h1!.val
                h1 = h1?.next
            }
            if h2 != nil {
                v += h2!.val
                h2 = h2?.next
            }
            if enter > 0 {
                v += enter
            }
            carry = v/10
            v = v % 10
            var n = ListNode(v)
            if head == nil {
                head = n
                tail = n
            } else {
                tail?.next = n
            }
            tail = n
        }
        return head
    }
}

// let nums1 = [2, 4, 3]
// let nums2 = [5, 6, 4]
let nums1 = [9,9,9,9,9,9,9]
let nums2 = [9,9,9,9]
=======
    func addTwoSum(_ node1: ListNode, _ node2: ListNode) -> ListNode {
        var ans = ListNode(-1)
        var n1: ListNode? = node1
        var n2: ListNode? = node2
        var upper = 0
        var p = ans
        while (n1 != nil && n2 != nil) {
            var sum = n1!.val! + n2!.val! + upper
            upper = sum/10
            sum -= upper*10
            let newNode = ListNode(sum)
            p.next = newNode
            p = newNode
            n1 = n1!.next
            n2 = n2!.next
        }
        if n2 != nil {
            n1 = n2
        }
        while n1 != nil {
            var sum = n1!.val! + n2!.val! + upper
            upper = sum/10
            sum -= upper*10
            let newNode = ListNode(sum)
            p.next = newNode
            p = newNode
            n1 = n1!.next
        }

        return ans.next!
    }
}

let nums1 = [2, 4, 3]
let nums2 = [5, 6, 4]
>>>>>>> Stashed changes
let node1 = generateList(nums1)
let node2 = generateList(nums2)
printList(node1!)
printList(node2!)
<<<<<<< Updated upstream
let sumNode = Solution().addTwoNumbers(node1, node2) 
printList(sumNode!)
=======
let sumNode = Solution().addTwoSum(node1!, node2!) 
printList(sumNode)
>>>>>>> Stashed changes
