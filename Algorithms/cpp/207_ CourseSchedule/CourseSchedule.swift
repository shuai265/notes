
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var courseMap: [Int: [Int]] = [:] // [key: targetCurses, val: dependedCurses]
        for list in prerequisites {
            if courseMap[list[0]] != nil {
                var courseList = courseMap[list[0]]!
                courseList.append(list[1])
                courseMap[list[0]] = courseList
            } else {
                courseMap[list[0]] = [list[1]]
            }
        }

        var scanedCourseSet = Set<Int>()
        for i in 0..<numCourses {
            var neededCourseSet = Set<Int>()
            if !helper(i, courseMap, &neededCourseSet, &scanedCourseSet) {
                return false
            }
        }
        return true
    }
    
    func helper(_ targetCurses: Int, _ courseMap: [Int: [Int]], _ courseSet: inout Set<Int>, _ scanedCourseSet: inout Set<Int>) -> Bool {
        if scanedCourseSet.contains(targetCurses) {
            return true
        }
        if courseSet.contains(targetCurses) {
            return false
        }

        courseSet.insert(targetCurses)
        if let dependedCourseList = courseMap[targetCurses] {
            for course in dependedCourseList {
                if !helper(course, courseMap, &courseSet, &scanedCourseSet) {
                    return false
                }
                // if courseSet.contains(course) {
                //     return false
                // } else {
                //     if !helper(course, courseMap, &courseSet, &scanedCourseSet) {
                //         return false
                //     }
                // }
            }
        }
        scanedCourseSet.insert(targetCurses)
        return true
    }
}

let numCourses = 2
// let prerequisites = [[1,0]]
let prerequisites = [[1,0],[0,1]]
let canFinish = Solution().canFinish(numCourses, prerequisites)
print("\(canFinish)")
