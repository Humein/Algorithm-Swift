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

 https://leetcode-cn.com/problems/binary-tree-postorder-traversal/solution/145-er-cha-shu-de-hou-xu-bian-li-by-cobbly/
 144. 二叉树的前序遍历
 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。

  示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,2,3]

 */

/*
 前序遍历 DFS 递归
 根 -> 左 -> 右
 */


/* 递归
 
 思路与算法

 首先我们需要了解什么是二叉树的前序遍历：按照访问根节点——左子树——右子树的方式遍历这棵树，而在访问左子树或者右子树的时候，我们按照同样的方式遍历，直到遍历完整棵树。因此整个遍历过程天然具有递归的性质，我们可以直接用递归函数来模拟这一过程。
 定义 preorder(root) 表示当前遍历到 root 节点的答案。按照定义，我们只要首先将 root 节点的值加入答案，然后递归调用 preorder(root.left) 来遍历 root 节点的左子树，最后递归调用 preorder(root.right) 来遍历 root 节点的右子树即可，递归终止的条件为碰到空节点。
 
 复杂度分析

 时间复杂度：O(n)，其中 n 是二叉树的节点数。每一个节点恰好被遍历一次。
 空间复杂度：O(n)，为递归过程中栈的开销，平均情况下为 O(logn)，最坏情况下树呈现链状，为 O(n)。
 */


class SloutionRec1 {
    var res = [Int]()
    func preOrderTraverse(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        // 自顶向下的DFS递归
        res.append(root.val)
        _ = preOrderTraverse(root.left)
        _ = preOrderTraverse(root.right)
        return res
    }
}

class Solution {
  var res = [Int]()
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    dfs(root)
    return res
  }
  
  func dfs(_ root:TreeNode?) {
    guard let root = root else {
      return
    }
    res.append(root.val)
    dfs(root.left)
    dfs(root.right)
  }
}


/*
 遍历
 两种方式是等价的, 区别在于递归的时候隐式地维护了一个栈，而我们在迭代的时候需要显式地将这个栈模拟出来，其余的实现与细节都相同
 
 复杂度分析

 时间复杂度：O(n)，其中 n 是二叉树的节点数。每一个节点恰好被遍历一次。

 空间复杂度：O(n)，为迭代过程中显式栈的开销，平均情况下为 O(log n)，最坏情况下树呈现链状，为 O(n)。

 */
class SolutionStack1 {
    func preOrderTraversal(root: TreeNode?) -> [Int] {
        
        guard let root = root else {
            return []
        }
        
        var stack = [TreeNode]()
        var res = [Int]()
        
        // 栈加入处理的节点
        stack.append(root)
        // 栈不为空
        while let node = stack.popLast() {
            res.append(node.val)
            // 根据Stack特性 先入后出: 先push右节点到Stack
            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
        }
        return res
    }
}

class SolutionStack2 {
  
  func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return []
    }
    var res = [Int]()
    var stack = [TreeNode]()
    stack.append(root)
    while !stack.isEmpty {
      let node = stack.popLast()!
      res.append(node.val)
      
      if node.right != nil {
        stack.append(node.right!)
      }
      if node.left != nil {
        stack.append(node.left!)
      }
    }
    return res
  }
}

func travelSubView(_ rootView: UIView){
    if rootView.subviews.count == 0 {
        return
    }
    var res = [UIView]()
    var queue = [UIView]()
    queue.append(rootView)
    while let view = queue.popLast() {
        res.append(view)
        if view.subviews.count > 0 {
            for item in view.subviews{
                queue.append(item)
            }
        }
    }
}
