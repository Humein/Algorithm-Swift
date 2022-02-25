import UIKit
// 二叉树结构
class TreeNode {
    var perent: TreeNode?
    var val: Int = 0
    var left: TreeNode?
    var right: TreeNode?
    init(val: Int, left: TreeNode?, right: TreeNode?){
        self.val = val
        self.left = left
        self.right = right
    }
}
/**
 给定一个二叉树，返回它的 中序 遍历。

  示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,3,2]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？

 */

/**
 中序遍历 ：左子树-> 根结点 -> 右子树
 后序遍历： 左子树 ---> 右子树 ---> 根结点
 
 时间复杂度：O(n)，其中 nn 为二叉树节点的个数。二叉树的遍历中每个节点会被访问一次且只会被访问一次。
 空间复杂度：O(n)。空间复杂度取决于递归的栈深度，而栈深度在二叉树为一条链的情况下会达到 O(n) 的级别。

 */

class Solution {
    var res = [Int]()
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        // 中序:  root: 在中间
        // 中序遍历 中-起点是left
        _ = inorderTraversal(root?.left)
        res.append(root!.val)
        _ = inorderTraversal(root?.right)

        return res
    }
}

/* 迭代 栈
 方法一的递归函数我们也可以用迭代的方式实现，两种方式是等价的，区别在于递归的时候隐式地维护了一个栈，而我们在迭代的时候需要显式地将这个栈模拟出来
 
 
 迭代算法解决了递归算法的问题，但是稍微牺牲了一点可读性。可以这样理解：左侧的节点必定先于右侧的节点输出，所以对于任一子树，首先查找它最左侧的叶子节点，并且把这一路上经过的所有节点依次压入栈中。从栈中弹出一个节点输出它的值，再进入它的右孩子。重复上述步骤。


 
 
 时间复杂度：O(n)，其中 n 为二叉树节点的个数。二叉树的遍历中每个节点会被访问一次且只会被访问一次。
 空间复杂度：O(n)。空间复杂度取决于栈深度，而栈深度在二叉树为一条链的情况下会达到 O(n) 的级别

*/
class Solutions {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var result: [Int] = []
        var node: TreeNode? = root
        // 节点或栈 为空
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
