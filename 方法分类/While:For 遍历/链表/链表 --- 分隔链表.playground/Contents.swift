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
 86. 分隔链表
 给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。

 你应当 保留 两个分区中每个节点的初始相对位置。
 
 思 路：
  引入两个链表，循环中将符合条件的节点放入对应链表
   
   虚拟头节点不动；尾节点动
 
 */

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        let lHead = ListNode(0)
        var lTail = lHead
        let rHead = ListNode(0)
        var rTail = rHead
        
        var header = head
        
        while header != nil {
            if header!.val < x {
                // 先拼接
                lTail.next = header
                // 后更新lTail
                lTail = header!
            }else{
                
                rTail.next = header
                // 后更新lTail
                rTail = header!
            }

            header = header?.next
        }
        // 避免rTail next 没有指向 nil
        rTail.next = nil
        
        // 拼接
        lTail.next = rHead.next
        
        return lHead.next
    }
}
