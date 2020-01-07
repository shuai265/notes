

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return helper(root!.left, root!.right)
    }

    func helper(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
        if let leftNode = leftNode, let rightNode = rightNode {
            if leftNode.val == rightNode.val {
                if !helper(leftNode.left, rightNode.right) {
                    return false
                }
                if !helper(leftNode.right, rightNode.left) {
                    return false
                }
                return true
            } else {
                return false
            }
        } else if leftNode == nil, rightNode == nil {
            return true
        } else {
            return false
        }
    }
}