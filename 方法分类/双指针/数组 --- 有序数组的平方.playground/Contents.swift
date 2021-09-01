import UIKit

/*
 977. 有序数组的平方
   给你一个按 非递减顺序 排序的整数数组 nums，返回 每个数字的平方 组成的新数组，要求也按 非递减顺序 排序。
 
 思路：

 无论数组中是否包含负数，绝对值最大值肯定处在数组的两端，所以很容易想到比较数组两端值的绝对值，然后将绝对值大的值的平方依次插入到数组首位即可，思路简单清晰


*/

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        // 当前最大值的指针
        var k = nums.count - 1
        
        var result = Array<Int>(repeating: 1, count: nums.count)
        var i = 0
        var j = nums.count - 1
        while i <= j {
            if nums[i]*nums[i] < nums[j]*nums[j] {
                result[k] = nums[j] * nums[j]
                j -= 1
                k -= 1
            }else{
                result[k] = nums[i]*nums[i]
                k -= 1
                i += 1
            }
        }
        return result
    }
}
