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
 offer55（二）：平衡二叉树
 输入一棵二叉树的根节点，判断该树是不是平衡二叉树。
 
 一棵高度平衡二叉树定义为：
 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。
 
 示例 1:

 给定二叉树 [3,9,20,null,null,15,7]

     3
    / \
   9  20
     /  \
    15   7
 返回 true 。

 示例 2:

 给定二叉树 [1,2,2,3,3,null,null,4,4]

        1
       / \
      2   2
     / \
    3   3
   / \
  4   4
 返回 false 。

 */


/**
 1. 自顶向下的递归
 
   有了计算节点高度的函数，即可判断二叉树是否平衡。具体做法类似于二叉树的前序遍历，即对于当前遍历到的节点，首先计算左右子树的高度，如果左右子树的高度差是否不超过 11，再分别递归地遍历左右子节点，并判断左子树和右子树是否平衡。这是一个自顶向下的递归的过程。


 复杂度分析
 时间复杂度：O(n ^ 2)，其中 n 是二叉树中的节点个数。
 空间复杂度：O(n) 其中 n 是二叉树中的节点个数。空间复杂度主要取决于递归调用的层数，递归调用的层数不会超过 n。
 
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


