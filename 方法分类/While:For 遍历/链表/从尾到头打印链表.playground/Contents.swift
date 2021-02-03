import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/**
 从尾到头打印链表
 
 用数组作为辅助栈
 */
func reversePrint(_ head: ListNode?) -> [Int] {
    guard head != nil else {
        return []
    }
    var listArr = [Int]()
    listArr.insert((head?.val)!, at: 0)
    while head?.next != nil {
        listArr.insert((head?.next?.val)!, at: 0)
        head?.next = head?.next?.next
    }
    return listArr
}

