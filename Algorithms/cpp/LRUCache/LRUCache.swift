/*
 * LRU Cache, get put 都是 O(1)
 */

class Node {
    var next: Node?
    var pren: Node?
    var val: Int
    init(_ value: Int) {
        val = value
    }
}
