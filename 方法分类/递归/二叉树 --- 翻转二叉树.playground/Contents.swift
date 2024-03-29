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
    let leftNode = invertTree(root?.left) // 二叉树底部最左子节点
    let rightNode = invertTree(root?.right) // 二叉树底部最右子节点
    // 出战 进行交换；这时root以最左边子树依次向上弹出，即以最左底部root开始。
    root?.left = rightNode
    root?.right = leftNode
    return root
}


// 2020.10.10
class NodeTrees {
    var perent: NodeTrees?
    var val: Int?
    var left: NodeTrees?
    var right: NodeTrees?
    init (l: NodeTrees?,r: NodeTrees?,v: Int?){
        self.left = l
        self.right = r
        self.val = v
    }
}

func reverseTrees(_ t: NodeTrees?) -> NodeTrees? {
    if t == nil {
        return t
    }
    let l = reverseTrees(t?.left)
    let r = reverseTrees(t?.right)
    t?.left = r
    t?.right = l
    
    return t
}
