/**
 * 设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。
 * push(x) -- 将元素 x 推入栈中。
 * pop() -- 删除栈顶的元素。
 * top() -- 获取栈顶元素。
 * getMin() -- 检索栈中的最小元素。
 */


class MinStack {
    var stack: [Int] = []
    var min: Int = Int.max
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if x < min {
            min = x
        }
    }
    
    func pop() {
        if stack.count > 0 {
            let lastVal = stack.last
            stack.removeLast()
            if lastVal == min {
                updateMin()
            }
        }
    }
    
    func top() -> Int {
        if stack.count > 0 {
            return stack.last!
        }
        return -1
    }
    
    func getMin() -> Int {
        return min
    }

    func updateMin() {
        min = Int.max
        for num in stack {
            if num < min {
                min = num
            }
        }
    }
}
/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

