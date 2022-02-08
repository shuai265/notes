class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var img = image
        let originColor = image[sr][sc]
        if originColor == newColor {
            return image
        }
        helper(&img, sr, sc, originColor, newColor, true, true, true, true)
        return img
    }

    func helper(_ image: inout [[Int]],  _ sr: Int, _ sc: Int, _ originColor:Int, _ newColor: Int, _ left: Bool, _ top: Bool, _ right: Bool, _ bottom: Bool) {
        print("image = \(image), sr = \(sr), sc = \(sc), newColor = \(newColor), left = \(left), top = \(top), right = \(right), bottom = \(bottom)")
        if image[sr][sc] == originColor {
            image[sr][sc] = newColor
        } else {
            return
        }

        if top && sr > 0 {
            helper(&image, sr-1, sc, originColor, newColor, true, true, true, false) 
        }
        if bottom && sr < image.count-1 {
            helper(&image, sr+1, sc, originColor, newColor, true, false, true, true) 
        }
        if left && sc > 0 {
            helper(&image, sr, sc-1, originColor, newColor, true, true, false, true) 
        }
        if right && sc < image[0].count-1 {
            helper(&image, sr, sc+1, originColor, newColor, false, true, true, true) 
        }
    }
}

// let image = [[1,1,1],[1,1,0],[1,0,1]]
// let sr = 1
// let sc = 1
// let newColor = 2

// let image = [[0,0,1],[0,1,1]]
// let sr = 1
// let sc = 1
// let newColor = 2


let image = [[0,1,1],[0,1,1]]
let sr = 1
let sc = 1
let newColor = 1

let ans = Solution().floodFill(image, sr, sc, newColor)
print("ans = \(ans)")