import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}


//MARK: offer22：链表中倒数第k个结点
/*
 输入一个链表，输出该链表中倒数第k个结点。为了符合大多数人的习惯，
  本题从1开始计数，即链表的尾结点是倒数第1个结点。例如一个链表有6个结点，
  从头结点开始它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个结点是值为4的结点。

 
 最终思路：  双指针
 假如有两个指针一个快一个慢，快和慢之间的距离为k，就是从链表尾到倒数第k个节点的距离，当快的指针走链表尾部，这时候慢指针是不是就是指向倒数第k个节点
 假如快指针为p1，慢指针为p2 ，p1 先沿着链表头部走到第k个位置，此时p2开始前行，每次前进一步，当p1==null时，快指针走到了链表尾部，此时p2的位置就是倒数第k个节点
 <只遍历一次的话,可以准备一个size为k的滑动窗口,遍历结束后,窗口里面最后一个元素就是答案了>
 
 p1 - p2 = k while p1 == nil now p2 = k

 */

func findKNode(_ head: ListNode?,k: Int) -> ListNode?{
    if k <= 0 {
        return nil
    }
    
    if head == nil || head?.next == nil {
        return head
    }
    // p2 fast
    var p1 :ListNode = head!, p2 :ListNode? = head
    
    //快指针先走k步 ，为什么1开始？开始index 是 1
    for _ in 1..<k{
        if p2?.next != nil {
            p2 = p2?.next
        }else{
            //如果k大于链表长度，返回空
            return nil
        }
    }
    
    //快慢指针同时往后遍历
    while p2?.next != nil {
        p1 = p1.next!
        p2 = p2?.next
    }
    return p1
}


//MARK: 19. 删除链表的倒数第N个节点
/**
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 示例：

 给定一个链表: 1->2->3->4->5, 和 n = 2.

 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 */
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode?{
    // 引入虚拟头节点 防止删除的是头节点
    let prev: ListNode? = ListNode(val: 0, next: nil)
    prev?.next = head
    
    // 定义双指针
    var low = prev
    var high = prev
    
    // 快指针先走k步 因为有虚拟节点要从0开始
    for _ in 0..<n {
        high = high?.next
    }

    // 然后同时走
    while high?.next != nil {
        low = low?.next
        high = high?.next
    }

    // 通过慢指针进行删除操作
    low?.next = low?.next?.next
    
    // 返回虚拟头节点的next
    return prev?.next

}
