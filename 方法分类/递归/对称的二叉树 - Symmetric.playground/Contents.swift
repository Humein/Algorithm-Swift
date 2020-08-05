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
//offer28：对称的二叉树
/*
 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。
 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 递归
 1. 定义递归函数
 2. 边界问题 递归结束条件
 3. 寻找等价关系 node1?.left, node2?.right
 */
func isSymmetric(_ root: TreeNode?) -> Bool {
    
    return isSymmetrics(root, root)
}

//  1
func isSymmetrics(_ node1: TreeNode?,_ node2: TreeNode?)-> Bool {
    // 2
    if node1 == nil || node2 == nil{
        return false
    }
    
    if node1 == nil && node2 == nil{
        return true
    }
    
    if node1?.val != node2?.val {
        return false
    }
    
    // 3   入站 这些逻辑都是在入站操作中处理了
    return isSymmetrics(node1?.left, node2?.right) && isSymmetrics(node1?.right, node2?.left)
    
}
