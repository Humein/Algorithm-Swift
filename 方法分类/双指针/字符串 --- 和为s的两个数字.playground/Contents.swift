import UIKit
/**剑指 Offer 57. 和为s的两个数字
 输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

 输入：nums = [10,26,30,31,47,60], target = 40
 输出：[10,30] 或者 [30,10]
 
 */

// 双指针
/*
 算法流程：
 初始化： 双指针 i , j 分别指向数组 nums 的左右两端 （俗称对撞双指针）。
 循环搜索： 当双指针相遇时跳出；
 计算和 s = nums[i] + nums[j]；
 若 s > target ，则指针 j 向左移动，即执行 j = j - 1 ；
 若 s < target ，则指针 i 向右移动，即执行 i = i + 1 ；
 若 s = target ，立即返回数组 [nums[i], nums[j]]；
 返回空数组，代表无和为 target 的数字组合。

 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var left = 0, right = nums.count - 1
    while left < right {
        let sum = nums[left] + nums[right]
        if sum < target{
            left+=1
        } else if sum > target{
            right-=1
        }else{
            return[nums[left],nums[right]]
        }
    }
    return []
}
twoSum([2,7,11,15], 9)

