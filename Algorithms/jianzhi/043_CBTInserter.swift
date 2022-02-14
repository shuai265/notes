/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class CBTInserter {
    var root: TreeNode?
    // var deepestParentNodes = [TreeNode]()
    var deepestParents = [TreeNode]()
    var deep = 0
    // var deepestParent: TreeNode?

    init(_ root: TreeNode?) {
        self.root = root
        if let r = root {
            deep = 1
            var fullCnt = 1
            // var pre = [r]
            var deepest = [r]
            while true {
                deep += 1
                fullCnt *= 2

                var tmp = [TreeNode]()
                for n in pre {
                    if let l = n.left {
                        tmp.append(l)
                    }
                    if let r = n.right {
                        tmp.append(r)
                    }
                }

                if tmp.count == 0 {
                    // no next level
                } else {
                    deepestParents = deepest
                    deepest = tmp
                }
            }
        }
    }
    
    func insert(_ v: Int) -> Int {

    }
    
    func get_root() -> TreeNode? {
        return root
    }
}
