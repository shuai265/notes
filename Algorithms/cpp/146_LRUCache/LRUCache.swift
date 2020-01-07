/*
 * LRU Cache, get put 都是 O(1)
 */

class Node {
    var next: Node?
    var pre: Node?
    var val: Int
    var key: Int
    init(_ value: Int, _ key: Int) {
        val = value
        self.key = key
        next = nil
        pre = nil
    }
}

class LRUCache {
    var capacity: Int = 0
    var count: Int = 0
    var map: [Int: Node] = [:]
    var head: Node?
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            moveToHead(node)
            return map[key]!.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.val = value
            moveToHead(node)
        } else {
            let node = Node(value, key)
            if self.count == capacity {
                removeLast()
            }
            add(node, key)
        }
    }

    func add(_ node: Node, _ key: Int) {
        self.count += 1
        map[key] = node
        if head != nil {
            node.next = head
            node.pre = head!.pre
            head!.pre!.next = node
            head!.pre = node
            head = node
        } else {
            node.pre = node
            node.next = node
            head = node
        }
    }

    func removeLast() {
        self.count -= 1
        let last = head!.pre
        self.map[last!.key] = nil
        head!.pre = last!.pre
        last!.next = head
    }

    func moveToHead(_ node: Node) {
        if head === node {
            return
        }
        node.pre!.next = node.next
        node.next!.pre = node.pre

        node.pre = head!.pre
        head!.pre!.next = node
        head!.pre = node
        node.next = head

        head = node
    }

    func desc() {
        var arr: [Int] = []
        if self.count > 0 {
            arr.append(head!.key)
            var node = head!.next
            while node !== head {
                arr.append(node!.key)
                node = node!.next
            }
        }
        print("desc: \(arr)")
    }
}


let capacity = 2
var obj = LRUCache(capacity)

// let cases = [[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]
// ["LRUCache","put","put","get","get","put","get","get","get"]
let cases = [[2],[2,1],[3,2],[3],[2],[4,3],[2],[3],[4]]
for (idx,list) in cases.enumerated() {
    if idx == 0 {
        obj = LRUCache(list[0])
        continue
    }
    if list.count == 1 {
        print("get\(list[0])=\(obj.get(list[0]))")
    } else {
        let key = list[0]
        let value = list[1]
        obj.put(key, value)
        print("put(\(key), \(value))")
    }
    obj.desc()
}