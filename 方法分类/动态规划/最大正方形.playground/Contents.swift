import UIKit
/**
 可以使用动态规划降低时间复杂度。我们用 dp(i, j)dp(i,j) 表示以 (i, j)(i,j) 为右下角，且只包含 11 的正方形的边长最大值。如果我们能计算出所有 dp(i, j)dp(i,j) 的值，那么其中的最大值即为矩阵中只包含 11 的正方形的边长最大值，其平方即为最大正方形的面积。

 那么如何计算 dpdp 中的每个元素值呢？对于每个位置 (i, j)(i,j)，检查在矩阵中该位置的值：

 如果该位置的值是 00，则 dp(i, j) = 0dp(i,j)=0，因为当前位置不可能在由 11 组成的正方形中；

 如果该位置的值是 11，则 dp(i, j)dp(i,j) 的值由其上方、左方和左上方的三个相邻位置的 dpdp 值决定。具体而言，当前位置的元素值等于三个相邻位置的元素中的最小值加 11，状态转移方程如下：

 dp(i, j)=min(dp(i−1, j), dp(i−1, j−1), dp(i, j−1))+1
 dp(i,j)=min(dp(i−1,j),dp(i−1,j−1),dp(i,j−1))+1

 如果读者对这个状态转移方程感到不解，可以参考 1277. 统计全为 1 的正方形子矩阵的官方题解，其中给出了详细的证明。

 此外，还需要考虑边界条件。如果 ii 和 jj 中至少有一个为 00，则以位置 (i, j)(i,j) 为右下角的最大正方形的边长只能是 11，因此 dp(i, j) = 1dp(i,j)=1。

 空间复杂度：O(mn)O(mn)
 时间复杂度：O(mn)O(mn)
 
 221. 最大正方形
 在一个由 0 和 1 组成的二维矩阵内，找到只包含 1 的最大正方形，并返回其面积。
 */

func maximalSquare(_ matrix: [[Character]]) -> Int {
    var result: Int = 0
    guard matrix.count > 0 else {
        return result
    }
    let rowNum = matrix.count
    let colNum = matrix[0].count
    // 初始化DPArr
    var dp = [[Int]](repeating: [Int].init(repeating: 0, count: colNum), count: rowNum)
    
    for i in 0..<rowNum {
        for j in 0..<colNum {
            if(matrix[i][j] == "1") {
                if(i == 0 || j == 0) {
                    dp[i][j] = 1
                } else {
                    // 递归转移方程式
                    dp[i][j] = min(dp[i-1][j-1], dp[i][j-1], dp[i-1][j])+1
                }
            }
        }
    }
    for item in dp {
        result = max(result, item.max() ?? 0)
    }
    return result * result
}
