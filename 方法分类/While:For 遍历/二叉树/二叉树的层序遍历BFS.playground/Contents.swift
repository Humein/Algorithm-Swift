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
 
 */

/**
 二叉树层次遍历 BFS 利用队列的方式
 */
func levelOrder(_ root: TreeNode?) -> [[Int]] {
     guard let r = root else {
         return [[Int]]()
     }
     var result = [[Int]]()
    // 队列
     var queue = [TreeNode]()
     queue.append(r)
     while queue.count > 0 {
         let layer = Array(queue)
         var layerVal = [Int]()
         queue.removeAll()
         for node in layer {
             layerVal.append(node.val)
             if let ln = node.left {
                 queue.append(ln)
             }
             if let rn = node.right {
                 queue.append(rn)
             }
         }
         // result.insert(layerVal, at: 0) 倒序
         result.append(layerVal) // 正序
     }
     return result
 }
 
 
 
 let root5 = TreeNode.init(val: 104, left: nil, right: nil)
 let root4 = TreeNode.init(val: 103, left: root5, right:  root5)
 let root3 = TreeNode.init(val: 102, left: root4, right: nil)
 let root2 = TreeNode.init(val: 101, left: nil, right:  nil)
 let root1 = TreeNode.init(val: 100, left: root2, right: root3)
 levelOrder(root1)


