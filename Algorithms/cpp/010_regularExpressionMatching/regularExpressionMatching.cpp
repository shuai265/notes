// Source : https://oj.leetcode.com/problems/regular-expression-matching/

/********************************************************************************** 
* 
* Implement regular expression matching with support for '.' and '*'.
* 
* '.' Matches any single character.
* '*' Matches zero or more of the preceding element.
* 
* The matching should cover the entire input string (not partial).
* 
* The function prototype should be:
* bool isMatch(const char *s, const char *p)
* 
* Some examples:
* isMatch("aa","a") → false
* isMatch("aa","aa") → true
* isMatch("aaa","aa") → false
* isMatch("aa", "a*") → true
* isMatch("aa", ".*") → true
* isMatch("ab", ".*") → true
* isMatch("aab", "c*a*b") → true
* 
*               
**********************************************************************************/

#include <iostream>
#include <string>
#include <vector>
using namespace std;

/**
 * idea
 * 把 p 拆成 n个规则
 * 对于全部是匹配字符的,从前开始匹配n[0],剩余字符串匹配n[1]~n[n-1],如果遇到失败,则把前一个截取范围扩大   
 */

void printVector(vector<string> v) {
    string s;
    for (int i=0; i< v.size(); i++) {
        s += " ";
        s += v[i];
    }
    cout << s << endl;
}


class Solution {
public:
    bool isMatch(string s, string p) {
        vector<string> pList = genPList(p);
        return isMatchPList(s, pList);
    }

private:
    bool isMatchPList(string s, vector<string> pList) {
        printVector(pList);
        cout << endl;
        bool isMatch = false;
        string singleP = pList[0];
        char cp = singleP[0];
        char cs = s[0];

        if (singleP.length() > 2) {
            isMatch = false;
            return isMatch;
        }

        if(singleP.length() == 2 && singleP[1] == '*') {
            for (int i=0; i<(s).length(); ++i) {
                // 检查当前是否相同
                if (isEqual(s[i], singleP[0]))
                {   
                    string nextStr = s.substr(1,s.length()-1);
                    vector<string> nextP = this->newPListRemoveFirst(pList);
                    if (nextStr.length()>0 && nextP.size() > 0 && isMatchPList(nextStr, nextP)) {
                        isMatch = true;
                        break;
                    } else {
                        isMatch = true;
                    }
                } 
            }
        } else {
            if (isEqual(cs, cp)) {
                vector<string> nextP = this->newPListRemoveFirst(pList);
                string nextStr = s.substr(1,s.length()-1);
                if (nextStr.length()>0 && pList.size() > 0) {
                    isMatch = isMatchPList(nextStr, nextP);
                } else {
                    isMatch = true;
                }
            } else {
                isMatch = false;
            }
        }
        return isMatch;
    }

    vector<string> newPListRemoveFirst(vector<string> p) {
        vector<string> n;
        for (int i=1; i<p.size(); ++i) {
            n.push_back(p[i]);
        }
        return n;
    }

    bool isEqual(char cs, char cp) {
        if (cp=='.') {
            return true;
        } else {
            return cs == cp;
        }
    }
    
    vector<string> genPList(string p) {
        vector<string> plist;
        for (int i=0; i<p.length(); ++i) {
            char c = p[i];
            char after = p[i+1];
            string item;
            if (after=='*') {
                item.push_back(c);
                item.push_back(after);
                ++i;
            } else {
                item.push_back(c);
            }
            plist.push_back(item);
        }
        return plist;
    }
};


int main() {
    // string s = "aa";
    // string p = "aa";
    
    // string s = "aa";
    // string p = "a*";
    // string s = "aab";
    string s = "caab";
    string p = "c*a*b";
    bool result = Solution().isMatch(s, p);
    cout << s << " and " << p << (result ? " match": " not match") << endl;
    return 0;
}