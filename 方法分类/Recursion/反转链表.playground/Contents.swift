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


/// 206. 反转链表  递归还是在借助函数调用栈的思想<出站/入站 时间去处理逻辑>，其实本质上也是一个栈。
/*
 等价条件中，一定是范围不断在缩小，对于链表来说，就是链表的节点个数不断在变小
 */

func reverse(_ head: ListNode?) -> ListNode?{
    if head == nil || head?.next == nil {
        return head
    }
    // 获取链表尾部为新head
    // 入站 获取栈顶元素 head?.next
    // 不放在入站时候进行逻辑处理  因为会改变head?.next
    let newHead = reverse(head?.next)
    
    
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
    head?.next?.next = head
    head?.next = nil
    print("出战 \(head?.val)")
    return newHead
}
let node5 = ListNode(val: 5, next: nil)
let node4 = ListNode(val: 4, next: node5)
let node3 = ListNode(val: 3, next: node4)
let m = ListNode(val: 2, next: node3)
print("测试 \(m.next?.next?.val)")
print(printList(m))
print(printList(reverse(m)!))




func reverseNode(head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let newHead = reverseNode(head: head?.next)
    head?.next?.next = head
    head?.next = nil
    return newHead
}
print(printList(reverseNode(head: m)!))
