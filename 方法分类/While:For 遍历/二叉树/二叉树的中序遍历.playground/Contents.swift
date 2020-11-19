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

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-preorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

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
