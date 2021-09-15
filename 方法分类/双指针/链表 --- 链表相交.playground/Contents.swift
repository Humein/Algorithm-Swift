import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}


/**
 剑指 Offer 52. 两个链表的第一个公共节点
 相交链表
 编写一个程序，找到两个单链表相交的起始节点。
 注意：
 如果两个链表没有交点，返回 null.
 在返回结果后，两个链表仍须保持原有的结构。
 可假定整个链表结构中没有循环。
 程序尽量满足 O(n) 时间复杂度，且仅用 O(1) 内存

 
 双指针法O(n)
*/
func getIntersectNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    /**
        定义两个指针, 第一轮让两个到达末尾的节点指向另一个链表的头部, 最后如果相遇则为交点(在第一轮移动中恰好抹除了长度差)
        两个指针等于移动了相同的距离, 有交点就返回, 无交点就是各走了两条指针的长度
          **/
    if headA == nil || headB == nil {
        return nil
    }
    
    // 设置指针用于遍历
    var p1 = headA
    var p2 = headB
    // 在这里第一轮体现在pA和pB第一次到达尾部会移向另一链表的表头, 而第二轮体现在如果pA或pB相交就返回交点, 不相交最后就是null==null
    
    // p1 == nil 指针指向另一个链表的header (headB)
    while p1 !== p2 {
        p1 = (p1 != nil) ? p1?.next : headB
        p2 = (p2 != nil) ? p2?.next : headA
    }
    return p1
}












func getIntersectNode0(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil {
        return nil
    }
    var p1 = headA, p2 = headB
    while p1 !== p2 {
        p1 = (p1 == nil) ? headB : p1?.next
        p2 = (p2 == nil) ? headA : p2?.next
    }
    return p1
}
