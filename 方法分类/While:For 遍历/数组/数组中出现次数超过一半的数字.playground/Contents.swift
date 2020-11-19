import UIKit
/**
 剑指 Offer 39. 数组中出现次数超过一半的数字
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
 
 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1:

 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
 输出: 2
  
 */

//方法1 hash表
func majorityElement(_ nums: [Int]) -> Int {
    var map = [Int: Int]()
    for num in nums {
        map[num] = map[num] == nil ? 1 : map[num]! + 1
        if map[num]! > nums.count / 2 {
            return num
        }
    }
    return -1
}



//方法2 排序
func majorityElement1(_ nums: [Int]) -> Int {
    return nums.sorted()[nums.count / 2]
}

//方法3 投票法
func majorityElement2(_ nums: [Int]) -> Int {
    var count = 0
    var card = 0
    for num in nums {
        if count == 0 {
            card = num
        }
        count += card == num ? 1 : -1
    }
    return card
}

