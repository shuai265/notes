

//Definition for a binary tree node.
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        if let root = root {
            var leftParentNodes: [TreeNode] = []
            var rightParentNodes: [TreeNode] = []
            return validHelper(root, &leftParentNodes, &rightParentNodes)
        } else {
            return true
        }
    }

    func validHelper(_ root: TreeNode?, _ leftParentNodes: inout [TreeNode], _ rightParentNodes: inout [TreeNode]) -> Bool {
        if let root = root {
            print("validate \(root.val), leftParent=\(leftParentNodes),right=\(rightParentNodes)")
            for node in leftParentNodes {
                if root.val >= node.val {
                    return false
                }
            }
            for node in rightParentNodes {
                if root.val <= node.val {
                    return false
                }
            }

            if let leftNode = root.left {
                leftParentNodes.append(root)
                if !validHelper(leftNode, &leftParentNodes, &rightParentNodes) {
                    return false
                }
                leftParentNodes.removeLast()
            }

            if let rightNode = root.right {
                rightParentNodes.append(root)
                if !validHelper(rightNode, &leftParentNodes, &rightParentNodes) {
                    return false
                }
                rightParentNodes.removeLast()
            }
            return true
        } else {
            return true
        }
    }
}

class Solution2 {
    func isValidBST(_ root: TreeNode?) -> Bool {

    }
    func helper(_ root: TreeNode?, _ lower: Int, _ upper: Int) {
        
    }
}
