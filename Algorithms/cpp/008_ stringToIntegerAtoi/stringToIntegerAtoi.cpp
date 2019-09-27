// Source : https://oj.leetcode.com/problems/string-to-integer-atoi/

/********************************************************************************** 
* 
* Implement atoi to convert a string to an integer.
* 
* Hint: Carefully consider all possible input cases. If you want a challenge, 
*       please do not see below and ask yourself what are the possible input cases.
* 
* Notes: 
*   It is intended for this problem to be specified vaguely (ie, no given input specs). 
*   You are responsible to gather all the input requirements up front. 
* 
* 
* Requirements for atoi:
* 
* The function first discards as many whitespace characters as necessary until the first 
* non-whitespace character is found. Then, starting from this character, takes an optional 
* initial plus or minus sign followed by as many numerical digits as possible, and interprets 
* them as a numerical value.
* 
* The string can contain additional characters after those that form the integral number, 
* which are ignored and have no effect on the behavior of this function.
* 
* If the first sequence of non-whitespace characters in str is not a valid integral number, 
* or if no such sequence exists because either str is empty or it contains only whitespace 
* characters, no conversion is performed.
* 
* If no valid conversion could be performed, a zero value is returned. If the correct value 
* is out of the range of representable values, INT_MAX (2147483647) or INT_MIN (-2147483648) 
* is returned.
*               
**********************************************************************************/

#include <iostream>
#include <string>
using namespace std;

#define M_MAX_INT 2147483647
#define M_MIN_INT -M_MAX_INT-1

int myAtoi(string str) {
    int result = 0;
    int sign = 1;
    bool started = false;
    for (int i=0; i<str.length(); ++i) {
        char c = str[i];
        if (started) {
            if (c >= '0' && c <= '9') {
                if (result > M_MAX_INT/10 || -result<M_MIN_INT) {
                    return M_MIN_INT;
                }
                result = result*10 + (c-'0');
                continue;
            } else {
                break;
            }
        } else {
            if (c == ' ') {
                continue;
            } else if (c == '-') {
                sign = -1;
                started = true;
                continue;
            } else if (c == '+') {
                sign = 1;
                started = true;
                continue;
            } else if (c >= '0' && c <= '9') {
                sign = 1;
                started = true;
                result = c-'0';
                continue;
            } else {
                break;
            }
        }
    }
    return result*sign;
}

int main() {
    // string str = "-42";
    // string str = "4193 with words";
    // string str = "words and 987";
    string str = "-91283472332";
    int result = myAtoi(str);
    cout << "input: " << str << ", output: " << result << endl;
    return 0;
}