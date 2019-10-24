
#include <string>
#include <vector>
using namespace std;

class Solution {
public:
    string longestCommonPrefix(vector<string>& strs) {
        if (strs.size()==0) {
            return "";
        } 
        if (strs.size()==1) {
            return strs[0];
        }
        string result = strs[0];
        for (int i=0; i<strs.size(); i++) {
            int idx = 0;
            while (idx < result.length() && result[idx] == strs[i][idx]) {
                idx++;
            }
            result = result.substr(0, idx);
        }
        return result;
    }
};

int main() {
    return 0;
}