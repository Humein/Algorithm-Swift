import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}
/// 打印链表
func printList(_ node: ListNode) -> [Int]{
    var nodes = [Int]()
    // 引入临时 防止原数据修改
    var curNode :ListNode? = node
    while curNode != nil {
        nodes.append(curNode!.val)
        curNode = curNode!.next
    }
    return nodes
}


//MARK: 206. 反转链表  递归还是在借助函数调用栈的思想<入站/出站 去处理逻辑>，其实本质上也是一个栈。

/*
 递归等价条件中，一定是范围不断在缩小，对于链表来说，就是链表的节点个数不断在变小
 
 递归：复杂度分析

 时间复杂度：O(n)，假设 n 是列表的长度，那么时间复杂度为 O(n)。
 空间复杂度：O(n)，由于使用递归，将会使用隐式栈空间。递归深度可能会达到 n 层
 
 */

// 2021.2.24  只需要把节点 2(head?.next)的 next 指向 1(head)，然后把 1(head) 的 next 指向 nil

/* 2021.12.29 思路：
 let newHead = reverse(head?.next)
 入站获取最后节点
 
 head?.next?.next = head
 head?.next = nil
 出战：即从尾部开始进行反转；直到头节点
 */

/* 2022.01.11 思路：
首先理解：node(当前节点) node.next(当前节点的next指向) node.next.next(当前节点的next节点的next指向)
  
 
 */

func reverse220111(_ head: ListNode?) -> ListNode?{
    if head == nil || head?.next == nil {
        return head
    }
    // 入战 找出新头节点
    // 以第二个节点开始遍历链表；直至递归无法进行下去，这样就找到当前链表尾节点(即新链表头节点；⚠️这时节点还未进行翻转)
    
    print("入战链表日志 \(head?.val ?? -1)") //   1->2->3->4->nil 节点会从前向前后压入
    let newHead = reverse220111(head?.next) // newHead is 4
    print("出战链表日志 \(head?.val ?? -1)") //  1->2->3->4->nil 节点会从后向前弹出


    // 出战 翻转next指向
    /* 1->2->3->4->nil
     注意现在入参是从3开始进行反转的：
     head?.next is 4(即新头节点)
     head is 3
     */
    head?.next?.next = head
    // 依次到最最后节点(1)后next指向nil
    head?.next = nil // 这个是不会导致链表从中间断掉；因为每次 head?.next?.next = head 会重置next指向 直至head为尾部节点。
    print("end")
    return newHead
}

let node5 = ListNode(val: 4, next: nil)
let node4 = ListNode(val: 3, next: node5)
let node3 = ListNode(val: 2, next: node4)
let m = ListNode(val: 1, next: node3)
print("打印链表 \(printList(m))")
reverse220111(m)!


/**
 迭代: 复杂度分析
 
 时间复杂度：O(n)，假设 n 是列表的长度，时间复杂度是 O(n)。
 空间复杂度：O(1)。
 */

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 定义3个节点
        var pre:ListNode? = nil
        var cur:ListNode? = head
        var tmp:ListNode? = nil

        while cur != nil {
            //暂存cur的下一个节点
            tmp = cur!.next
            //cur指向pre，实现反转
            cur!.next = pre
            //pre和cur同时后移一位
            pre = cur
            cur = tmp
        }
        
        return pre
    }
}
