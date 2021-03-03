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


 递归
 1. 定义递归函数
 2. 边界问题 递归结束条件
 3. 寻找等价关系 node1?.left, node2?.right
 
 终止条件：
  - 当 L 和 R 同时越过叶节点： 此树从顶至底的节点都对称，因此返回 true ；
  - 当 L 或 R 中只有一个越过叶节点： 此树不对称，因此返回 false ；
  - 当节点 L 值 != 节点 R 值: 此树不对称，因此返回 false ；
 
 递推工作：
 判断两节点 L.left 和 R.right 是否对称，即 recur(L.left, R.right) ；
 判断两节点 L.right 和 R.left 是否对称，即 recur(L.right, R.left) ；
 
 返回值：
 两对节点都对称时，才是对称树，因此用与逻辑符 && 连接。

 */

func isSymmetric(_ root: TreeNode?) -> Bool {
    
    return root == nil ? true : isSymmetrics(root?.left, root?.right)
}

//  1
func isSymmetrics(_ node1: TreeNode?,_ node2: TreeNode?)-> Bool {
    // 2
    // 必须第一个判断
    if node1 == nil && node2 == nil{
        return true
    }
    
    if node1 == nil || node2 == nil{
        return false
    }
    
    // 不能判定相等的条件；只需要判断不等直到tree遍历完成就行
    if node1?.val != node2?.val {
        return false
    }
    
    // 3   入站 这些逻辑都是在入站操作中处理了； 遍历并判断左右tree
    return isSymmetrics(node1?.left, node2?.right) && isSymmetrics(node1?.right, node2?.left)
    
}

// 2020.10.12
// 2021.2.23 先判都没有有节点，后判其中一个没有节点，最后判每个节点的对应值。然后递归返回左右节点。

/// 引入两个入参来分解 左右树
func symmetryTrees(_ node1: TreeNode?,_ node2: TreeNode?) -> Bool {
    if node1 == nil && node2 == nil {
        return true
    }
    if node1 == nil || node2 == nil{
        return false
    }
    /// 不能判定相等的条件；只需要判断不等直到tree遍历完成就行
    if node1?.val != node2?.val {
        return false
    }
    // 遍历并判断左右tree
    return symmetryTrees(node1?.left, node2?.right) && symmetryTrees(node1?.right, node2?.left)
}
