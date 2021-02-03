import UIKit

/**
 面试题 17.10. 主要元素
 数组中占比超过一半的元素称之为主要元素。给定一个整数数组，找到它的主要元素。若没有，返回-1。

 *  先排序，找出中间元素，中间元素不一定是主要元素，但主要元素一定是中间元素

*/



// 自己的尝试
func majorityElement(_ nums: [Int]) -> Int {
    var dic = Dictionary<Int, Int>()
    var l = 0, r = nums.count - 1
    var max = -1;
    while l <= r {
        if dic[nums[l]] == nil {
            dic[nums[l]] = 1
        }else{
            dic[nums[l]]!+=1
            print(dic[nums[l]]!)
        }
        max = dic[nums[l]]!
        l+=1
    }
    return max
}

let val = majorityElement([3,2,3,3,2,2,2,2])


