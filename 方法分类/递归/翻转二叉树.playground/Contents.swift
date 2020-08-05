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


//226. 翻转二叉树
/*
 迭代法的思路是BFS或者DFS，这两种方法都可以实现，实际上也是二叉树的遍历。
 BFS用Queue实现， 宽度优先搜索（breadth first search)
 DFS的话将代码中的Queue换成Stack。

 递归最简单
 */


func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return root
    }
    // 入站
    let leftNode = invertTree(root?.left)
    let rightNode = invertTree(root?.right)
    // 出战
    root?.left = rightNode
    root?.right = leftNode
    return root
}
