/********************************************************************************** 
* 
* Given preorder and inorder traversal of a tree, construct the binary tree.
* 
* Note:
* You may assume that duplicates do not exist in the tree.
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

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count > 0 {
            let node = TreeNode(preorder[0])
            buildHelper(preorder, inorder, node, 0, 0, inorder.count-1)
            return node
        }
        return nil
    }

    func buildHelper(_ preorder: [Int], _ inorder: [Int], _ node: TreeNode, _ nodePosInPreorder: Int, _ left: Int, _ right: Int) {
        for idx in left...right {
            if inorder[idx] == node.val {
                if idx > left { //左侧还有值,存在左节点
                    let leftNodePosInPreorder = nodePosInPreorder + 1
                    let leftNode = TreeNode(preorder[leftNodePosInPreorder])
                    node.left = leftNode
                    buildHelper(preorder, inorder, leftNode, leftNodePosInPreorder, left, idx-1)
                }
                if idx < right { //存在右节点，有节点在 preorder 中的位置为 idx
                    let rightNodePosInPreorder = nodePosInPreorder + (idx-left+1)
                    let rightNode = TreeNode(preorder[rightNodePosInPreorder])
                    node.right = rightNode
                    buildHelper(preorder, inorder, rightNode, rightNodePosInPreorder, idx+1, right)
                }
                break
            }
        }
    }
}