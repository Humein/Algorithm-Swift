import UIKit

/*
 88. 合并两个有序数组 ---  3个指针迭代
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 
 思路：
 p1 指向 num1 尾部
 p2 指向 num2 尾部
 p  指向 将要合并成数组尾部：即 num 1 + num2 - 1
*/

func mergeArrays(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var p1 = m - 1, p2 = n - 1, p = m + n - 1
    while p1 >= 0 && p2 >= 0 {
        if nums1[p1] >= nums2[p2] {
            nums1[p] = nums1[p1]
            p1 -= 1
            p -= 1
        }else{
            nums1[p] = nums2[p2]
            p2 -= 1
            p -= 1
        }
    }
    //  这里直接将num1 作为合成的数组，这样只需要判断num2 数组是否遍历完成就行了。
    while p2 >= 0 {
        nums1[p] = nums2[p2]
        p -= 1
        p2 -= 1
    }
}
