// Source : https://oj.leetcode.com/problems/reverse-integer/

/********************************************************************************** 
* 
* Reverse digits of an integer.
* 
* Example1: x =  123, return  321
* Example2: x = -123, return -321
* 
* 
* Have you thought about this?
* 
* Here are some good questions to ask before coding. Bonus points for you if you have already thought through this!
* 
* > If the integer's last digit is 0, what should the output be? ie, cases such as 10, 100.
* 
* > Did you notice that the reversed integer might overflow? Assume the input is a 32-bit integer, 
*   then the reverse of 1000000003 overflows. How should you handle such cases?
* 
* > Throw an exception? Good, but what if throwing an exception is not an option? 
*   You would then have to re-design the function (ie, add an extra parameter).
* 
*         
**********************************************************************************/      

#include <iostream>

using namespace std;

#define M_INT_MAX 2147483647
#define M_INT_MIN (-INT_MAX-1)

int reverseInterger(int num) {
    int result = 0;
    while(num != 0) {
        // need handle overflow
        // 需要除以10, 否则后面进位直接溢出
        if (result > M_INT_MAX/10 || result < M_INT_MIN/10)
        {
            return 0;
        }
        
        result = result*10 + num%10;
        num = num/10;
    }
    return result;
}

int main() {
    // int x = -123;
    // int x = 123;
    // int x = 120;
    int x = -120;
    // int x = 1000000003;
    int result = reverseInterger(x);
    cout << "input:" << x << ",output:" << result << endl;
    return 0;
}