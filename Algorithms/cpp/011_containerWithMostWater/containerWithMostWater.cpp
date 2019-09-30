// Source : https://oj.leetcode.com/problems/container-with-most-water/
// Author : Hao Chen
// Date   : 2014-06-22

/********************************************************************************** 
* 
* Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). 
* n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). 
* 
* Find two lines, which together with x-axis forms a container, such that the container contains the most water.
* 
* Note: You may not slant the container.
* 
*               
**********************************************************************************/

#include <iostream>
#include <vector>
using namespace std;

/*
class Solution {
public:
    int maxArea(vector<int>& height) {
        int maxSize = 0;
        for (int i=0; i<height.size(); ++i) {
            for (int j=i+1; j<height.size(); j++) {
                int size = (height[i] < height[j] ? height[i]:height[j]) * (j-i);
                if ( size > maxSize) {
                    maxSize = size;
                }
            }
        }
        return maxSize;
    }
};
*/

/**
 * idea: 从两端最小的数开始,如果中间有更大的容器,必要条件是 height[i] > height[left]
 * 从两端向中间计算, 一次循环即可完成计算
 */
class Solution {
public:
    int maxArea(vector<int>& height) {
        int maxArea = 0;
        int left = 0;
        int right = height.size()-1;
        while (left < right) {
            int area = (right-left) * ((height[left]<height[right])?height[left]:height[right]);
            maxArea = area > maxArea ? area : maxArea;
            if (height[left] < height[right]) {
                do {
                    left++;
                } while(height[left]<height[left-1] && left<right);
            } else {
                do {
                    right--;
                } while(height[right]<height[right+1] && left<right);
            }
        }
        return maxArea;
    }
};

int main() {
    vector<int> height = {1,8,6,2,5,4,8,3,7};
    int area = Solution().maxArea(height);
    cout << "max Size=" << area << endl;
    return 0;
}