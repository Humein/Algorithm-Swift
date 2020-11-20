import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}

//MARK: 234. 回文链表

/**
 请判断一个链表是否为回文链表。

 示例 1:

 输入: 1->2
 输出: false
 示例 2:

 输入: 1->2->2->1
 输出: true
 
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？


 快慢指针： 整个流程可以分为以下五个步骤：

 找到前半部分链表的尾节点。
 反转后半部分链表。
 判断是否回文。
 恢复链表。
 返回结果。
 执行步骤一，我们可以计算链表节点的数量，然后遍历链表找到前半部分的尾节点。

 我们也可以使用快慢指针在一次遍历中找到：慢指针一次走一步，快指针一次走两步，快慢指针同时出发。当快指针移动到链表的末尾时，慢指针恰好到链表的中间。通过慢指针将链表分为两部分。

 若链表有奇数个节点，则中间的节点应该看作是前半部分。

 步骤二可以使用「206. 反转链表」问题中的解决方法来反转链表的后半部分。

 步骤三比较两个部分的值，当后半部分到达末尾则比较完成，可以忽略计数情况中的中间节点。

 步骤四与步骤二使用的函数相同，再反转一次恢复链表本身。

   复杂度分析

 时间复杂度：O(n)，其中 nn 指的是链表的大小。

 空间复杂度：O(1)。我们只会修改原本链表中节点的指向，而在堆栈上的堆栈帧不超过 O(1)。

 */

/**
 
 一共为两个步骤：

 1. 复制链表值到数组列表中。
 2. 使用双指针法判断是否为回文。
 
 复杂度分析
 时间复杂度：O(n)，其中 nn 指的是链表的元素个数。
 第一步： 遍历链表并将值复制到数组中，O(n)。
 第二步：双指针判断是否为回文，执行了 O(n/2)次的判断，即 O(n)。
 总的时间复杂度：O(2n) = O(n)。
 空间复杂度：O(n)，其中 n 指的是链表的元素个数，我们使用了一个数组列表存放链表的元素值。
 
 递归思路一样：
  不过这种方法不仅使用了 O(n) 的空间，且比第一种方法更差，因为在许多语言中，堆栈帧的开销很大（如 Python），并且最大的运行时堆栈深度为 1000（可以增加，但是有可能导致底层解释程序内存出错）。为每个节点创建堆栈帧极大的限制了算法能够处理的最大链表大小。

 */
func isPalindrome(_ head: ListNode?) -> Bool {
    var nodeArray :Array = [ListNode]()
    var prev :ListNode? = ListNode.init(val: 0, next: nil)
    prev?.next = head
    while prev?.next != nil {
        nodeArray.append((prev?.next)!)
        prev = prev?.next
    }
    var i :Int = 0, j :Int = nodeArray.count - 1
    while i < j {
        if nodeArray[i].val != nodeArray[j].val {
            return false
        }
        i = i + 1
        j = j - 1
    }
    return true
}
