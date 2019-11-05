
func quickSort(_ nums: inout [Int]) {
    qSort(&nums, 0, nums.count-1)
}

func qSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
    if (left >= right) {
        return
    }

    var l = left
    var r = right
    let tmp = nums[l]
    while (l < r) {
        print("=======")
        print("while 1, l=\(l),nums[\(l)]=\(nums[l]), r=\(r),nums[\(r)]=\(nums[r])")
        while (nums[r] > tmp && l < r) {
            print("while 2, l=\(l),nums[\(l)]=\(nums[l]), r=\(r),nums[\(r)]=\(nums[r])")
            r -= 1
        }
        print("while 1 after, l=\(l),nums[\(l)]=\(nums[l]), r=\(r),nums[\(r)]=\(nums[r])")
        if (l < r && nums[r] <= tmp) {
            print("enter exchange 1, l=\(l),nums[\(l)]=\(nums[l]), r=\(r),nums[\(r)]=\(nums[r])")
            nums[l] = nums[r]
            l += 1
        }
        while (nums[l] < tmp && l < r) {
            l += 1
            print("while 3, l=\(l),nums[\(l)]=\(nums[l]), r=\(r),nums[\(r)]=\(nums[r])")
        }
        if (l <= r && nums[l] > tmp) {
            print("enter exchange 2, l=\(l),nums[\(l)]=\(nums[l]), r=\(r),nums[\(r)]=\(nums[r])")
            nums[r] = nums[l]
            r -= 1
        }
    }
    nums[l] = tmp
    print("current nums = \(nums), l = \(l), r=\(r)")
    print("----end----")
    
    qSort(&nums, left, l)
    // qSort(&nums, l+1, right)
}

var nums = [2,3,2,1,4,6,8,2,12,55,21]

print("nums = \(nums)")

quickSort(&nums)

print("nums = \(nums)")
