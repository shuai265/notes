


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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var ans = Int.min
        let _ = helper(root, &ans) 
        return ans
    }

    func helper(_ root: TreeNode?, _ max: inout Int) -> Int {
        if let root = root {
            var sum = root.val
            var currentMax = sum
            let leftSum = helper(root.left, &max)
            if leftSum > 0 {
                currentMax += leftSum
            }
            let rightSum = helper(root.right, &max)
            if rightSum > 0 {
                currentMax += rightSum
            }
            if currentMax > max {
                max = currentMax
            }

            let maxDelata = Swift.max(leftSum, rightSum)
            if maxDelata > 0 {
                sum += maxDelata
            }
            return sum
        } else {
            return 0
        }
    }
}