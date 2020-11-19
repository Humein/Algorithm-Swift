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
