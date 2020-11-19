import UIKit
class ListNode {
    var val: Int
    var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//18 合并K个排序链表
/*
 合并 k 个排序链表，返回合并后的排序链表。https://www.cnblogs.com/strengthen/p/9891419.html

 - 1,   从21 合并两个有序链表的基础上，我们已经能够解决两个有序链表的问题，现在是k个有序链表，我们可以将第一二个有序链表进行合并，然后将新的有序链表再继续跟第三个有序链表合并，直到将所有的有序链表合并完成。 这样做思路上是可行的，但是算法的时间复杂度将会很大，具体就不计算了。有兴趣的自己计算下。
 - 2,  根据思路一，我们是一个一个地将有序链表组成新的链表，这里一个进行了k-1次两个有序链表的合并操作。而且随着新链表越来越大，时间复杂度也会越来越高。 这里有一种简化的方式，可以先将k个有序链表先以2个链表为一组进行合并，得出结果后，再将所有的新有序链表继续上面的方式，2个链表为一组进行合并。直至将所有的有序链表进行合并。 这个思路会比思路一的算法复杂度少一点。
 - 3 ,  我们换个不一样的思路。我们先遍历一次所有的链表中的元素。然后将元素全部放在一个数组里面。接着对这个数组进行排序，最终将排序后的数组里面的所有元素链接起来。 这种方案的复杂度和代码量会比前集中思路更好，更简单。

 空间复杂度：因为需要一个数组，所以需要额外的空间。这个空间的大小就是链表元素的个数 时间复杂度：假设一个是n个元素，对链表进行遍历(n),对数组进行排序(排序算法可以达到nlogn)，最终链接所有元素(n),就是 （n+nlogn+n），也就是O(nlogn)。

 利用第三空间-数组
 */

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 {
        return nil
    }
    var arr: [Int] = []
    
    //遍历链表数组，将每个链表的val直接加入数组中
    for i in lists {
        var node = i
        while node != nil {
            arr.append(node!.val)
            node = node?.next
        }
    }
    
    if arr.count == 0 {
        return nil
    }
    
    //链表val值的数组排序
    arr = arr.sorted()
    //将排好序的数组重新合成一个链表
    let head = ListNode(arr[0])
    var node = head
    
    for i in arr {
        node.next = ListNode(arr[i])
        node = node.next!
    }
    
    return head.next
}

