import UIKit
/*
 最大子序和  给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 思路：
 1）动态规划的是首先对数组进行遍历，当前最大连续子序列和为 sum，结果为 ans
 2）如果 sum > 0，则说明 sum 对结果有增益效果，则 sum 保留并加上当前遍历数字
 3）如果 sum <= 0，则说明 sum 对结果无增益效果，需要舍弃，则 sum 直接更新为当前遍历数字
 4） 每次比较 sum 和 ans的大小，将最大值置为ans，遍历结束返回结果
 
 动态规划
 * 递归是自顶向下，动归是自底向上
 1 最优子结构  ans = nums[0]
 2 状态转移方程式  ans = max(ans, sum)
 3 边界     for num in nums
 解题步骤: 1,建立数学模型 2,写代码求解问题
 */

func maxSubArray(_ nums: [Int]) -> Int {
    // 边界
    if nums.count == 0 {
        return -1
    }
    // 最优子结构 一般用数组去存储
    var curMaxSub = [nums[0]]
    var sum = 0
    // 迭代边界
    for num in nums {
        if sum > 0 {
            // 累计和不小于0 继续累加
            sum += num
        } else {
            // 如果累计和小于0，则抛弃之前的累计和(子序列)，从新的开始
            sum = num
        }
        //将当前子序列和现有的子序列最大进行比较
        // 状态转移方程 max(curMaxSub.last!, sum)
        curMaxSub.append(max(curMaxSub.last!,sum))
    }
    return curMaxSub.last!
}

/**
 53. 最大子数组和
 给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 子数组 是数组中的一个连续部分。
 */







// 暴力破解
// 时间复杂度：O(n^2)
/*
class Solution {
    public int maxSubArray(int[] nums) {
        int max = Integer.MIN_VALUE;
        for(int i = 0;i < nums.length;i++){
            int sum = 0;
            for(int j = i;j < nums.length;j++){
                //sum(i,j)=sum(i,j-1)+nums[j]
                sum += nums[j];
                if(sum > max)
                    max = sum;
            }
        }
        return max;
    }
}
*/
