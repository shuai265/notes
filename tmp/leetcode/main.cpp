#include <iostream>

using namespace std;

int divide(int dividend, int divisor) {
    int sign = ((dividend > 0) ^ (divisor > 0)) ? -1 : 1;

    unsigned int dvd = dividend > 0 ? dividend : -dividend;
    unsigned int dvs = divisor > 0 ? divisor : -divisor;
    cout << dvd << endl;

    unsigned int array[32];
    unsigned int i = 0;
    long long d = dvs;
    while (dvd >= d) {
        array[i] = d;
        d = d << 1;
        ++i;
    }
    long long result = 0;
    for(--i; i >= 0; --i) {
        if(dvd >= array[i]) {
            dvd -= array[i];
            result += 1 << i;
        }
    }
    result = sign > 0 ? result : -result;
    if(result > INT_MAX || result < INT_MIN) {
        return INT_MIN;
    }
    return result;
}

int main() {

//    cout << "1/1 " << divide(1, 1) << endl;

//    cout << "0/2=" << divide(0, 2) << endl;
//    cout << "10/2=" << divide(10, 2) << endl;
//    cout << "10/3=" << divide(10, 3) << endl;
//    cout << "10/5=" << divide(10, 5) << endl;
//    cout << "10/7=" << divide(10, 7) << endl;
//    cout << "10/10=" << divide(10, 10) << endl;
//    cout << "10/11=" << divide(10, 11) << endl;
//    cout << "-1/1=" << divide(-1, 1) << endl;
//    cout << "2147483647/1=" << divide(2147483647, 1) << endl;
//    cout << "-2147483647/1=" << divide(-2147483647, 1) << endl;
//    cout << "2147483647/-1=" << divide(2147483647, -1) << endl;
//    cout << "-2147483647/-1=" << divide(-2147483647, -1) << endl;
//    cout << "2147483647/2=" << divide(2147483647, 2) << endl;
//    cout << "2147483647/10=" << divide(2147483647, 10) << endl;
//    cout << "-2147483648/1=" << divide(-2147483648, 1) << endl;
//    cout << "-2147483648/-1=" << divide(-2147483648, -1) << endl;
    cout << "-2147483648/-1=" << divide(-2147483648, -1) << endl;

    return 0;
}