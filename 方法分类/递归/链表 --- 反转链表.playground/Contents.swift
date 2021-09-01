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


//MARK: 206. 反转链表  递归还是在借助函数调用栈的思想<出站/入站 时间去处理逻辑>，其实本质上也是一个栈。

/*
 等价条件中，一定是范围不断在缩小，对于链表来说，就是链表的节点个数不断在变小
 
 递归：复杂度分析

 时间复杂度：O(n)，假设 n 是列表的长度，那么时间复杂度为 O(n)。
 空间复杂度：O(n)，由于使用递归，将会使用隐式栈空间。递归深度可能会达到 n 层
 
 */

// 2021.2.24  只需要把节点 2(head?.next)的 next 指向 1(head)，然后把 1(head) 的 next 指向 nil

func reverse(_ head: ListNode?) -> ListNode?{
    if head == nil || head?.next == nil {
        return head
    }
    // 直接获取链表尾部做为新head
    // 入站 获取栈顶元素 head?.next
    print("入战 \(head?.val ?? 0)")
    let newHead = reverse(head?.next)
    print("出战 \(head?.val ?? 0)")

    
    // 出站时候 处理逻辑
    // 反转 只需要把节点 2 的 next 指向 1，然后把 1 的 next 指向 null,不就行了？
    /**
     = 的左边  head?.next?.next 解析
     head?.next?.  代表 head的下一个节点
     .next 代表 head的下一个节点 的指向(next)
     ⚠️ = 的左边最后一个next/pre 都代表指向 <head.next 的也是>
      
     = 的右边 head?.next?.next 解析
     代表 head的下下个节点
     */
    // ⚠️ 主要是将 之前头节点(5) 拼接到翻转后的链表后面
    /*
     head => 5
     head?.next? => 4
     */
    head?.next?.next = head
    head?.next = nil
    return newHead
}
let node5 = ListNode(val: 5, next: nil)
let node4 = ListNode(val: 4, next: node5)
let node3 = ListNode(val: 3, next: node4)
let m = ListNode(val: 2, next: node3)
//print("测试 \(m.next?.next?.val ?? 0)")
//print(printList(m))
print(printList(reverse(m)!))


/**
 迭代: 复杂度分析
 
 时间复杂度：O(n)，假设 n 是列表的长度，时间复杂度是 O(n)。
 空间复杂度：O(1)。
 */
func reverseList(_ head: ListNode?) -> ListNode? {
    var newHead :ListNode? = nil
    var curr :ListNode? = head
    while curr != nil {
        let nextTemp = curr?.next
        
        curr?.next = newHead
        newHead = curr
        curr = nextTemp
    }
    return newHead
}

