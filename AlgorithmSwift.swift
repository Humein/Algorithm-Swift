//
//  AlgorithmSwift.swift
//  
//
//  Created by XinXin on 2020/5/23.
//
import UIKit
class AlgorithmSwift: NSObject {
    /**[swift-algorithm-club](https://github.com/raywenderlich/swift-algorithm-club)
       [LeetCode-Swift](https://github.com/soapyigu/LeetCode-Swift)
       [swift-leetCode 目录](https://github.com/strengthen/LeetCode/blob/master/README-CN.md)
     */

    /// 链表结构
    class listNode {
        var next: listNode?
        var val: Int
        init(value: Int, next: listNode?) {
            self.val = value
            self.next = next
        }
    }
    public class LinkNode{
        public var val: Int
        public var next: LinkNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }


    //MARK:- 二叉树 - 递归
    /// 1-100 相加
    func recursion100(_ n :Int) -> Int{
        if n == 1 {
            return 1
        }
        print(n)
        return recursion100(n - 1) + n
    }

    /// M-N 相加
    func recursionNM(_ n: Int, _ m: Int)  ->Int{
        if m == n {
            return n
        }
        return n < m ? recursionNM(n, m - 1 ) + m  : recursionNM(n - 1,m) + n
    }

    /// 遍历子view
    func recursionSubView(_ view :UIView){
        if view.subviews.count > 0 {
            for item in view.subviews{
                print(item)
                recursionSubView(item)
            }
        }
    }


    //MARK:- 链表 - 多指针/递归
    /*
     相交链表 编写一个程序，找到两个单链表相交的起始节点。
     双指针法O(n)
     ab 两个链表同时遍历，如果其中有一个为nil,就重置成另一个，然后继续。直到a==b
     */
    func getIntersectionNode(_ headA : listNode?, _ headB : listNode?)  ->  listNode?{
        if headA == nil || headB == nil {
            return nil
        }
        var pA = headA
        var pB = headB
        while pA !== pB {
            pA = (pA == nil) ? headB : pA?.next
            pB = (pB == nil) ? headA : pB?.next
        }
        return pA
    }

    /* 21 合并两个有序链表 递归
     时间复杂度：O(n + m)。
     空间复杂度：O(n + m)。
     首先同时遍历两个链表，比较两个链表当前的值，小的值就作为新链表的元素，然后小的值的链表就走到下一个元素，大的值的链表还是当前元素。接着继续遍历，重复上述步骤，直到链表遍历完毕。这样就可以得到新的有序链表了。 需要注意几个地方：
     
     - 这个题目，最好是创建一个头结点来作为辅助，这样就不用判断新链表的头结点是l1的头结点还是l2的头结点了。
     - 遍历到最后，一般会有一个链表是先遍历完毕的。接着将另外一个链表拼接起来就行了，不用继续再一个个遍历拼接。

     */
    func mergeTwoLists(_ l1: listNode?,_ l2: listNode?) -> listNode?{
        // l1/l2 == nil  边界          l1?.next 递归转移方程
        if l1 == nil {
            return l2
        }
        if l2 == nil{
            return l1
        }
        if l1!.val < l2!.val{
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        }else{
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }

    /*
     206. 反转链表  递归还是在借助函数调用栈的思想，其实本质上也是一个栈。
     等价条件中，一定是范围不断在缩小，对于链表来说，就是链表的节点个数不断在变小

     '一个递归一般包含3个点
     1. 边界 一般也是递归结束条件
     2. 递归转移方程
     3. 出/入栈的地方 处理逻辑
     
     */
    func reverseLinkRec(_ head: listNode?) -> listNode?{
        if head == nil || head?.next == nil {
            return head
        }
        // 不放在 逻辑处理后面 是因为逻辑处理 会改变head?.next
        let newHead = reverseLinkRec(head?.next) // 栈顶
    //  只需要把节点 2 的 next 指向 1，然后把 1 的 next 指向 null,不就行了？
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    // 迭代实现
    func ReverseListWhile(_ head: LinkNode?) -> LinkNode? {
        var reversedHead: LinkNode? = nil
        var node: LinkNode? = head
        var prev: LinkNode? = nil
        while node != nil {
            let next = node?.next
            if next == nil {
                reversedHead = node
            }
            node?.next = prev
            prev = node
            node = next
        }
        return reversedHead
    }


    //MARK:- 字符串 - 多指针
    /*
     344. 反转字符串
    双指针 迭代方式
    */
    func reverseString(_ s: inout [Character]){
        //记得 边界1
        if  s.count < 2 {
            return
        }
        var p1 = 0, p2 = s.count - 1
        // let sArr = Array(s) 输入就是数组了
        // 指针边界2
        while p1 < p2 {
            // tmp 应该提出来声明 减少创建
            let tmp = s[p1]
            s[p1] = s[p2]
            s[p2] = tmp
            p1 += 1
            p2 -= 1
        }
    }


    /**
     单词反转  s 是 "the sky is blue", 那么反转就是 "blue is sky the"。
    */
    func reverseWords(s: String?) -> String? {
      guard let s = s else {
        return nil
      }
      var chars = Array(s), start = 0
      reverse(&chars, 0, chars.count - 1)
      for i in 0 ..< chars.count {
        if i == chars.count - 1 || chars[i + 1] == " " {
          reverse(&chars, start, i)
          start = i + 2
        }
      }
      return String(chars)
    }
    // 字符串反转
    func reverse<T>(_ chars: inout [T], _ start: Int, _ end: Int) {
      var start = start, end = end
      while start < end {
        swap(&chars, start, end)
        start += 1
        end -= 1
      }
    }
    func swap<T>(_ chars: inout [T], _ p: Int, _ q: Int) {
      (chars[p], chars[q]) = (chars[q], chars[p])
    }


    /*
     392.判断子序列
     判断 s 是否为 t 的子序列。
     本文主要运用的是双指针的思想，指针si指向s字符串的首部，指针ti指向t字符串的首部。
     */
    func isSubsequence(_ s :String, _ t :String) -> Bool{
        var sp = 0, tp = 0
        let sArray = Array(s), tArray = Array(t)
        //指针边界
        while sp < sArray.count && tp < tArray.count  {
            if sArray[sp] == tArray[tp] {
                sp += 1
            }
            tp += 1
        }
        return sp == s.count
    }

    //MARK:- 数组
    // 658. 找到 K 个最接近的元素
    /*
     变种 二分查找
    给定一个排序好的数组，两个整数 k 和 x，从数组中找到最靠近 x（两数之差最小）的 k 个数。返回的结果必须要是按升序排好的。如果有两个数与 x 的差值一样，优先选择数值较小的那个数。
    */
    func findClosestElements(_ arr: [Int],_ k: Int,_ x: Int) -> [Int]{
        var p1 = 0,p2 = arr.count - k
        while p1 < p2 {
            let mid = (p2 - p1) / 2 + p1
            if x - arr[mid] > arr[mid + k] - x {
                p1 = mid + 1
            }else{
                p2 = mid
            }
        }
        
        return Array(arr[p1..<(p1+k)])
    }
    
    /*
     278. 第一个错误的版本
      假设你有 n 个版本 [1, 2, ..., n]，你想找出导致之后所有版本出错的第一个错误的版本。
      你可以通过调用 bool isBadVersion(version) 接口来判断版本号 version 是否在单元测试中出错。实现一个函数来查找第一个错误的版本。你应该尽量减少对调用 API 的次数。
      给定 n = 5，并且 version = 4 是第一个错误的版本。
      二分查找 双指针 迭代方式
    */
    func isBadVersions(_ target: Int) -> Bool{
        print("isBadVersion")
        if target >= 4 {
            return true
        }else{
            return false
        }
    }
    func findFirstError(_ nums :[Int],_ target :Int) -> Int {
        var p1 = 1, p2 = nums.count
        while p1 < p2 {
            let mid = (p2 - p1) / 2 + p1
            if isBadVersions(mid) {
                p2 = mid
            }else{
                p1 = mid + 1
            }
            return p1
        }
        return p1
    }


    //MARK:- 排序
    //冒泡排序 升序
    /*
     O(n²) 时间
     O(1)  空间
     冒泡排序是一种稳定的排序
     */
    func bubbleSort(unsortedArray: inout [Int]){
        guard unsortedArray.count > 1 else{
            return
        }

        for i in 0 ..< unsortedArray.count - 1 {
            var exchanged = false
            for j in 0 ..< unsortedArray.count - 1 - i {
                if unsortedArray[j] > unsortedArray[j+1] {
                    unsortedArray.swapAt(j, j+1)
                    exchanged = true
                }
            }
            //若无交换则可直接返回
            if exchanged == false {
                break
            }
        }
    }

    //MARK:- 动态规划

    //MARK:- 贪心算法

}
