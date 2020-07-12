// 236. 二叉树的最近公共祖先

#include <vector>

using namespace std;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        vector<TreeNode *> pPath, qPath;
        find(root, p, pPath);
        find(root, q, qPath);
        int len = pPath.size() < qPath.size()? pPath.size(): qPath.size();
        TreeNode *node = root;
        for (int i=0; i < len; i++) {
            if (pPath[i] == qPath[i]) {
                node = pPath[i];
            } else {
                break;
            }
        }
        return node;
    }

    bool find(TreeNode* root, TreeNode* p, vector<TreeNode *> &path) {
        if (root == NULL) {
            return false;
        }
        if (root == p) {
            path.push_back(root);
            return true;
        }
        path.push_back(root);
        if (find(root->left, p, path)) {
            return true;
        }
        if (find(root->right, p, path)) {
            return true;
        }
        path.pop_back();
        return false;
    }
};