#!/usr/bin/swift

/********************************************************************************** 
* Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? 
* Find all unique triplets in the array which gives the sum of zero.
* 
* Note:
* 
* Elements in a triplet (a,b,c) must be in non-descending order. (ie, a ≤ b ≤ c)
* The solution set must not contain duplicate triplets.
* 
*     For example, given array S = {-1 0 1 2 -1 -4},
* 
*     A solution set is:
*     (-1, 0, 1)
*     (-1, -1, 2)
**********************************************************************************/


func quick_sort(list: inout [Int], l: Int, r: Int) {
    while l < r {
        let tmp = list[l]
        while l < r {
            if list[r] <= tmp {
                list[l] = list[r]
                tmp = list[r]
                l = l+1
                break
            } else {
                r = r-1
            }    
        }
        while l < r {
            if list[l] > tmp {
                list[r] = list[l]
                tmp = list[l]
                r = r-1
                break
            } else {
                l = l+1
            }    
        }
    }
}


func main() {
    let S = [-1,0,1,2,-1,-4]
}

main()