/********************************************************************************** 
* 
* 
* Given an array of integers, find two numbers such that they add up to a specific target number.
* The function twoSum should return indices of the two numbers such that they add up to the target, 
* where index1 must be less than index2. Please note that your returned answers (both index1 and index2) 
* are not zero-based.
* 
* You may assume that each input would have exactly one solution.
* 
* Input: numbers={2, 7, 11, 15}, target=9
* Output: index1=1, index2=2
* 
*               
**********************************************************************************/

#include <stdio.h>
#include <iostream>
#include <vector>
#include <unordered_map>

using namespace std;

class Solution {
    public:
    // O(n2), 可能会比两个 for 循环好, 但没有实质性的差别
    /*
    vector<int> twoSum(vector<int> &numbers, int target) {
        vector<int> result;
        for (int i=0; i<numbers.size(); i++) { // n
            int item = target - numbers[i]; // n 
            int j = numbers.size()-1;   // n
            do{
                if (numbers[j] == item) {
                    result = {i, j};
                    return result;
                }
                j--;
            } while (numbers[j] >= item);//n^2, 这个循环只是在查找
        }
        return result;
    }
    */

    // O(n) 的解法, 遍历一遍, 把需要的值以 map[neededNum] = idx 保存起来, 遍历中 idx 检查自己是否‘被需要’
    vector<int> twoSum(vector<int> &numbers, int target) {
        vector<int> result;
        unordered_map<int,int> m;
        for (int i=0; i<numbers.size(); ++i) {
            int tmp = target - numbers[i];
            if (m.find(i) == m.end()) {
                m[tmp] = i;
            } else {
                result.push_back(m[i]);
                result.push_back(i);
                break;
            }
        }
        return result;
    }
};

int main() {
    vector<int> numbers = { 2, 7, 11, 15 };
    // for (auto i=numbers.begin(); i != numbers.end(); ++i) {
    //     cout << *i << endl;
    // }
    int target = 9;
    // cout << "size" << numbers.size() << ", capacity" << numbers.capacity() << endl;
    vector<int> result = Solution().twoSum(numbers,target);
    for (auto i=result.begin(); i != result.end(); ++i) {
        cout << *i << " ";
    }
    return 0;
}