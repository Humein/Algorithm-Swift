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
 输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。
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

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
