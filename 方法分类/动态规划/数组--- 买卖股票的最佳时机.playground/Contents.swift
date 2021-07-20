import UIKit
/*
 121. 买卖股票的最佳时机
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
 如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。
 注意你不能在买入股票前卖出股票
 
 动态规划
  1 最优子结构(2个)
     1- 只要考虑当天买和之前买哪个收益更高，
     2- 当天卖和之前卖哪个收益更高。
  2 边界
  3 状态转移方程(2个)    第二个方程的参数是第一个方程的解

 */
func dynamicMaxProfit(_ price: [Int]) -> Int {
    // 边界
    guard price.count > 1 else {
        return 0
    }
    
    // 两个最小子结构
    var min_b = price[0], max_p = 0;//这个是利润 最小就是0
    
    //3 状态转移方程 min_b max_p 都是当前的最优，随着遍历一直往下走
    for idx in 1...price.count - 1 {
        // 得出idx之前最小的
        min_b = min(min_b,price[idx])// 一直取买入最低的价格 // 最优子结构
        // prices[idx] 减去 idx之前最小的
        max_p = max(price[idx] - min_b,max_p)//第i天卖出,或者上一个状态比较,取最大值. // 最优子结构
    }
    
    return max_p
}


