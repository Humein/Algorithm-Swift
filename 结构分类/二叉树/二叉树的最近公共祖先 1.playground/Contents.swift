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
 面试题68 - II. 二叉树的最近公共祖先
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]



  

 示例 1:

 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出: 3
 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
 示例 2:

 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出: 5
 解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
  

 说明:

 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉树中。
 */


/**
 - https://blog.csdn.net/qq_28114615/article/details/85715017
   根据临界条件，实际上可以发现这道题已经被
 简化为查找以(最近的)root为根结点的树上是否有p结点或者q结点，如果有就返回p结点或q结点，否则返回null。
   这样一来其实就很简单了，从左右子树分别进行递归，即查找左右子树上是否有p结点或者q结点，就一共有4种情况：
 */

func findCloseRoot(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode?{

    if root === p || root === q || root == nil {
        return root
    }
    
    // 入·
    let left = findCloseRoot(root?.left, p, q)
    let right = findCloseRoot(root?.right, p, q)

    // 出·
    if left == nil && right == nil {
        return nil
    }else if left == nil && right != nil{
        return right
    }else if right == nil && left != nil{
        return left
    }
    return root
}
