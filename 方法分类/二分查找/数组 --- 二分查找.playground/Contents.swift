import UIKit
/**
 704. 二分查找
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。


 示例 1:

 输入: nums = [-1,0,3,5,9,12], target = 9
 输出: 4
 解释: 9 出现在 nums 中并且下标为 4
 示例 2:

 输入: nums = [-1,0,3,5,9,12], target = 2
 输出: -1
 解释: 2 不存在 nums 中因此返回 -1
 */

// 双指针实现
func binarySearch(_ n: [Int], _ target: Int) -> Int {
    var p1 = 0, p2 = n.count - 1
    // <= 
    while p1 <= p2 {
        // 代码中 left + (right - left) / 2 就和 (left + right) / 2 的结果相同，但是有效防止了 left 和 right 太大直接相加导致溢出。
        let mid = (p2 - p1)/2 + p1 // 记得加p1
        if n[mid] == target {
            return mid
        }else if (n[mid] > target){
            p2 = mid - 1
        }else if (n[mid] < target) {
            p1 = mid + 1
        }
    }
    return -1
}

/*
 寻找左侧边界的二分搜索
 因为我们初始化 right = nums.length
 所以决定了我们的「搜索区间」是 [left, right)
 所以决定了 while (left < right)
 同时也决定了 left = mid + 1 和 right = mid

 因为我们需找到 target 的最左侧索引
 所以当 nums[mid] == target 时不要立即返回
 而要收紧右侧边界以锁定左侧边界
 
 int left_bound(int[] nums, int target) {
     if (nums.length == 0) return -1;
     int left = 0;
     int right = nums.length; // 注意
     
     while (left < right) { // 注意
         int mid = (left + right) / 2;
         if (nums[mid] == target) {
             right = mid;
         } else if (nums[mid] < target) {
             left = mid + 1;
         } else if (nums[mid] > target) {
             right = mid; // 注意
         }
     }
     return left;
 }
 */
