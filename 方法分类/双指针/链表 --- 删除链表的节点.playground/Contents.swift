import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int,_ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

// 错误
func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    var newHead :ListNode? = ListNode(0,nil)
    newHead?.next = head
    while newHead?.next != nil {
        if newHead?.next?.val == val {
            newHead?.next = newHead?.next?.next
        }
        newHead = newHead?.next
    }
    return newHead?.next
}

// 双指针
// 使用两个指针一个指向当前的节点，一个指向当前的上一个节点
func deleteNode0(_ head: ListNode?, _ val: Int) -> ListNode? {
    //初始化一个虚拟节点
    let dumHead :ListNode? = ListNode.init(0, nil)
    //让虚拟节点指向头结点
    dumHead?.next = head
    // 声明双指针
    var pre = dumHead
    var cur = head
    while cur != nil {
        if cur?.val == val {
            //如果找到要删除的结点，直接把他删除. 并跳出这一次的循环操作
            pre?.next = cur?.next
            break
        }
        //如果没找到，pre指针和cur指针都同时往后移一步
        pre = pre?.next
        cur = cur?.next
    }
    //最后返回虚拟节点的下一个结点即可
    return dumHead?.next
}


// https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof/solution/shuang-zhi-zhen-he-di-gui-liang-chong-fang-shi-jie/
/*
 递归的模板，我们看下
 public void recursion(参数0) {
     if (终止条件) {
         return;
     }

     可能有一些逻辑运算
     recursion(参数1)
     可能有一些逻辑运算
     recursion(参数2)
             ……
     recursion(参数n)
     可能有一些逻辑运算
 }
 */

// 递归
func deleteNode1(_ head: ListNode?, _ val: Int) -> ListNode? {
    // 终止条件
    if head == nil {
        return head
    }
    // head结点的值等于val，我们直接返回head结点的下一个结点
    if head?.val == val {
        return head?.next
    }
    // 否则也就是说头结点是删不掉的，我们就递归调用，从头结点的下一个开始继续上面的操作，直到删除为止。
    head?.next = deleteNode1(head?.next, val)
    return head
}
