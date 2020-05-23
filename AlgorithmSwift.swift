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

    /// 二叉树结构
    public class TreeNode: Equatable {
         public var parent: TreeNode?
         public var val: Int
         public var left: TreeNode?
         public var right: TreeNode?
         public init(value: Int, left: TreeNode?, right: TreeNode?) {
             self.val = value
             self.left = left
             self.right = right
         }
        public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
            return lhs.val == rhs.val
        }
     }
    
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
    
    /*
     翻转二叉树 递归最简单
     迭代法的思路是BFS或者DFS，这两种方法都可以实现，实际上也是二叉树的遍历。
     BFS用Queue实现， 宽度优先搜索（breadth first search
     DFS的话将代码中的Queue换成Stack。
     */
    func invertTree(_ root :TreeNode?) -> TreeNode? {
        // 边界
        if root == nil {
            return nil
        }
        //递归转移
        let right = invertTree(root?.right) // stack push
        let left = invertTree(root?.left) // stack push
        root?.left = right // pop
        root?.right = left // pop
        return root
    }
    /**
    给定一个二叉树，返回它的 前序遍历。
     前序遍历 DFS 递归
     根 -> 左 -> 右
    */
    
    class Solution {
        var res: [Int] = []
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        res.append(root.val)
        _ = preorderTraversal(root.left)
        _ = preorderTraversal(root.right)
        return res
    }

    // 遍历 栈
    class Solution1 {
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {return []}
        var stack = [TreeNode]()
        var res = [Int]()
        stack.append(root!)
        // 栈不为空
        while let node = stack.popLast() {
            res.append(node.val)
            if let right = node.right { stack.append(right) }
            if let left = node.left { stack.append(left) }
        }
        return res
            
        }
    }

    func travelSubView(_ rootView: UIView){
        if rootView.subviews.count == 0 {
            return
        }
        var res = [UIView]()
        var queue = [UIView]()
        queue.append(rootView)
        while let view = queue.popLast() {
            res.append(view)
            if view.subviews.count > 0 {
                for item in view.subviews{
                    queue.append(item)
                }
            }
        }
    }
        
    /**
     中序遍历
    左子树-> 根结点 -> 右子树
     后序遍历：左子树 ---> 右子树 ---> 根结点

     */
    // 递归
    class Solution {
        var res = [Int]()
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            if root == nil {
                return []
            }
            _ = inorderTraversal(root?.left)
            res.append(root!.val)
            _ = inorderTraversal(root?.right)

            return res
        }
    }

    // 迭代 栈
    class Solutions {
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            var stack: [TreeNode] = []
            var result: [Int] = []
            var node: TreeNode? = root
            
            while node != nil || !stack.isEmpty {
                while node != nil {
                    stack.append(node!)
                    node = node!.left
                }
                
                node = stack.popLast()
                result.append(node!.val)
                node = node?.right
            }
            
            return result
        }
    }
        
    /**
    二叉树层次遍历 BFS 利用队列的方式
    */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else {
            return [[Int]]()
        }
        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(r)
        while queue.count > 0 {
            let layer = Array(queue)
            var layerVal = [Int]()
            queue.removeAll()
            for node in layer {
                layerVal.append(node.val)
                if let ln = node.left {
                    queue.append(ln)
                }
                if let rn = node.right {
                    queue.append(rn)
                }
            }
            // result.insert(layerVal, at: 0) 倒序
            result.append(layerVal) // 正序
        }
        return result
    }
    
    /**
     offer26：树的子结构  树t是否是树s的子树
     */
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        var result = false
        if s != nil && t != nil {
            if s == t {
                result = doseTree1HavaeTree2(s, t)
            }
            if !result {
                result = isSubtree(s?.left, t)
            }
            if !result {
                result = isSubtree(s?.right, t)
            }
        }
        return result
    }
    private func doseTree1HavaeTree2(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root2 == nil {
            return true
        }
        if root1 == nil {
            return false
        }
        if root1 != root2 {
            return false
        }
        return doseTree1HavaeTree2(root1?.left, root2?.left) &&
            doseTree1HavaeTree2(root1?.right, root2?.right)
    }
    
    
    /*
     offer28：对称的二叉树
     请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。
     递归
     1. 定义递归函数
     2. 边界问题 递归结束条件
     3. 寻找等价关系 node1?.left, node2?.right
     */

    func isSymmetry(_ root: TreeNode?) -> Bool {
        return isSymmetrys(root, root)
    }
    //  1
    private func isSymmetrys(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        //2
        if node1 == nil && node2 == nil {
            return true
        }
        
        if node1 == nil || node2 == nil {
            return false
        }
        
        if node1?.val != node2?.val {
            return false
        }
        
        // 3   入站 这些逻辑都是在入站操作中处理了
        return isSymmetrys(node1?.left, node2?.right) &&
        isSymmetrys(node1?.right, node2?.left)
    }
 
    /**
    面试题27. 二叉树的镜像
    */
    func mirrorTrees(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        // 入站
        let right = mirrorTree(root.right)
        let left = mirrorTree(root.left)
        // 出站
        root.right = left
        root.left = right
        return root
    }

    /**
    offer55（二）：平衡二叉树
    输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。
    */

    func isBalanced(_ root: TreeNode?) -> Bool {
        // 判断各个节点的左右子树的深度相差是否超过1
    //    return isBalance(root) > 1 ? false : true   这是整个树了
        // 关键是 guard
        guard root != nil else {
              return true
        }
        // 入
        let left = maxDepth(root?.left)
        let right = maxDepth(root?.right)
        // 出
        if abs(left - right) > 1 {
            return false
        }
        return isBalanced(root?.left) && isBalanced(root?.right)

    }
    // 求树深度
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = maxDepth(root?.left) + 1
        let right = maxDepth(root?.right) + 1
        return max(left,right)
    }

    
    /**
     怎么查找两个view的公共父视图
     用两个「指针」，分别指向两个路径的根节点，然后从根节点开始，找第一个不同的节点，第一个不同节点的上一个公共节点

     */
    func findRecentRoot(_ viewA: UIView?,_ viewB: UIView?) -> UIView? {
        let aArray = findSuperViewsw(viewA)
        let bArray = findSuperViewsw(viewB)
        var p1 = aArray.count - 1, p2 = bArray.count - 1
        var rootView :UIView?
        while p1 >= 0 && p2 >= 0 {
            if aArray[p1] == bArray[p2] {
                rootView = aArray[p1]
            }
            p1 -= 1
            p2 -= 1
        }
        return rootView
    }
    // 查找父视图 迭代 这个好用
    func findSuperViews(_ view: UIView?) -> [UIView] {
        var view = view
        if view == nil {
            return []
        }
        var resultArray = [UIView]()
        while view != nil {
            resultArray.append(view!)
             // next
            view = view?.superview
        }
        return resultArray
    }
    
    /**
     二叉搜索树的最近公共祖先
     {
     它或者是一棵空树，或者是具有下列性质的二叉树： 若它的左子树不空，则左子树上所有结点的值均小于它的根结点的值； 若它的右子树不空，则右子树上所有结点的值均大于它的根结点的值； 它的左、右子树也分别为二叉排序树。二叉搜索树作为一种经典的数据结构，它既有链表的快速插入与删除操作的特点，又有数组快速查找的优势；所以应用十分广泛，例如在文件系统和数据库系统一般会采用这种数据结构进行高效率的排序与检索操作。 [1]
     }
     
     百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）
     */
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // 1.因为是二叉搜索树，所以利用值来进行判断
        // 1.1如果两个值都比root小
        if p!.val < root!.val && q!.val < root!.val {
            return lowestCommonAncestor(root?.left, p, q)
        }
        // 2.如果两个值逗比root大
        if p!.val > root!.val && q!.val > root!.val {
            return lowestCommonAncestor(root?.right, p, q)
        }
        // 3.如果两个值在一左一右，证明该结点就是公共祖先结点
        return root
    }

    /**
      二叉树的最近公共祖先
      解题思路如下：
      1、当root为空时，返回nil
      2、如果root的值和p或者q的值相等时，直接返回root（如题目的例子2）
      3、递归左右子树，用left和right表示递归求出的结果
      4、如果left是空，说明p和q节点都不在左子树，那么结果就在右子树，返回right
      5、如果right是空，说明p和q节点都不在右子树，那么结果就在左子树，返回left
      6、如果left和right都不为空，说明p和q节点分别在左右子树，那么结果就是root
     */
    
    func findCloseRoot(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode?{
        // 边界 以及 递归结束条件
        if root == p || root == q || root == nil {
            return root
        }
        // 递归 左
        let left = findCloseRoot(root?.left, p, q)
        // 递归 右
        let right = findCloseRoot(root?.right, p, q)
        
        // 出·  处理逻辑
        if left == nil && right == nil {
            return nil
        }else if left == nil && right != nil{
            return right
        }else if right == nil && left != nil{
            return left
        }
        return root
    }

    
    
    /*
     offer55（一） 返回二叉树的深度
       递归
     时间复杂度： 我们每个结点只访问一次，因此时间复杂度为 O(N)，
     其中 N 是结点的数量。
     空间复杂度： 在最糟糕的情况下，树是完全不平衡的，例如每个结点只剩下左子结点，递归将会被调用 N 次（树的高度），因此保持调用栈的存储将是 O(N)。但在最好的情况下（树是完全平衡的），树的高度将是 log(N)。因此，在这种情况下的空间复杂度将是 O(log(N))。
     */
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftDepth = maxDepth(root?.left) + 1
        let rightDepth = maxDepth(root?.right) + 1
        return max(leftDepth,rightDepth)
    }

    
    


    //MARK:- 链表 - 多指针/递归
    
    /*
     环形链表
    给定一个链表，判断链表中是否有环。

    笔者理解 快慢指针《双指针》，+ 一般画用到指针的都要有循环，有循环就会有条件
就是两个指针访问链表，一个在前一个在后，或者一个移动快另一个移动慢，这就是快行指针。所以如何检测一个链表中是否有环？用两个指针同时访问链表，其中一个的速度是另一个的2倍，如果他们相等了，那么这个链表就有环了
    
    快慢指针《双指针》应用---
     '一. 使用快慢指针来找到链表的中点
     '三. 利用快慢指针来判断链表中是否有环（并找出环的入口）
     */
    func hasCycle(_ head: LinkNode?) -> Bool{
        var fast = head, slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if slow?.val == fast?.val {
                return true
            }
        }
        return false
    }
    
    //142 环形链表 II
    /*
     给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

     链表相关思路
     
     '- 判断是否为环形链表
     思路：使用追赶的方法，设定两个指针slow、fast，从头指针开始，每次分别前进1步、2步。如存在环，则两者相遇；如不存在环，fast遇到NULL退出。
     
     '- 若为环形链表，求环入口点
    思路：快慢指针相遇点<slow>到环入口的距离 = 链表起始点到环入口的距离
     
     '- 求环的长度
     思路：记录下相遇点p，slow、fast从该点开始，再次碰撞所走过的操作数就是环的长度s
     
     '- 判断两个链表是不是相交
     思路：如果两个链表相交，那么这两个链表的尾节点一定相同。直接判断尾节点是否相同即可。这里把这道题放在环形链表，因为环形链表可以拆成Y字的两个链表。
     */

    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast != nil && fast!.next != nil {
            fast = fast!.next?.next
            slow = slow?.next
            if fast === slow {
                //重置快指针到首位< 这时 slow - fast = k(环的位置)  >
                fast = head
                while slow !== fast {
                    slow = slow?.next
                    fast = fast?.next
                }
                return fast
            }
        }
        return nil
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

    /**
     offer6：从尾到头打印链表
      题目：输入一个链表的头结点，从尾到头反过来打印出每个结点的值。
      本代码解法，使用一个栈存储各个节点 😓, 再反向打印
      其他解法： 比如递归调用(递归函数本质上也是一个栈结构)，或者修改链表
     */
    
    func reversePrintList(_ node: ListNode) -> [Int]{
        var nodes = [Int]()
        var curNode :ListNode? = node
        while curNode != nil {
            nodes.append(curNode!.val)
            curNode = curNode!.next
        }
        return nodes.reversed()
    }
    /// 打印链表
    func printList(_ node: listNode) -> [Int]{
        var nodes = [Int]()
        // 引入临时 防止原数据修改
        var curNode :listNode? = node
        while curNode != nil {
            nodes.append(curNode!.val)
            curNode = curNode!.next
        }
        return nodes
    }
    
    
    /**
     83. 删除排序链表中的重复元素
    */
    func deleteDupNodel(_ head: listNode?) -> listNode?{
        var curHead = head
        //边界循环
        while curHead != nil && curHead!.next != nil {
            if curHead!.next?.val == curHead!.val {
                curHead!.next = curHead!.next!.next
            } else {
                curHead = curHead!.next
            }
        }
        return head
    }
    
    /*
     offer22：链表中倒数第k个结点
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
        
        var slow = head
        var fast = slow
        //快指针先走k步
        for _ in 1..<k{
            if fast?.next != nil {
                fast = fast?.next
            }else{
                //如果k大于链表长度，返回空
                return nil
            }
        }
        
        //快慢指针同时往后遍历
        while slow?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        //    19. 删除链表的倒数第N个节点
        //    slow?.next = slow?.next?.next
        //    return slow.next
        
        return fast
    }

    
    /*
     offer18（一）：在O(1)时间删除链表结点/ 237. 删除链表中的节点
     链表操作
      - 修改节点 可以用 覆盖和 指向 两个思路。
      - 单链表用覆盖 双链表用指向。
    */

    // 1: 单链表删除 - 指针指向的对象不变，节点的值覆盖, 前提被删除node不是尾节点
    func deleteNode1(_ node: listNode?) {
        if node == nil{
            return
        }
        if node!.next == nil {
            return
        }
        /// 本质是将要删除的节点 覆盖掉<value 和 指向>
        node!.val = node!.next!.val
        node!.next = node!.next!.next
    }

    // 2:单链表删除 - 这个好
    /**
     - 前提toBeDeleted是从输入链表内部取出的，
     - 如果是新建的一个就要另一种方式了。
     - 而且双向链表删除方式也是不一样
     */
    func deleteNode2(_ head: inout listNode?, _ toBeDeleted: listNode?){
        if head == nil || toBeDeleted == nil {
            return
        }
        if toBeDeleted?.next !== nil {
            toBeDeleted?.val = (toBeDeleted?.next!.val)!
            toBeDeleted?.next = toBeDeleted?.next?.next
        } else {
            /**
             - 问题1: 为什么要用一个 while 循环
               答: 因为最后一个节点，下一个是nil. 直接覆盖nil, 代码是通不过的。 只能寻找上个节点，然后将上个节点的next = nil
             - 问题2: 为什么引入一个新变量
               答: head = head.next 会修改链表的
            */
            var node = head!
            while node.next !== nil {
                if node.next === toBeDeleted {
                    node.next = nil
                    return
                }
                node = node.next!
            }
            /** or
             var node = head!
             while node.next !== toBeDeleted {
                 node = node.next!
             }
             node.next = nil
             */
        }
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

    //18 合并K个排序链表      利用第三空间-数组
    /*
     合并 k 个排序链表，返回合并后的排序链表。https://www.cnblogs.com/strengthen/p/9891419.html

     - 1,   从21 合并两个有序链表的基础上，我们已经能够解决两个有序链表的问题，现在是k个有序链表，我们可以将第一二个有序链表进行合并，然后将新的有序链表再继续跟第三个有序链表合并，直到将所有的有序链表合并完成。 这样做思路上是可行的，但是算法的时间复杂度将会很大，具体就不计算了。有兴趣的自己计算下。
     - 2,  根据思路一，我们是一个一个地将有序链表组成新的链表，这里一个进行了k-1次两个有序链表的合并操作。而且随着新链表越来越大，时间复杂度也会越来越高。 这里有一种简化的方式，可以先将k个有序链表先以2个链表为一组进行合并，得出结果后，再将所有的新有序链表继续上面的方式，2个链表为一组进行合并。直至将所有的有序链表进行合并。 这个思路会比思路一的算法复杂度少一点。
     - 3 ,  我们换个不一样的思路。我们先遍历一次所有的链表中的元素。然后将元素全部放在一个数组里面。接着对这个数组进行排序，最终将排序后的数组里面的所有元素链接起来。 这种方案的复杂度和代码量会比前集中思路更好，更简单。

     空间复杂度：因为需要一个数组，所以需要额外的空间。这个空间的大小就是链表元素的个数 时间复杂度：假设一个是n个元素，对链表进行遍历(n),对数组进行排序(排序算法可以达到nlogn)，最终链接所有元素(n),就是 （n+nlogn+n），也就是O(nlogn)。

     */

    func mergeKLists(_ lists: [LinkNode?]) -> LinkNode? {
            if lists.count == 0 {
                return nil
            }
            var arr : [Int] = []
            //遍历链表数组，将每个链表的val直接加入数组中
            for i in lists {
                var node = i
                while node != nil {
                    arr.append(node!.val)
                    node = node!.next
                }
            }
            if arr.count == 0 {
                return nil
            }
            //链表val值的数组排序
            arr = arr.sorted()
            //将排好序的数组重新合成一个链表
            let head = LinkNode(arr[0])
            var node = head
            for i in arr {
                node.next = LinkNode(arr[i])
                node = node.next!
            }
            return head.next
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
     // offer58（一）：翻转单词顺序
     // 题目：输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。
     // 为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，
     // 则输出"student. a am I"。
     */

    // 也可以用 栈 的特性
    func reverseStr(_ s: String) -> String{
        // 用数组 append removeLast 代替 push pop
        var stack = [String]()
        let arraySubstrings: [Substring] = s.split(separator: " ")
        // 高阶函数
        arraySubstrings.reduce("") {
            stack.append(String($1) + "  ")
            return ""
        }
        var reverStr = String()
        while stack.count > 0 {
            reverStr.append(stack.last!)
            stack.removeLast()
        }
        return reverStr
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

    
     /**
      offer50（一）：字符串中第一个只出现一次的字符
     解法：利用字典存储各个字符的出现次数
      */
       func getFirstNotRepeatingChar(_ string: String) -> Character? {
           let chars = Array(string)
           var dict = [Character:Int]()
           for char in chars {
               if dict[char] == nil {
                   dict[char] = 1
               } else {
                   dict[char]! += 1
               }
           }
           for char in chars {
               if dict[char]! == 1 {
                   return char
               }
           }
           return nil
       }
    
    
    
    /*
     14. 最长公共前缀
     取出第一个字符串，使用后面的字符串判断第一个字符串是否是他们的前缀，不是则将第一个字符串长度减一，继续判断
     */
    func longestCommonPrefix(_ strs: [String]) -> String {
        let count = strs.count
        
        if count == 0 {
            return ""
        }
        if count == 1 {
            return strs.first!
        }
        
        var result = strs.first!
        
        for i in 1..<count {
            while !strs[i].hasPrefix(result) {
                result = String(result.prefix(result.count - 1))
                print(result)
                if result.count == 0 {
                    return ""
                }
            }
        }
        return result
    }
    
    /*
     无重复字符的最长子串
     给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
     输入: "abcabcbb"
     输出: 3
     解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
     
     滑动窗口<3个指针 一个临时结果>
    我们为了要找最长的字串，就要j++，查看j+1元素是否与当前字串有重复字母。如果没有则继续j++，直到某一刻j+1的字符与当前字串中产生了重复字母，此时j无法继续向前拓展，记录当前长度，之后i++，直到将这个重复字符刨除出去，j又继续拓展...
     一个问题是：如何判定下一个字符与当前字串是否存在重复字符？
    遍历字符串中的每一个元素。借助一个辅助键值对来存储某个元素最后一次出现的下标。用一个整形变量存储当前无重复字符的子串开始的下标。
     */
    func lengthOfLongestSubstringWD(_ s: String) -> Int {
        
        var p1 = 0, p2 = 0, p = 0, result = 0
        //边界
        if s.count == 0 {
            return result
        }
        //窗口
        result = p2 - p1
        let chars = Array(s)
        //遍历条件
        //窗口滑动
        while p2 < chars.count {
            p = p1
            //窗口内部查重
            while p < p2 {
                if chars[p] == chars[p2] {
                    p1 = p + 1 //窗口左边移动
                    break
                }
                p = p + 1
            }
            result = max(result, p2 - p1 + 1)
            p2 = p2 + 1 //窗口右边移动
        }
        
        return result
    }

    //MARK:- 数组
    
     /**
      二分查找 双指针
      */
     func binarySearch(_ nums: [Int], _ target :Int) -> Int{
         var p1 = 0, p2 = nums.count - 1
         while p1 < p2 {
             let mid = (p2 - p1) / 2 + p1 //记得加p1
             if nums[mid] == target {
                 return mid
             }else if nums[mid] > target {
                 p2 = mid - 1 // 记得 - 1
             }else{
                 p1 = mid + 1 // 记得 + 1
             }
         }
         return -1
     }
     
     /*
       盛最多水的容器 双指针
    现在，为了使面积最大化，我们需要考虑更长的两条线段之间的区域。如果我们试图将指向较长线段的指针向内侧移动，矩形区域的面积将受限于较短的线段而不会获得任何增加。但是，在同样的条件下，移动指向较短线段的指针尽管造成了矩形宽度的减小，但却可能会有助于面积的增大。因为移动较短线段的指针会得到一条相对较长的线段，这可以克服由宽度减小而引起的面积减小。
     */
     func getMaxArea(_ height: [Int]) -> Int{
         // 记得边界
         if height.count == 0 {
             return 0
         }
         var p1 = 0, p2 = height.count - 1, maxArea = 0
         while p1 < p2 {
             // 遍历出每次最低高度
             var minHeight = 0
             if height[p1] < height[p2]{
                 minHeight = height[p1]
                 p1 += 1
             }else{
                 minHeight = height[p2]
                 p2 -= 1
             }
             // 记得 + 1
             maxArea = max(maxArea, (p2 - p1 + 1) * minHeight)
         }
         return maxArea
     }
     
    
    /*
     658. 找到 K 个最接近的元素
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
     offer11：旋转数组的最小数字 / 153. 寻找旋转排序数组中的最小值
     把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。 输入一个非减排序的数组的一个旋转，输出旋转数组的最小元素。 例如数组{3,4,5,1,2}为{1,2,3,4,5}的一个旋转，该数组的最小值为1。 NOTE：给出的所有元素都大于0，若数组大小为0，请返回0。
     
     采用二分法解答这个问题，
     mid = low + (high - low)/2
     需要考虑三种情况：
     (1)array[mid] > array[high]:
     出现这种情况的array类似[3,4,5,6,0,1,2]，此时最小数字一定在mid的右边。
     low = mid + 1
     
     (2)array[mid] == array[high]:
     出现这种情况的array类似 [1,0,1,1,1] 或者[1,1,1,0,1]，此时最小数字不好判断在mid左边
     还是右边,这时只好一个一个试 ，
     high = high - 1
     
     (3)array[mid] < array[high]:
     出现这种情况的array类似[2,2,3,4,5,6,6],此时最小数字一定就是array[mid]或者在mid的左
     边。因为右边必然都是递增的。
     high = mid
     注意这里有个坑：如果待查询的范围最后只剩两个数，那么mid 一定会指向下标靠前的数字
     比如 array = [4,6]
     array[low] = 4 ;array[mid] = 4 ; array[high] = 6 ;
     如果high = mid - 1，就会产生错误， 因此high = mid
     但情形(1)中low = mid + 1就不会错误
     */

    // 以p2为 动态基准，以mid 为中间准基。以p1为结果=
    func findMin(_ array: [Int]) -> Int{
        
        if array.count == 0 {
            return 0
        }
        var p1 = 0, p2 = array.count - 1
        while p1 < p2 {
            //使得p1、p2交叉，p1指向最小的数
            let mid = (p2 - p1)/2 + p1
            if array[mid] > array[p2] {
                p1 = mid + 1
            }else if array[mid] < array[p2]{
                p2 = mid
            }else if array[mid] == array[p2]{
                p2 = p2 - 1 //等于的话 p2要不断趋于减少
            }
        }
        
        return array[p1]
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
    
    // 442. 数组中重复的数据
    func findDuplicates(_ nums :[Int]) -> [Int] {
        guard nums.count > 1 else {
            return []
        }
        var set = Set<Int>()
        var arr = [Int]()
        for i in nums {
            if set.contains(i) {
                arr.append(i)
            }else{
                set.insert(i)
            }
        }
        
        return arr
    }
    
    /**
     26. 删除排序数组中的重复项 快慢指针
     给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
     不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
     数组完成排序后，我们可以放置两个指针 ii 和 jj，其中 ii 是慢指针，而 jj 是快指针。只要 nums[i] = nums[j]nums[i]=nums[j]，我们就增加 jj 以跳过重复项。
     当我们遇到 nums[j] \neq nums[i]nums[j] = nums[i] 时，跳过重复项的运行已经结束，因此我们必须把它（nums[j]nums[j]）的值复制到 nums[i + 1]nums[i+1]。然后递增 ii，接着我们将再次重复相同的过程，直到 jj 到达数组的末尾为止。
     */
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var p1 = 0
        for p2 in 1..<nums.count {
            if nums[p1] != nums[p2] {
                p1 += 1
                // 相当于重写数组了
                nums[p1] = nums[p2]
            }
        }
        return p1 + 1
    }
    
    /**
      33. 搜索旋转排序数组
      假设按照升序排序的数组在预先未知的某个点上进行了旋转。
      搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
      你可以假设数组中不存在重复的元素
     
      解题
      1、先创建两个指针left和right，然后取mid=(right+left)/2,将数组一分为二。其中肯定有一个有序，一个可能有序或者部分有序，
      2、然后在有序的范围内判断target是否在有序范围内，然后移动left或right，继续步骤一，直到找到nums[mid] == target,返回mid，否则返回-1。
      时间复杂度：O(log(n))。空间复杂度：O(1)
     */
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            // 当前居中的位置
            let mid = (right + left) / 2
            if nums[mid] == target {// 循环执行,知道找到nums[mid] == target,然后返回mid
                return mid
            }
            // 如果nums[mid] < nums[right]说明,mid->right是有序的
            if nums[mid] < nums[right] {
                // 如果target在nums[mid]与nums[right]之间,left向右移动至mid+1
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1
                }else {// 否则right向左移动至mid-1
                    right = mid - 1
                }
            }else{// 否则说明left->mid是有序的
                // 如果target在nums[left]与nums[right]之间,right向左移动至mid-1
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1
                }else{// 否则left向左移动至mid+1
                    left = mid + 1
                }
            }
        }
        return -1
    }
    

    ///136. 只出现一次的数字  遍历异或
    func singleNum(_ nums :[Int]) -> Int{
        var result = 0
        for num in nums {
            result = result ^ num
        }
        return result
    }
    
    /*
     88. 合并两个有序数组 ---  3个指针迭代
     给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
     初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
     你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
     */

    func mergeArrays(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1, p2 = n - 1, p = m + n - 1
        while p1 >= 0 && p2 >= 0 {
            if nums1[p1] >= nums2[p2] {
                nums1[p] = nums1[p1]
                p1 -= 1
                p -= 1
            }else{
                nums1[p] = nums2[p2]
                p2 -= 1
                p -= 1
            }
        }
        while p2 >= 0 {
            nums1[p] = nums2[p2]
            p -= 1
            p2 -= 1
        }
    }
    
    /**
     两数之和 引用 字典
     */
    func twoSums(_ nums: [Int],_ target: Int) ->[Int]{
        var dic = [Int:Int]()
        for (idx,item) in nums.enumerated() {
            if let lastIdx = dic[target - item] {
                return [idx,lastIdx]
            }else{
                dic[item] = idx
            }
        }
        return []
    }
    
    /**
     167. 两数之和 II - 输入有序数组  双指针
     给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
     函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2
     */
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i = 0, j = numbers.count - 1
        while i < j {
            let sum = numbers[i] + numbers[j]
            if sum == target {
                return [i + 1, j + 1]
            }else if sum > target {
                j -= 1
            }else {
                i += 1
            }
        }
        return []
    }
    
    /**
     二维数组中的查找
     在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序，输入一个二维数组中的数字，判断二维书中是否存在,存在返回true，不存在返回false~
     思路:

     1:第一反应都是二分查找。对于每一行进行二分查找，然后查找过程可以把某些列排除掉，这是大家都能想到的基本的思路。
     2:首先选取数组右上角的数字，如果该数字等于要查找的数字，则查找结束；如果该数字大于要查找的数字，剔除这个数字所在的列，如果该数字小于要查找的数字，剔除这个数字所在的行。这样每一步都可以剔除一行或一列，查找的速度比较快。
     */
    
    func searchMatrix(data: [[Int]],number: NSInteger) -> Bool{
        if data.count == 0 || data.isEmpty{
            return  false
        }
        var row :Int = 0, col :Int = data[0].count - 1
        while row < data.count && col >= 0 {
            let rightVal = data[row][col]
            if rightVal == number {
                return true
            }else if rightVal > number{
                col -= 1
            }else{
                row += 1
            }
        }
        return false
    }


    


    //MARK:- 排序
    /*
     手撕快排 https://www.jianshu.com/p/5a81ba81886d
     需要额外空间 比较好理解
     */
    func quickSort2(_ data: [Int]) -> [Int] {
        // 边界
        if data.count <= 1 {
            return data
        }
        // 初始化 左数组 右数组 以及pivot
        var left: [Int] = []
        var right: [Int] = []
        let pivot: Int = data[data.count - 1]
        
        // 遍历分别放到左右区域   注意：条件中排除了基准值
        for index in 0..<data.count - 1 {
            if data[index] < pivot {
                left.append(data[index])
            }else{
                right.append(data[index])
            }
        }
        // 递归处理 left 区域
        var result = quickSort2(left)
        // 拼接准基
        result.append(pivot)
        // 递归处理 right 区域
        let rightResult = quickSort2(right)
        // 拼接rightArray
        result.append(contentsOf: rightResult)
        
        return result
    }


    /*
    冒泡排序 升序
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

    /*
     全排列 非回溯算法
     */
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 1 else { return [nums] }
        var tmpNums = nums
        let l = tmpNums.removeLast()
        let array = permute(tmpNums)
        /*
    reduce 函数接受两个参数：
    第一个为初始值，它用来存储初始值和每次迭代中的返回值。
    另一个参数是一个闭包，闭包包含两个参数：初始值或者当前操作的结果、集合中的下一个 item 。
    */
        return array.reduce(into: [[Int]]()) { (result, element) in
            for i in element.startIndex...element.endIndex {
                var tmpElement = element
                tmpElement.insert(l, at: i)
                result.append(tmpElement)
            }
        }
    }

    
    //MARK:- 动态规划
    
    //70. 爬楼梯 本质就是 斐波拉切数列
    /*
     题目：你正在爬楼梯。需要 n 步你才能到达顶部。
     每次你可以爬 1 或 2 个台阶。你有多少种不同的方式可以爬到楼顶呢？
     https://blog.csdn.net/moakun/article/details/79928067
     思路：一道经典的爬楼梯问题，直觉上第一个想到的就是采用递归，也就是要计算爬到第3层楼梯有几种方式，可以从第2层爬1级上来，也可以从第1层爬2级上来，所以爬到第3级有几种方式只需要将到第2层总共的种数，加上到第1层总共的种数就可以了。推广到一般，写出
     递推公式    stairs(n) = stairs(n-1) + stairs(n-2) ，
     只需要初始化好退出递归的条件就算写完了。
     
     动态规划  <自下而上分解成>

     */
    // 递归

    func climbStairsRecursion(_ n :Int) -> Int{
        if n == 1 || n == 2 {
            return n
        }

        return climbStairsRecursion(n - 1) + climbStairsRecursion(n - 2)
    }


    // 数组 动态规划
    func dyclimbStairs(_ n: Int) -> Int {
        // 边界值
        if n == 1 || n == 2{
            return n
        }
        
        var dp = [1,1,2] // 最优子结果
        
        //遍历 动态转移方程 dp[n] = dp[n-1] + dp[n-2]
        // 3 ... n 左开右开 3 到 n
        /**
            注意 4 ... n 会报错，原因是 当 n = 3 时，条件会是  4 ... 3， 所以最小子结果，就只能是最小的，多一个都不行
         */
        for i in 3 ... n {
            print(i)
            //状态转移方程
            dp.append(dp[i-1] + dp[i-2])
        }
        print(dp)
        return dp[n-1]
    }


    /*
     最大子序和
     给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
     思路：

     1）动态规划的是首先对数组进行遍历，当前最大连续子序列和为 sum，结果为 ans
     2）如果 sum > 0，则说明 sum 对结果有增益效果，则 sum 保留并加上当前遍历数字
     3）如果 sum <= 0，则说明 sum 对结果无增益效果，需要舍弃，则 sum 直接更新为当前遍历数字
     4） 每次比较 sum 和 ans的大小，将最大值置为ans，遍历结束返回结果
     
     动态规划
     * 递归是自顶向下，动归是自底向上
     1 最优子结构  ans = nums[0]
     2 状态转移方程式  ans = max(ans, sum)
     3 边界     for num in nums
     解题步骤: 1,建立数学模型 2,写代码求解问题
     */
    
    func maxSubArrayDP(_ nums: [Int]) -> Int {
        //边界
        if nums.count == 0 {
            return -1
        }
        //最优子结构 一般用数组去存储
        var curMaxSub = [nums[0]]
        var sum = 0
        // 迭代边界
        for num in nums {
            if sum > 0 {
                //累计和不小于0 继续累加
                sum += num
            }else{
                //如果累计和小于0，则抛弃之前的累计和(子序列)，从新的开始
                sum = num
            }
            
            //将当前子序列和现有的子序列最大进行比较
            // 状态转移方程
            curMaxSub.append(max(curMaxSub.last!, sum))
        }
        return curMaxSub.last!
    }
    
    /*
     121. 买卖股票的最佳时机
     给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
     如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。
     注意你不能在买入股票前卖出股票
     
     动态规划
      1 最优子结构(2个)
         1- 只要考虑当天买和之前买哪个收益更高，
         2- 当天卖和之前卖哪个收益更高。
      2 边界
      3 状态转移方程(2个)    第二个方程的参数是第一个方程的解
     */

    func dynamicMaxProfit(_ prices :[Int]) -> Int{
        // 边界
        if prices.count <= 1 {
            return 0
        }
        // 两个最小子结构
        var min_b = prices[0], max_p = 0//这个是利润 最小就是0
        
        //3 状态转移方程 min_b max_p 都是当前的最优，随着遍历一直往下走
        for idx in 1 ... prices.count - 1 {
            // 得出idx之前最小的
            min_b = min(min_b, prices[idx]) // 一直取买入最低的价格 // 最优子结构
            /*
             prices[idx] 减去 idx之前最小的
             */
            max_p = max(max_p, prices[idx] - min_b) //第i天卖出,或者上一个状态比较,取最大值. // 最优子结构
        }
        
        return max_p
    }


    
    /**
     62. 不同路径
     一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
     机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
     问总共有多少条不同的路径？

     递推方程
       dp[i] [j] = dp[i-1] [j] + dp[i] [j-1]

     我们的初始值是计算出所有的(最小子)
       dp[0] [0….n-1] 和所有的 dp[0….m-1] [0]
     这个还是非常容易计算的，相当于计算机图中的最上面一行和左边一列。因此初始值如下：
       dp[0] [0….n-1] = 1; // 相当于最上面一行，机器人只能一直往左走
       dp[0…m-1] [0] = 1; // 相当于最左面一列，机器人只能一直往下走
     */
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        ///边界
        if m <= 0 || n <= 0 {
            return 0
        }
        
        // 最小子 二维数组
        var dp = [[Int]]()
        
        //创建 DP 二维数组  垃圾swift 二维数组操作
        for _ in 0..<m{
            var eachRow:[Int] = []
            for _ in 0..<n{
            eachRow.append(n);
            }
            dp.append(eachRow);
        }

        //一直往下走
        for i in 0..<m {
            dp[i][0] = 1
        }
        //一直往左走
        for i in 0..<n {
            dp[0][i] = 1
        }
        
        /// 递推
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[m-1][n-1]
    }
    
    /*
    198. 打家劫舍 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
     给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
     
     解题思路
      1、首先想一想如果是暴力如何做？
      假设从最后一家店铺开始抢，那么只会遇到2种情况，即：抢这家店和下下家店，或者不抢这家店。所以我们得到
      
      对于 n = 3，有两个选项:
      1 - 抢第三个房子，将数额与第一个房子相加。
      2 - 不抢第三个房子，保持现有最大数额。

      递归的公式: dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
      dp[i] 代表到第n个房屋为止获得的最大金额
      
     2、上面的暴力算法虽然能够得到正确的结果，但是显然递归的效率是很低的，如果有n家店铺，每家店铺有2种可能，那么时间复杂度就是2的n次方。那么如何优化呢？
      
      我们分析一下：
      如果我们开始抢的是第n-1家店，那么后面可以是（n-3,n-4,n-5,n-6....）;
      如果我们开始抢的是第n-2家店，那么后面可以是（n-4,n-5,n-6,....）;
      那么这两种情况显然n-3之后的n-4,n-5,n-6,....都重复计算了。显然这里有非常大的优化空间。通常我们使用空间来换时间，即用一个数组记录每次计算的结果，这样每次情况只需要计算一次，再次遇到只需直接返回结果即可，大大优化了时间。
      
      总结
      这道题就是动态规划，其本质是在递归的思想上进行优化。
      原问题（N）-->子问题（N-1）-->原问题（N）
      
      最优子结构
      1、子问题最优决策可导出原问题的最优决策。
      2、无后效性
      
      重叠子问题
      1、去冗余
      2、空间换时间
         
     */
    
    // 动态
    func robDP(_ nums: [Int]) -> Int {
        //边界
        if nums.count == 0 {return 0}
        if nums.count == 1 {return nums[0]}
        
        var dp = [nums[0],max(nums[0],nums[1])] // <最优子结构>
        // dp = [nums[0], max(nums[0],nums[1]), max(nums[2] + dp[0], dp[1]).......max(nums[i] + dp[i-2],dp[i-1])]
        
        for i in 2 ..< nums.count{
            //状态转移方程
            //dp[i] = max(dp[i - 2] + nums[i], dp[i - 1]) 递推公式
            dp.append(max(nums[i] + dp[i-2], dp[i-1]))
        }
        
        return dp.last!
    }
    
    
    //
    /*
     offer14：剪绳子   　给你一根长度为n的绳子，请把绳子剪成m段（m、n都是整数，n>1并且m>1），每段绳子的长度记为k[0],k[1],...,k[m]。请问k[0]xk[1]x...xk[m]可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。

    动态规划
       1: 边界
       2: 最优子结构
       3: 动态转移方程
     */
    func maxCute_DP(length: Int) -> Int {
    //    1: 边界
        if length < 2{
            return 0
        }
        
        if length == 2 {
            return 1
        }
        
        if length == 3 {
            return 2
        }
        
    //    2: 最优子结构 可以推导出DP方程式  dp[i]=dp[j]*dp[i-j]
        var dp = [0,1,2,3]
        var result = 0
        for i in 4...length{
            result = 0
            for j in 1...i/2 {
                let product = dp[j] * dp[i-j]
                result = max(product, result)
            }
            dp.append(result)
        }
        print(dp)
        return dp[length]
    }
    
    
    /*
     厉害了我的杯
     有一种玻璃杯质量确定但未知，需要检测。
     有一栋100层的大楼，该种玻璃杯从某一层楼扔下，刚好会碎。
     现给你两个杯子，问怎样检测出这个杯子的质量，即找到在哪一层楼刚好会碎？
     https://mp.weixin.qq.com/s/MtSr6Id80sxBdNsgHLLxJw
     */
    
    
    /*
     最长回文子串
     输入: "babad"
     输出: "bab"
     注意: "aba" 也是一个有效答案。
     
     动态规划
     根据回文的特性，一个大回文按比例缩小后的字符串也必定是回文，比如ABCCBA，那BCCB肯定也是回文。所以我们 '可以根据动态规划的两个特点：
     （1）'把大问题拆解为小问题
     （2）'重复利用之前的计算结果
         这道题。如何划分小问题，我们可以先把所有长度最短为1的子字符串计算出来，根据起始位置从左向右，这些必定是回文。然后计算所有长度为2的子字符串，再根据起始位置从左向右。到长度为3的时候，我们就可以利用上次的计算结果：如果中心对称的短字符串不是回文，那长字符串也不是，如果短字符串是回文，那就要看长字符串两头是否一样。这样，一直到长度最大的子字符串，我们就把整个字符串集穷举完了。

     '基于动态规划的三要素对问题进行分析，可确定以下的状态转换方程：
      ' 最小子问题 // 最优子结果
     单个字符独立成为一个回文字符串
     相邻的两个相同字符，是一个回文字符串

      ' 递推方程
        设置一个 L*L 的矩阵 D，D[i][j] 的值为 ture 或 false， 表示从 i 起始 j 终止的字符串是否为回文。

      Di = (D[i] === D[j]) && Di+1

     （若第 i 个字符与第 j 个字符相同，且从 i+1 起始 j-1 终止的字符串为回文，则有从 i 起始 j 终止的字符串也为回文）
     */
    func longestPalindrome(_ s: String) -> String {
           var dp:[[Bool]] = [];
           if s.count <= 1{
               return s;
           }
           
           var longest:Int = 1;
           var left:Int = 0;
           var right:Int = 0;
           //创建 DP 二维数组
           for i in 0...s.count - 1{
               var eachRow:[Bool] = [];
            for j in 0...s.count - 1{
                   if i == j{
                       eachRow.append(true);
                   }else{
                       eachRow.append(false);
                   }
               }
               dp.append(eachRow);
           }
        
          print(dp)
           
           var i:Int = 0;
           var j:Int = 0;
        for character_j in s {
               if j == 0 {
                   j += 1;
                   continue;
               }
               i = 0;
            for character_i in s {
                   if character_i == character_j {
                       dp[i][j] = dp[i + 1][j - 1] || j - i <= 1;
                       if dp[i][j] && j - i + 1 > longest{
                           longest = j - i + 1;
                           left = i;
                           right = j;
                       }
                   }else{
                       dp[i][j] = false;
                   }
                   i += 1;
                   if i >= j{
                       break;
                   }
               }
               j += 1;
           }
           let leftIndex = s.index(s.startIndex, offsetBy: left);
           let rightIndex = s.index(s.startIndex, offsetBy: right);
           return String(s[leftIndex...rightIndex]);
    }
    
    //MARK:- 贪心算法
    /*
     122. 买卖股票的最佳时机 II
     给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
     设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
     注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）
     */

    // 贪心算法
    func greedyMaxProfit(_ prices: [Int]) -> Int{
        if prices.count <= 1 {
            return 0
        }
        
        var profit = 0
        
        for idx in 1...prices.count - 1{
            if prices[idx] > prices[idx - 1] {
                profit += prices[idx] - prices[idx - 1]
            }
        }
        return profit
    }
    
    
    
    //MARK:- 未分类
    // offer65：不用加减乘除做加法
    // 题目：写一个函数，求两个整数之和，要求在函数体内不得使用＋、－、×、÷
    /* 四则运算符号。
      解法：num1^num2 = num1+num2（不考虑进位），进位计算： (num1 & num2) << 1
     */
    func sum(num1 :Int, with num2 :Int) -> Int {
        var num1 = num1
        var num2 = num2
        repeat {
            let sum = num1 ^ num2
            let carry = (num1 & num2) << 1
            num1 = sum
            num2 = carry
        } while (num2 != 0);
        return num1
    }
    
    /**
     179. 最大数
     给定一组非负整数，重新排列它们的顺序使之组成一个最大的整数。

     示例 1:

     输入: [10,2]
     输出: 210
     示例 2:

     输入: [3,30,34,5,9]
     输出: 9534330
     说明: 输出结果可能非常大，所以你需要返回一个字符串而不是整数。
     */

    func largestNumber(_ nums: [Int]) -> String {
        let sorded = nums.map{ "\($0)" }.sorted{ $0+$1 > $1+$0 }
        if sorded[0].isEqual("0") { return "0" }
        return sorded.joined()
    }

}
