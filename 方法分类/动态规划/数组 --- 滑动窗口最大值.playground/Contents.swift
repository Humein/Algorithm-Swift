import UIKit

/**
 239. 滑动窗口最大值
 
 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回滑动窗口中的最大值。


 思路：
 利用双端队列 ---
   1. 如果nums[i] >= nums[队尾]，不断删除队尾，直到nums[队尾] > nums[i] 为止
   2. 将i加入队尾
   3. 如果left_index>=0
     3.1:     如果队头失效，就移除队头（如果队头 < left_index就代表失效)
     3.2: 设置left_index窗口的最大值为nums[队头]
*/


class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if k == 1 {
            return nums
        }
        //从大到小排序值的索引
        var index_num = [Int]() // 双端队列
        var new_n = [Int]() // 窗口最大值数组
        for i in 0..<nums.count {
            //当前值最大清空前面小的索引，保证值从大到小排列
            while index_num.count>0 && nums[i]>=nums[index_num.last!] {
                index_num.removeLast()
            }
            index_num.append(i)
            let left_index = i-k+1
            if left_index > -1 {
                //最大值不再窗口清除
                if left_index>index_num.first! {
                    index_num.removeFirst()
                }
                new_n.append(nums[index_num.first!])
            }
        }
        return new_n
    }
}

