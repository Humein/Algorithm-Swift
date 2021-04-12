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
 235. 二叉搜索树的最近公共祖先
 
 给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。
 
 - 二叉查找树（英語：Binary Search Tree），也称为二叉搜索树、有序二叉树，是指一棵空树或者具有下列性质的二叉树： 

 若任意节点的左子树不空，则左子树上所有节点的值均小于它的根节点的值；
 若任意节点的右子树不空，则右子树上所有节点的值均大于或等于它的根节点的值；
 任意节点的左、右子树也分别为二叉查找树；
 二叉查找树相比于其他数据结构的优势在于查找、插入的时间复杂度较低。为
 O(logn)。二叉查找树是基础性数据结构，用于构建更为抽象的数据结构，如集合、多重集、关联数组等。
 
 - 查找问题
 静态查找 不需要进行插入删除操作，使用二分查找即可
 动态查找 需要执行插入删除操作，使用二分查找树
 
 

 - 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

 例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]



 示例 1:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
 输出: 6
 解释: 节点 2 和节点 8 的最近公共祖先是 6。
 示例 2:

 输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
 输出: 2
 解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。
  

 说明:

 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉搜索树中。
 */


//递归 利用二叉搜索树的性质。
/*
 递推工作：
 当 p, q 都在 root 的 右子树 中，则开启递归 root.right并返回；
 否则，当 p, q都在 root 的 左子树 中，则开启递归 root.left 并返回；
 返回值： 最近公共祖先 root 。
 */

func findRecentRoot(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if p == nil || q == nil || root == nil {
        return nil
    }
    
    // 1.因为是二叉搜索树，所以利用值来进行判断
    // 1.1如果两个值都比root小
    if p!.val < root!.val && q!.val < root!.val {
        return findRecentRoot(root!.left, p, q)
    }
    
    // 2.如果两个值逗比root大
    if p!.val > root!.val && q!.val > root!.val {
        return findRecentRoot(root!.right, p, q)
    }
    
    // 3.如果两个值在一左一右，证明该结点就是公共祖先结点
    return root
}

// 迭代,利用二叉搜索树的特性,比较大小.

/*
 循环搜索： 当节点 rootroot 为空时跳出；
 当 p, qp,q 都在 rootroot 的 右子树 中，则遍历至 root.rightroot.right ；
 否则，当 p, qp,q 都在 rootroot 的 左子树 中，则遍历至 root.leftroot.left ；
 否则，说明找到了 最近公共祖先 ，跳出。
 */

func findRecentRootw(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let p = p, let q = q else { return nil }
    
    var node = root
    while node != nil {
        let pVal = node!.val
        if p.val < pVal && q.val < pVal {
            node = node?.left
        } else if p.val > pVal && q.val > pVal {
            node = node?.right
        }else {
            return node
        }
    }

    return nil
}

