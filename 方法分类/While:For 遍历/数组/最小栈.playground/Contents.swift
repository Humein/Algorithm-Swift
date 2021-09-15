import UIKit
/**
 155. 最小栈
 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) —— 将元素 x 推入栈中。
 pop() —— 删除栈顶的元素。
 top() —— 获取栈顶元素。
 getMin() —— 检索栈中的最小元素。


 */


class MinStack {
    var dataStack = [Int]()
    var minStack = [Int]()
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ val: Int) {
        dataStack.append(val)
        if minStack.isEmpty {
            minStack.append(val)
        }else{
            minStack.append(min(val,minStack.last!))
        }
    }
    
    func pop() {
        dataStack.popLast()
        minStack.popLast()
    }
    
    func top() -> Int {
        return dataStack.last!
    }
    
    func getMin() -> Int {
        return minStack.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
