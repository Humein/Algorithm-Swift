import UIKit
// 二叉树结构
class TreeNode {
    var perent: TreeNode?
    var val: Int = 0
    var left: TreeNode?
    var right: TreeNode?
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


/**
 654. 最大二叉树
 
 给定一个不含重复元素的整数数组 nums 。一个以此数组直接递归构建的 最大二叉树 定义如下：

 二叉树的根是数组 nums 中的最大元素。
 左子树是通过数组中 最大值左边部分 递归构造出的最大二叉树。
 右子树是通过数组中 最大值右边部分 递归构造出的最大二叉树。
 返回有给定数组 nums 构建的 最大二叉树 。

思路：递归
 
 以最大值的index为分割点，动态递归
 
 */

class Solution {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        return findRoot(nums, 0, nums.count)
    }
    
    private func findRoot(_ nums: [Int],_ l: Int,_ r: Int) -> TreeNode? {
        // 递归边界
        if l == r {return nil}
        
        // 处理逻辑 查找最大值
        var maxIndex = l
        
        for i in l + 1 ..< r {
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }

        // 创建最大节点
        let root = TreeNode.init(nums[maxIndex], findRoot(nums, l, maxIndex),  findRoot(nums, maxIndex + 1, r))
        
        return root
    }
}

