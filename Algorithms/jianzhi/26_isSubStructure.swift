
// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


class Solution {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil || B == nil {
            return false
        }
        // find B Node
        var nodes = [TreeNode]()
        if let a = A {
            nodes.append(a)
        }
        // var match = true
        // var ab: TreeNode? = nil
        var matchNodes = [TreeNode]()
        while nodes.count > 0 {
            var nextLevel = [TreeNode]()
            for node in nodes {
                if node.val == B!.val {
                    // ab = node
                    // break
                    matchNodes.append(node)
                }
                if let l = node.left {
                    nextLevel.append(l)
                }
                if let r = node.right {
                    nextLevel.append(r)
                }
            }
            nodes = nextLevel
        }
        if matchNodes.count == 0 {
            return false
        }
        for node in matchNodes {
            if isEqual(node, B!) {
                return true
            }
        }
        return false
    }

    func isEqual(_ a: TreeNode, _ b: TreeNode) -> Bool {
        if a.val != b.val {
            return false
        }
        if a.left == nil && b.left != nil || a.right == nil && b.right != nil {
            return false
        }
        var leftEqual = true
        if let bl = b.left {
            leftEqual = isEqual(a.left!, bl)
        }
        var rightEqual = true
        if let br = b.right {
            rightEqual = isEqual(a.right!, br)
        }
        return leftEqual && rightEqual
    }
}