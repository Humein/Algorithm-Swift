import UIKit
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
/**
 145. 二叉树的后序遍历
 给你一棵二叉树的根节点 root ，返回其节点值的 后序遍历 。
 
 https://leetcode-cn.com/problems/binary-tree-postorder-traversal/solution/145-er-cha-shu-de-hou-xu-bian-li-by-cobbly/
 */

/// 递归
class Solution {
    var res = [Int]()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
      if root == nil {
        return res
      }
      post_order(root)
      return res
    }
     
    func post_order(_ root:TreeNode?) {
      guard let root = root else {
        return
      }
      post_order(root.left)
      post_order(root.right)
      res.append(root.val)
  }
}

/*
 . 栈
 使用迭代的话，就需要自己手动维护一个栈

 我们需要先访问最深的左子树，所以迭代下去，将左子树压入栈。
 取出栈顶，即是最左子节点 A ，此时 A 节点 如果有右子树，则压A入栈，遍历右子树，继续执行 1 的操作
 如果当前最左无右子树，则打印值，遍历下一个栈顶节点。

 */

class Solution1 {
   
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
      if root == nil {
        return []
      }
    
      var res = [Int]()
      var stack = [TreeNode]()
      var prev : TreeNode?
      var current = root
    
      while current != nil || !stack.isEmpty {
      
        while current != nil {
          stack.append(current!)
          current = current!.left
        }
      
        current = stack.popLast()!
        if current!.right == nil || current!.right == prev {
          res.append(current!.val)
          prev = current
          current = nil
        } else {
          stack.append(current!)
          current = current!.right
        }
      }
      return res
    }
}

extension TreeNode: Hashable, Equatable {
   public func hash(into hasher: inout Hasher) {
       // 用于唯一标识
       hasher.combine(val)
       hasher.combine(ObjectIdentifier(self))
   }
   public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
       return lhs === rhs
   }
}
