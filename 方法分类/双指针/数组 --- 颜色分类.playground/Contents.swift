import UIKit

/*
 75. 颜色分类
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

 思路：
 0 全放左边  2全放右边；剩下的就是1
 
 三个指针：一个头部a(放0) 一个尾部b(放2)
         一个遍历c 进行逻辑比较：
            遇到1跳过；c++
            遇到0就和a交换值；a++ c++
            遇到2就和b变换值; b-- 同时再次对c的值进行判断(c指针不动就行了)。

*/

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var l = 0, c = 0, r = nums.count - 1
        while c <= r {
            let v = nums[c]
            if v == 0 {
                swap(&nums, c, l)
                c+=1
                l+=1
            }else if (v == 1) {
                c+=1
            }else{
                swap(&nums, c, r)
                r-=1
            }
        }
    }
    
    func swap(_ nums: inout [Int], _ c: Int, _ j: Int) {
        let tmp = nums[c]
        nums[c] = nums[j]
        nums[j] = tmp
    }
    
}

var nums = [2,0,2,1,1,0]
Solution().sortColors(&nums)
