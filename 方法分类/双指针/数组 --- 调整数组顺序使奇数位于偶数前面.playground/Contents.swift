import UIKit

/**
 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面
 
 双数组分别存储

 %2==0 是偶数
*/

class Solution {
    func exchange(_ nums: [Int]) -> [Int] {
        var array1 = [Int]()
        var array2 = [Int]()
        for num in nums {
            if num % 2 != 0 {
                array1.append(num)
            } else {
                array2.append(num)
            }
        }
        return array1 + array2
    }
}
