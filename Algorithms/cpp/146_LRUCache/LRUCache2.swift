class ListNode {
    var key: Int
    var val: Int
    var pre: ListNode?
    var next: ListNode?
    init(_ key: Int, _ val: Int) {
        key = key
        val = val
    }
}

class DoubleList {
    var head: ListNode?
    var tail: ListNode?
    // case: 0-1, 1-0, 1-2, 2-1, 2-3, 3-2
    func moveToHead(_ node: ListNode) {
        if head == node {
            return
        }
        
        removeNode(node)

        node.next = head
        node.pre = tail
        
        if tail != nil {
            tail!.next = node
        }

        if head != nil {
            head.pre = node
        }

        head = node
    }

    func removeNode(_ node: ListNode) -> ListNode {
        node.pre.next = node.next
        node.next.pre = node.pre
        return node
    }

    func addNode(_ node: ListNode) {
        node.next = head
        node.pre = tail
        if tail != nil {
            tail!.next = node
        } else {
            tail = node
        }
        if head != nil {
            head!.pre = node
        }
        head = node
    }

    func removeLast {

    }
}

class LRUCache {
    var _capacity = 0
    var cnt = 0
    var map: [Int: ListNode]
    var doubleList: DoubleList()

    init(_ capacity: Int) {
        _capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = map[key] { // deal cnt 1, 2
            doubleList.moveToHead(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] { // deal cnt 1, 2
            // update val & pos
            node.val = value
            doubleList.moveToHead(node)
            cnt += 1
        } else {
            if cnt == _capacity {
                doubleList.removeLast()
                cnt -= 1
            }
            let node = ListNode(key, value)
            doubleList.addNode(node)
            cnt += 1
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */