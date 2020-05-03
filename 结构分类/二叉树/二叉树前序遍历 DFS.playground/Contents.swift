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
 给定一个二叉树，返回它的 前序 遍历。

  示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,2,3]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-preorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/**
前序遍历 DFS
 根 -> 左 -> 右
 */


// 递归
class Solution {
    var res: [Int] = []
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    res.append(root.val)
    _ = preorderTraversal(root.left)
    _ = preorderTraversal(root.right)
    return res
}
}

// 遍历 栈
class Solution1 {
    var res: [Int] = []
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil {return []}
    var stack = [TreeNode]()
    var res = [Int]()
    stack.append(root!)
    while let node = stack.popLast() {
        res.append(node.val)
        if let right = node.right { stack.append(right) }
        if let left = node.left { stack.append(left) }
    }
    return res
}
}
