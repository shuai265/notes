/********************************************************************************** 
* 
* Given a binary tree, return the inorder traversal of its nodes' values.
* 
* For example:
* Given binary tree {1,#,2,3},
* 
*    1
*     \
*      2
*     /
*    3
* 
* return [1,3,2].
* 
* Note: Recursive solution is trivial, could you do it iteratively?
* 
* confused what "{1,#,2,3}" means? > read more on how binary tree is serialized on OJ.
* 
* OJ's Binary Tree Serialization:
* 
* The serialization of a binary tree follows a level order traversal, where '#' signifies 
* a path terminator where no node exists below.
* 
* Here's an example:
* 
*    1
*   / \
*  2   3
*     /
*    4
*     \
*      5
* 
* The above binary tree is serialized as "{1,2,3,#,#,4,#,#,5}". 
* 
*               
**********************************************************************************/


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

// 递归 97.5
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans: [Int] = []
        helper(root, &ans)
        return ans
    }
    
    func helper(_ node: TreeNode?, _ ans: inout [Int]) {
        if let node = node {
            helper(node.left, &ans)
            ans.append(node.val)
            helper(node.right, &ans)
        }
    }
}


// loop, 利用 stack
class Solution2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans: [Int] = []
        var stack: [TreeNode] = []
        var node: TreeNode? = root
        while (node != nil || stack.count>0) {
            if let _ = node {
                while nil != node!.left {
                    stack.append(node!)
                    stack.append(node!.left!)
                    node = node!.left
                }
            } else {
                node = stack[stack.count-1]
            }
            stack.removeLast()
            ans.append(node!.val)
            node = node!.right
        }
        return ans
    }
}