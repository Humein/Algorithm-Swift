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
 二叉搜索树的第k大节点
 
 输入: root = [5,3,6,2,4,null,null,1], k = 3
       5
       / \
      3   6
     / \
    2   4
   /
  1
 输出: 4

 
 本文解法基于此性质：二叉搜索树的中序遍历为 递增序列 。
 中序遍历 ：左子树-> 根结点 -> 右子树

 根据以上性质，易得二叉搜索树的 中序遍历倒序 为 递减序列 。
 因此，求 “二叉搜索树第 kk 大的节点” 可转化为求 “此树的中序遍历倒序的第 kk 个节点”。


 */
