

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
// not correct
class Solution1 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        // var nodeList: [TreeNode] = []
        if let node = root {
            helper([node])
        }
        return root
    }

    func helper(_ nodeList: [TreeNode]) {
        if (nodeList.count == 0) {
            return 
        }
        var nextRow: [TreeNode] = []
        for node in nodeList {
            if let leftNode = node.left, let rightNode = node.right {
                nextRow.append(leftNode)
                nextRow.append(rightNode)
            }
        }
        let total = nextRow.count
        if total > 0 {
            for i in 0..<nodeList.count {
                let node = nodeList[i]
                node.left = nextRow[total - 2*i - 1]
                node.right = nextRow[total - 2*i - 2]
            }
        }
        helper(nextRow)
    }
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if let node = root {
            helper(node)
        }
        return root
    }

    func helper(_ node: TreeNode?) {
        if let node = node {
            let leftNode = node.left
            let rightNode = node.right
            node.left = rightNode
            node.right = leftNode
            helper(leftNode)
            helper(rightNode)
        }
        
    }
}