import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}

//21 合并两个有序链表
// 迭代 可类比88题
// 递归
/*
 时间复杂度：O(n + m)。 因为每次调用递归都会去掉 l1 或者 l2 的头元素（直到至少有一个链表为空），函数 mergeTwoList 中只会遍历每个元素一次。所以，时间复杂度与合并后的链表长度为线性关系。

 空间复杂度：O(n + m)。调用 mergeTwoLists 退出时 l1 和 l2 中每个元素都一定已经被遍历过了，所以 n + mn+m 个栈帧会消耗 O(n + m) 的空间。
 
 首先同时遍历两个链表，比较两个链表当前的值，小的值就作为新链表的元素，然后小的值的链表就走到下一个元素，大的值的链表还是当前元素。接着继续遍历，重复上述步骤，直到链表遍历完毕。这样就可以得到新的有序链表了。 需要注意几个地方：

 - 这个题目，最好是创建一个头结点来作为辅助，这样就不用判断新链表的头结点是l1的头结点还是l2的头结点了。
 - 遍历到最后，一般会有一个链表是先遍历完毕的。接着将另外一个链表拼接起来就行了，不用继续再一个个遍历拼接。

 */
func mergeTwoList(_ m: ListNode?, _ n: ListNode?) -> ListNode?{
    // 递归边界
    if m == nil {
        print(n!.val)
        return n
    }
    if n == nil {
        print(m!.val)
        return m
    }
    if m!.val < n!.val {
        // 递归转移方程 m?.next
        print(m!.val) // 2-3-4  入栈
        m?.next = mergeTwoList(m?.next, n)
        print(m!.val) // 4-3-2  出栈
        return m
    }else{
        print(n!.val)
        n?.next = mergeTwoList(m, n?.next)
        print(n!.val)
        return n
    }
}

let node5 = ListNode(val: 6, next: nil)
let node4 = ListNode(val: 4, next: nil)
let node3 = ListNode(val: 3, next: node4)
let n = ListNode(val: 5, next: node5)
let m = ListNode(val: 2, next: node3)
print("2-3-4")
print("5-6")
mergeTwoList(m,n)

func mergeTwo(m: ListNode?, n: ListNode?) -> ListNode?{
    if m == nil {
        return n
    }
    if n == nil {
        return m
    }
    
    if m!.val < n!.val {
        m?.next = mergeTwo(m: m?.next, n: n)
        return m
    }else {
        n?.next = mergeTwo(m: m, n: n?.next)
        return n
    }
}


// 2020.10.10
// 2020.2.4
// 2020.2.22  不能直接对链表进行操作，因为是let对象，但可以对next节点进行操作。     
func mergeTwo2(_ m: ListNode?, _ n: ListNode?) -> ListNode?{
    // 递归边界
    if m == nil {
        return n
    }
    if n == nil {
        return m
    }
    // 进行递归
    if m!.val < n!.val {
        m?.next = mergeTwo2(m?.next, n)
        return m
    }else{
        n?.next = mergeTwo2(m, n?.next)
        return n
    }
}
