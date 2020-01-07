

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
    func flatten(_ root: TreeNode?) {
        var stack: [TreeNode] = []
        let fake = TreeNode(-1)
        helper(root, fake, &stack)
    }

    func helper(_ node: TreeNode?, _ parentNode: TreeNode, _ stack: inout [TreeNode]) {
        if (nil != node || stack.count > 0) {
            var currentNode = node
            if currentNode == nil {
                currentNode = stack[stack.count-1]
                stack.removeLast()
            }
            parentNode.right = currentNode
            parentNode.left = nil
            
            if currentNode!.right != nil {
                stack.append(currentNode!.right!)
            }
            if currentNode!.left != nil {
                helper(currentNode!.left, currentNode!, &stack)
            } else {
                helper(nil, currentNode!, &stack)
            }
        }
    }
}