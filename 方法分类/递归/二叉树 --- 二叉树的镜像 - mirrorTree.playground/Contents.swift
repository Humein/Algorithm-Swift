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
 面试题27. 二叉树的镜像

 请完成一个函数，输入一个二叉树，该函数输出它的镜像。

 例如输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 镜像输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-shu-de-jing-xiang-lcof
 */
// 666 第一次 自己完成。。。
func mirrorTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return root
    }
    // 只入站处理 多了一个临时存储
    let templ = root?.left
    root?.left = mirrorTree(root?.right)
    root?.right = mirrorTree(templ)
    return root
}

func mirrorTrees(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    // 入站
    let right = mirrorTree(root.right)
    let left = mirrorTree(root.left)
    // 出站
    root.right = left
    root.left = right
    return root
}
