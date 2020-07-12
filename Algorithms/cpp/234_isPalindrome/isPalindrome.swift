
// 回文

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        let mid = findMid(head)
        var reverse = reverseLink(mid)
        var node = head
        //
        // print("\(mid!.val)")
        // printNode(reverse)
        while (node != nil) {
            // print("node = \(node!.val), reverse = \(reverse!.val)")
            
            if node!.val != reverse!.val {
                return false
            }
            if (node === mid) {                
                break
            } 
            node = node!.next
            reverse = reverse!.next
        }
        return true
    }

    func reverseLink(_ head: ListNode?) -> ListNode? {
        var new: ListNode? = nil
        if let _ = head {
            new = ListNode(head!.val)
        }
        var node = head
        while node != nil {
            let n = ListNode(node!.val)
            n.next = new
            new = n
            node = node!.next
        }
        return new
    }

    func findMid(_ head: ListNode?) -> ListNode? {
        var node1 = head
        var node2: ListNode? = nil
        if let head = head {
            if let _ = head.next {
                node2 = head.next!.next
            } else {
                node2 = nil
            }
        }
        while (node2 != nil) {
            node1 = node1!.next
            if let _ = node2!.next {
                node2 = node2!.next!.next
            } else {
                node2 = nil
            }
        }
        return node1
    }
}

func genNode(_ arr: [Int]) -> ListNode? {
    let fake = ListNode(-1)
    var node: ListNode? = nil
    for num in arr {
        let n = ListNode(num)
        if let _ = node {
            node!.next = n 
            node = n
        } else {
            node = n
            fake.next = node 
        }
    }
    return fake.next
}

func printNode(_ head: ListNode?) {
    var a: [Int] = []
    var n = head
    while n != nil {
        a.append(n!.val)
        n = n!.next
    }
    print("\(a)")
}

// let arr = [1, 2, 1]
// let arr = [1, 2, 2, 1]
// let arr = [1, 2]
// let arr = [1]
// let arr: [Int] = []
// let arr = [1, 3, 2, 1]
let arr = [1, 1, 2, 1]
let node = genNode(arr)
let isPalindrome = Solution().isPalindrome(node)
print("isPalindrome = \(isPalindrome)")

