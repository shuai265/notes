
// Definition for singly-linked list.
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    bool hasCycle(ListNode *head) {
        unordered_map<ListNode*,bool > m;
        ListNode *p = head;
        m[(ListNode*)NULL] = true;
        while(m.find(p) == m.end()) {
            m[p] = true;
            p = p -> next;
        }
        return p != NULL;
    }
};