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
 因此，求 “二叉搜索树第 k 大的节点” 可转化为求 “此树的中序遍历倒序的第 k 个节点”。
 
 二叉搜索树通过中序遍历得到递增列表，直接访问ar[length-k]得到第k大的节点;

 */
class solution {
    var resultArray : [Int]
       
       init() {
           self.resultArray = [Int]()
       }
       func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
           if root == nil {
               return Int.min
           }
           
           midtravel(root!)
           return resultArray[resultArray.count - k]
       }
       
      // 二叉树中序遍历
       private func midtravel(_ node : TreeNode?) -> Void {
           if node == nil {
               return
           }
           midtravel(node!.left)
           resultArray.append(node!.val)
           midtravel(node!.right)
       }
}

