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
 面试题55 - I. 二叉树的深度
 输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

 例如：

 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
递归
 时间复杂度： 我们每个结点只访问一次，因此时间复杂度为 O(N)，
 其中 N 是结点的数量。
 空间复杂度： 在最糟糕的情况下，树是完全不平衡的，例如每个结点只剩下左子结点，递归将会被调用 N 次（树的高度），因此保持调用栈的存储将是 O(N)。但在最好的情况下（树是完全平衡的），树的高度将是 log(N)。因此，在这种情况下的空间复杂度将是 O(log(N))。
 
 */

func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    let leftDepth = maxDepth(root?.left) + 1
    let rightDepth = maxDepth(root?.right) + 1

    return max(leftDepth,rightDepth)
}

let tnode7 = TreeNode(val: 7, left: nil, right: nil)
let tnode6 = TreeNode(val: 6, left: nil, right: nil)
let tnode5 = TreeNode(val: 5, left: tnode7, right: nil)
let tnode4 = TreeNode(val: 4, left: nil, right: nil)
let tnode3 = TreeNode(val: 3, left: nil, right: tnode6)
let tnode2 = TreeNode(val: 2, left: tnode4, right: tnode5)
let tnode1 = TreeNode(val: 1, left: tnode2, right: tnode3)
maxDepth(tnode1)
