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
 2. 两数相加
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

思路：
  1. 虚拟头节点 dummyHead
  2.  尾节点 tail 用于遍历
  3.  进位值 carry
 

 */

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 边界
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        // 定义 1.新链表的虚拟节点  2.新链表尾节点  3.进位值
        let dummyHead = ListNode(0)
        var tailHead = dummyHead
        var carry = 0
        
        // 转换为可变节点
        var t1 = l1
        var t2 = l2
        
        // 循环条件
        while t1 != nil || t2 != nil {
            var v1 = 0
            if t1 != nil {
                v1 = t1!.val
                t1 = t1?.next
            }
            
            var v2 = 0
            if t2 != nil {
                v2 = t2!.val
                t2 = t2?.next
            }
            
            let sum = v1 + v2 + carry
            
            // 设置进位
            carry = sum / 10
            
            
            // sum 的个位数作为新节点的值
            tailHead.next = ListNode(sum % 10)
            tailHead = tailHead.next!
        }
        
        // 检查最后进位值
        if carry > 0 {
            tailHead.next = ListNode(carry)
        }
        
        return dummyHead.next
    }
}
