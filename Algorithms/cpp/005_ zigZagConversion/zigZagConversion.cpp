
/********************************************************************************** 
* 
* The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: 
* (you may want to display this pattern in a fixed font for better legibility)
* 
* P   A   H   N
* A P L S I I G
* Y   I   R
* 
* And then read line by line: "PAHNAPLSIIGYIR"
* 
* Write the code that will take a string and make this conversion given a number of rows:
* 
* string convert(string text, int nRows);
* 
* convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
* 
*               
**********************************************************************************/

#include <iostream>
#include <string>
#include <vector>
using namespace std;

/**
 * 解法1: 计算每一行的字符串, 复杂度 O(n^2)
 */
string convert(string str, int n) {
    // 优先处理边界条件
    if (n<=1 || n > str.length()) return str;
    // 动态数组保存每行字符串
    vector<string> r(n);

    for (int i=0; i < n; i++) {
        int bigStep = 2*n-2;
        int step = 2*(n-i-1);
        if (i==0 || i==n-1) {
            step = bigStep;
            bigStep *= 2;
        }
        int idx = i;
        while(idx < str.length()){
            r[i] += str[idx];
            idx += step;
            step = bigStep-step;
        }
    }

    string result;
    for (int i=0; i<n; i++) {
        result += r[i];
    }
    return result;
}

/**
 * 解法2: 遍历字符串的过程中, 直接计算每个值的位置, O(n)
 * row 为当前 item 所在行, step 为 row 的修改值, 每次遇到边界反转 step
 */
string convert2(string str, int n) {
    if(n<=1 || n > str.length()) {return str;}

    vector<string> r(n);
    int step = 1;
    int row = 0;
    for(int i=0; i<str.length(); i++) {
        if (row==0) step = 1;
        if (row==n-1) step = -1;
        r[row] += str[i];
        row += step;
    }

    string result;
    for (int i=0; i<n; i++) {
        result += r[i];
    }
    return result;
}

int main() {
    string str = "PAYPALISHIRING";

    // string result = convert(str, 3);
    string result = convert2(str, 3);

    // should return "PAHNAPLSIIGYIR".
    cout << result << endl;

    return 0;
}