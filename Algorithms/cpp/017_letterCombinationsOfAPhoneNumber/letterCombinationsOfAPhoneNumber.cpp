
/********************************************************************************** 
* 
* Given a digit string, return all possible letter combinations that the number could represent.
* 
* A mapping of digit to letters (just like on the telephone buttons) is given below.
* 
* Input:Digit string "23"
* Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
* 
* Note:
* Although the above answer is in lexicographical order, your answer could be in any order you want.
* 
*               
**********************************************************************************/

#include <string>
#include <vector>
#include <iostream>
using namespace std;

class Solution {
public:
    vector<string> letterCombinations(string digits) {
        vector<string> result;
        char phone[10][4] = {
            {' ','\0','\0','\0'}, //0
            {'\0','\0','\0','\0'}, //1
            {'a','b','c','\0'}, //2
            {'d','e','f','\0'}, //3
            {'g','h','i','\0'}, //4
            {'j','k','l','\0'}, //5
            {'m','n','o','\0'}, //6
            {'p','q','r','s'}, //7
            {'t','u','v','\0'}, //8
            {'w','x','y','z'} //9
        };
        for (int i=0; i<digits.length(); i++) {
            int idx = digits[i] - '0';
            // char subDigits[4] = phone[idx];
            char *sub = phone[idx];
            if (i == 0)
            {
                int j = 0; 
                while (j<4 && sub[j] != '\0')
                {
                    string s;
                    s.push_back(sub[j]);
                    result.push_back(s);
                    ++j;
                }
            } else {
                vector<string> tmp;
                for (int k=0; k<result.size(); k++) {
                    int j = 0; 
                    while (j<4 && sub[j] != '\0')
                    {
                        string s = result[k];
                        s.push_back(sub[j]);
                        tmp.push_back(s);
                        ++j;
                    }
                }
                
                result = tmp;
            }
        }
        return result;
    }
};

int main() {
    // string input = "9";
    string input = "999";
    vector<string> out = Solution().letterCombinations(input);
    cout << endl;
    for (int i=0; i< out.size(); i++) {
        cout << out[i] << " ";
    }
    cout << endl;
    return 0;
}
