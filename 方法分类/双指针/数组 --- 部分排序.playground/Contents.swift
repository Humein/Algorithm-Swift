import UIKit

/*
 面试题 16.16. 部分排序
 给定一个整数数组，编写一个函数，找出索引m和n，只要将索引区间[m,n]的元素排好序，整个数组就是有序的。注意：n-m尽量最小，也就是说，找出符合条件的最短序列。函数返回值为[m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。
 
 思路：
   寻找左右最小最大逆序值  [1,5,4,3,2,6,7,2,8]
 从左到右扫描最大逆序
   - 记录扫描过的最大值；(8)
   - 如果发现当前值小于最大值，记录它的位置(7)；否则更新最大值
 从右到左扫描最小逆序
   - 记录扫描过的最小值；(1)
   - 如果发现当前值大于于最小值，记录它的位置(1)；否则更新最小值

*/

class Solution {
    func subSort(_ array: [Int]) -> [Int] {
        if (array.count == 0) {return [-1,-1]}
        // 从左扫描到右寻找逆序对 （正序：逐渐变大）
        var max = array[0]
        // 记录最右的逆序对位置
        var r = -1
        for i in 1..<array.count {
            let val = array[i]
            if val >= max {
                max = val
            }else{
                r = i
            }
        }
        // 提前退出
        if r == -1 {
            return [-1,-1]
        }
        
        var min = array[array.count - 1]
        var l = -1
        // 倒序
        for index in stride(from: array.count - 2, through: 0, by: -1) {
            
        }
        for i in (0...array.count - 2).reversed() {
            let val = array[i]
            if val <= min {
                min = val
            }else{
                l = i
            }
        }
        return [l,r]
    }
}
