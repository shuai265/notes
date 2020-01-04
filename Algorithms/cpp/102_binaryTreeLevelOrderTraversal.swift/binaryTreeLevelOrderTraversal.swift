
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        if let root = root {
            helper([root], &result)
        }
        return result
    }

    func helper(_ nodeList: [TreeNode], _ result: inout [[Int]]) {
        var currentLevelList: [Int] = []
        var nextNodeList: [TreeNode] = []
        for node in nodeList {
            currentLevelList.append(node.val)
            if let leftNode = node.left {
                nextNodeList.append(leftNode)
            }
            if let rightNode = node.right {
                nextNodeList.append(rightNode)
            }
        }
        if currentLevelList.count > 0 {
            result.append(currentLevelList)
        }
        if nextNodeList.count > 0 {
            helper(nextNodeList, &result)
        }
    }
}

class Solution2 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []
        if let root = root {
            helper(root, 0, &result)
        }
        return result
    }

    func helper(_ node: TreeNode?, _ level: Int, _ result: inout [[Int]]) {
        if let node = node {
            if level >= result.count {
                let levelList: [Int] = []
                result.append(levelList)
            }
            var levelList = result[level]
            levelList.append(node.val)
            result[level] = levelList

            if let leftNode = node.left {
                helper(leftNode, level+1, &result)
            }
            if let rightNode = node.right {
                helper(rightNode, level+1, &result)
            }
        }
    }
}