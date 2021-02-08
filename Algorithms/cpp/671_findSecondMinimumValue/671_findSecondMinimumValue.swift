/**
 * https://leetcode-cn.com/problems/second-minimum-node-in-a-binary-tree/
 * 给定一个非空特殊的二叉树，每个节点都是正数，并且每个节点的子节点数量只能为 2 或 0。如果一个节点有两个子节点的话，那么该节点的值等于两个子节点中较小的一个。
更正式地说，root.val = min(root.left.val, root.right.val) 总成立。
给出这样的一个二叉树，你需要输出所有节点中的第二小的值。如果第二小的值不存在的话，输出 -1 。
 */



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

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        guard let _ = root, let _ = root!.left else {
            return -1
        }
        let ans = helper(root, Int.max)
        if ans == root!.val || ans == Int.max {
            return -1
        }
        return ans
    }

    func helper(_ node: TreeNode, _ secondMin: Int) -> Int {
        if node.left == nil {
            return secondMin
        } else {
            let left = node.left!
            let right = node.right!
            if left.val == right.val {
                return min(helper(left, secondMin), helper(right, secondMin))
            } else {
                let node = left.val > right.val ? right : left
                var secondMinNew = max(left.val, right.val)
                secondMinNew = min(secondMinNew, secondMin)
                return helper(node, secondMinNew)
            }
        }
    }
}

// [2,2,5,null,null,5,7]
// [2,2,2]
// [2]
// [2,2,3]
// [1,1,2,1,1,2,2]
// [1,1,3,1,1,3,4,3,1,1,1,3,8,4,8,3,3,1,6,2,1]
// [1,1,1,1,5,1,4]

let nums = [2,2,5,nil,nil,5,7]