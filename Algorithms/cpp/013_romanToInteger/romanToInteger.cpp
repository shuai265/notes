

#include <iostream>
#include <string>
#include <array>
using namespace std;

class Solution {
public:
    int romanToInt(string s) {
        int result = 0;
        string symbol[] = {"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"};
        int value[]     = {1000,900,500,400, 100, 90,  50, 40,  10, 9,   5,  4,   1}; 
        int pos = 0;
        for (int i=0; i<s.length(); ) {
            cout << "s.substr(i,1)=" << s.substr(i,1) << endl;
            while (s.substr(i,1) != symbol[pos] && s.substr(i,2) != symbol[pos] && pos<(sizeof(value)/sizeof(value[0])))
            {
                pos++;
            }
            while (s.substr(i,1) == symbol[pos]) {
                result += value[pos];
                i++;
            }
            while (s.substr(i,2) == symbol[pos]) {
                result += value[pos];
                i += 2;
            }            
        }
        return result;
    }
};

int main() {
    return 0;
}

