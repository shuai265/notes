// Source : https://oj.leetcode.com/problems/palindrome-number/

/********************************************************************************** 
* 
* Determine whether an integer is a palindrome. Do this without extra space.
* 
* 
* Some hints:
* 
* Could negative integers be palindromes? (ie, -1)
* 
* If you are thinking of converting the integer to string, note the restriction of using extra space.
* 
* You could also try reversing an integer. However, if you have solved the problem "Reverse Integer", 
* you know that the reversed integer might overflow. How would you handle such case?
* 
* There is a more generic way of solving this problem.
* 
*               
**********************************************************************************/


/**
 * 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
示例 1:
输入: 121
输出: true

示例 2:
输入: -121
输出: false
解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。

示例 3:
输入: 10
输出: false
解释: 从右向左读, 为 01 。因此它不是一个回文数。

进阶: 你能不将整数转为字符串来解决这个问题吗？
*/

#include <iostream>
using namespace std;

bool palindromeNumber(int num) {
    if (num < 0) {
        return false;
    } else if (num < 10) {
        return true;
    } else {
        int head = num;
        int i = 0;
        while (head > 10) {
            head /= 10;
            i++;
        }
        int tail = num%10;

        if (head == tail)
        {
            int newNum = (num - head*i - tail)/10;
            return newNum>0 ? palindromeNumber(head) : true;
        } else {
            return false;
        }
    }
}

int main() {
    // int num = 10;
    // int num = -121;
    int num = 121;
    cout << num << (palindromeNumber(num) ? " is palindrome" : " is no palindrome") << endl;
    return 0;
}