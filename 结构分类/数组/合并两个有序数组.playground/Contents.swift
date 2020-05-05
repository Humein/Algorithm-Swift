import UIKit
/**
 88. 合并两个有序数组
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

  

 说明:

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
  

 示例:

 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 输出: [1,2,2,3,5,6]
 */

/// 88. 合并两个有序数组 ---  3个指针迭代
/*
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 */

/** 3个指针迭代
 一个指向num1尾部
 一个指向num2尾部
 一个指向num1 + num2 尾部
 
 */
func mergeNums(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var p1 = m - 1, p2 = n - 1, p3 = m + n - 1
    // while循环
    while p1 >= 0 && p2 >= 0 {
        if nums1[p1] > nums2[p2] {
            nums1[p3] = nums1[p1]
            p1 -= 1
            p3 -= 1
        }else {
            nums1[p3] = nums2[p2]
            p2 -= 1
            p3 -= 1
        }
    }
    // 处理剩余nums2
    while p2 >= 0 {
        nums1[p3] = nums2[p2]
        p2 -= 1
        p3 -= 1
    }
}
