import UIKit
/*
 offer14：剪绳子   　给你一根长度为n的绳子，请把绳子剪成m段（m、n都是整数，n>1并且m>1），每段绳子的长度记为k[0],k[1],...,k[m]。请问k[0]xk[1]x...xk[m]可能的最大乘积是多少？例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。
 
 动态规划
    1: 边界
    2: 最优子结构
    3: 动态转移方程

 */

func maxCute_DP(length: Int) -> Int {
    // 边界
    if length < 2 {
        return 0
    }
    
    // 最优子结构  length == 0, 1, 2, 3,
    var dp = [0,1,2,3]
    var result = 0
    for i in 4...length {
        result = 0
        for j in 1...i/2 {
            // DP 方程式
            let product = dp[i] * dp[i-j]
            result = max(product, result)
        }
        dp.append(result)
    }
    return dp[result]
    
}

