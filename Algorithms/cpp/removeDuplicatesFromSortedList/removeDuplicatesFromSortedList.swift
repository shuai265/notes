#!/usr/bin/swift

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func genList(_ list: [Int]) -> ListNode? {
    if list.count == 0 {
        return nil
    }
    let head: ListNode = ListNode(list[0])
    var node: ListNode = head
    for idx in (1...list.count-1) {
        let newNode = ListNode(list[idx])
        node.next = newNode
        node = newNode
    }
    return head
}

func printNodeList(_ node: ListNode) {
    var arr: [Int] = []
    var node: ListNode? = node
    while (node != nil) {
        arr.append(node!.val)
        node = node?.next
    }
    print("\(arr)")
}

func deleteDuplicates(_ head: ListNode) -> ListNode? {
    let fake = ListNode(-1)
    fake.next = head
    var preNode = fake
    var node: ListNode? = head
    
    while (node != nil && node!.next != nil) {
        var isDup = false
        if node!.val == node!.next!.val {
            isDup = true
            node!.next = node!.next!.next
        }
        if node!.val != (node!.next ?? ListNode(-1)).val{
            if isDup {
                preNode.next = node!.next
            } else {
                preNode = node!
            }
            node = node!.next
        }
    }
    return fake.next
}

func main() {
    let data = [1,1,2,3,3,3,3,4,4,4,5,5,6,6]
    let node = genList(data)
    printNodeList(node!)
    let newNode = deleteDuplicates(node!)
    printNodeList(newNode!)
}

main()
