import UIKit
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/**
 203. 移除链表元素
 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。
 
 思路：
   引入虚拟头节点 newHead 用于引用当前链表
   引入尾节点newTail 用于构建新链表
   当前 链表head 用于遍历

 */

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        // 新链表头节点
        let newHead = ListNode(0)
        newHead.next = head
        // 新链表尾节点
        var newTail = newHead
        
        while newTail.next != nil {
            if newTail.next!.val == val {
                // 跳过要删除的节点
                newTail.next = newTail.next?.next
            } else {
                // 继续遍历
                newTail = newTail.next!
            }
        }
        return newHead.next
    }
}
