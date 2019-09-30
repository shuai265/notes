/********************************************************************************** 
* 
* Given an integer, convert it to a roman numeral.
* 
* Input is guaranteed to be within the range from 1 to 3999.
*               
**********************************************************************************/

/**
 * I   1
 * V   5
 * X   10
 * L   50
 * C   100
 * D   500
 * M   1000
 */

#include <iostream>
#include <string>
using namespace std;

// class Solution {
// public:
//     string intToRoman(int num) {
//         if (num<1||num>3999) { return ""; }
//         string result;
//         int count = 0;
//         while (num>0) {
//             int n = num%10;
//             string romanStr = romanForNum(n, count);
//             cout << "current n = " << n << ",count = " << count << ", romanStr = " << romanStr << endl;
//             result = romanStr + result;
//             count++;
//             num = num/10;
//         }
//         return result;
//     }

// private:
//     // num < 10
//     string romanForNum(int num, int tens) {
//         if (num>10 || num <= 0) { return ""; }
//         string result;
//         string one = romanForOne(tens);
//         if (num == 9) {
//             string ten = romanForOne(tens+1);
//             result = one+ten;
//         } else if (num >= 5) {
//             result = romanForFive(tens);
//             while (num>5)
//             {
//                 num--;
//                 result += one;
//             }
//         } else if(num == 4) {
//             result = one+romanForFive(tens);
//         } else {
//             while (num > 0) {
//                 num--;
//                 result += one;
//             }
//         }
//         return result;
//     }

//     string romanForFive(int tens) {
//         switch (tens)
//         {
//         case 0:
//             return "V";
//         case 1:
//             return "L";
//         case 2:
//             return "D";
//         default:
//             return "";
//             break;
//         }
//     }

//     string romanForOne(int tens) {
//         switch (tens)
//         {
//         case 0:
//             return "I";
//         case 1:
//             return "X";
//         case 2:
//             return "C";
//         case 3:
//             return "M";
//         default:
//             return "";
//             break;
//         }
//     }
// };

class Solution {
public:
    string intToRoman(int num) {
        string result;
        string symbol[] = {"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"};
        int value[]     = {1000,900,500,400, 100, 90,  50, 40,  10, 9,   5,  4,   1}; 
        for (int i=0; num!=0; i++) {
            while(num>=value[i]) {
                num -= value[i];
                result += symbol[i];
            }
        }
        return result;
    }
};

int main() {
    int num = 1994;
    string roman = Solution().intToRoman(num);
    cout << "num=" << num << ", roman=" << roman << endl;
    return 0;
}

