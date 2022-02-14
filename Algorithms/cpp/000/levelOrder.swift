
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
    func levelOrder(_ root: TreeNode?) -> [Int] {
        if let r = root {
            return helper([r])
        }
        return [Int]()
    }

    private func helper(_ nodes: [TreeNode]) -> [Int] {
        if nodes.count == 0 {
            return []
        }
        var vals = [Int]()
        var nextLevels = [TreeNode]() 
        for node in nodes {
            vals.append(node.val)
            if let l = node.left {
                nextLevels.append(l)
            }
            if let r = node.right {
                nextLevels.append(r)
            }
        }
        let ans = vals + helper(nextLevels)
        return ans
        // return vals
    }
}

let n = TreeNode(12)
let ans = Solution().levelOrder(n)
print("ans = \(ans)")