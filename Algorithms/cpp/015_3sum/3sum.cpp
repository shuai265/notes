
#include <vector>
#include <iostream>
#include <map>
#include <set>

using namespace std;
/*
 * 有问题: 重复结果
class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        vector<vector<int>> result;
        map<int, vector<vector<int>>> twoSums;
        for (int i=0; i < nums.size(); i++) {
            for (int j=i+1; j < nums.size(); j++) {
                int sum = nums[i] + nums[j];
                vector<int> t = {nums[i], nums[j]};
                // vector<int> t = {1, 2, 3};
                if (twoSums.find(sum) != twoSums.end()) {
                    twoSums[sum].push_back(t);
                } else {
                    twoSums[sum] = {t};
                }
            }
        }

        for (int i=0; i<nums.size(); i++) {
            int num = -nums[i];
            if (twoSums.find(num) != twoSums.end()) {
                for (int j=0; j<twoSums[num].size(); j++) {
                    vector<int> item = twoSums[num][j];
                    item.push_back(-num);
                    result.push_back(item);
                }
            }
        }

        return result;
    }
};
*/

class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        vector<vector<int>> result;
        if (nums.size()<3) return result;

        sort(nums.begin(), nums.end());
        int n = nums.size();
        for (int i=0; i<n-2; i++) {
            if (i>0 && nums[i]==nums[i-1]) continue;
            
            int a = nums[i];
            int l = i+1;
            int r = n-1;
            while (l < r) {
                int b = nums[l];
                int c = nums[r];
                if (a+b+c==0)
                {
                    vector<int> t;
                    t.push_back(a);
                    t.push_back(b);
                    t.push_back(c);
                    result.push_back(t);
                    while (l<r && nums[l]==nums[l+1]) l++;
                    while (l<r && nums[r]==nums[r-1]) r--;
                    l++;
                    r--;
                } else if (a+b+c>0) {
                    while (l<r && nums[r]==nums[r-1]) r--;
                    r--;
                } else {
                    while (l<r && nums[l]==nums[l+1]) l++;
                    l++;
                }
            }
        }
        return result;
    }
};

int main() {
    vector<int> nums = {-1,0,1,2,-1,-4}; // -4,-1,-1,0,1,2
    Solution().threeSum(nums);
    return 0;
}