import UIKit
/**
 62. 不同路径
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 问总共有多少条不同的路径？

 递推方程
   dp[i] [j] = dp[i-1] [j] + dp[i] [j-1]

 我们的初始值是计算出所有的(最小子)
   dp[0] [0….n-1] 和所有的 dp[0….m-1] [0]
 这个还是非常容易计算的，相当于计算机图中的最上面一行和左边一列。因此初始值如下：
   dp[0] [0….n-1] = 1; // 相当于最上面一行，机器人只能一直往左走
   dp[0…m-1] [0] = 1; // 相当于最左面一列，机器人只能一直往下走
 */

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    ///边界
    if m <= 0 || n <= 0 {
        return 0
    }
    
    // 最小子 二维数组
    var dp = [[Int]]()
    
    //创建 DP 二维数组  垃圾swift 二维数组操作
    for _ in 0..<m{
        var eachRow:[Int] = []
        for _ in 0..<n{
        eachRow.append(n);
        }
        dp.append(eachRow);
    }
    
    //一直往下走
    for i in 0..<m {
        dp[i][0] = 1
    }
    
    //一直往左走
    for i in 0..<n {
        dp[0][i] = 1
    }
    
    /// 递推
    for i in 1..<m {
        for j in 1..<n {
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    return dp[m-1][n-1]
}

