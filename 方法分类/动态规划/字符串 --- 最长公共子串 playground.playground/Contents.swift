import UIKit
import Darwin
/**
 最长公共子串（Longest Common Substring）： 是指两个字符串中最长连续相同的子串长度。

 例如：str1=“1AB2345CD”,str2=”12345EF”,则str1，str2的最长公共子串为2345。

 解法1：
 如果 str1 的长度为 N，str2 的长度为 M，生成大小为 N*M 的 数组 dp , dp[i][j] 的值 表示 str1[0…i] 与 str2[0…j] 的最长公共子串的长度。
 
 计算dp[i][j] 的方法如下：

 矩阵 dp 的第一列 dp[0…m-1][0].对于 某个位置（i，0）如果str1[i]==str2[0],则dp[i][0]=1,否则dp[i][0]=0
 矩阵 dp 的第一行 dp[0][0…n-1].对于 某个位置（0，j）如果str1[0]==str2[j],则dp[0][j]=1,否则dp[0][j]=0
 其他位置从左到右从上到下计算，dp[i][j]的值只有两种情况：
 1). str1[i]==str2[j],dp[i][j]=dp[i-1][j-1]+1;

 2). tr1[i]!=str2[j]则dp[i][j]=0;

 str1=”abc”,str2=”caba”的 dp 矩阵如下:

     a　  b　　c
 
 c　　0　　0　　1

 a　　1　　0　　0

 b　　0　　2　　0

 a　　1　　0　　0
 
 先来看下时间复杂度，两重循环，所以时间复杂度显然为 O(n^2)。空间复杂度呢，二维数组，所以是 O(n^2)，时间复杂度没法优化了，那么空间复杂度呢，其实可以优化为 O(n), 怎么优化，这里就要提一下动态规划的「无后效性」了。https://cloud.tencent.com/developer/article/1701266

*/

// 最长连续相同
func lcss(_ str11: String, _ str22: String) -> Int{

    if str11.count == 0 || str11.count == 0 { return 0 }
    let str1 = Array(str11)
    let str2 = Array(str22)

    
    // 创建 DP 二维数组
    // 预定义大小的二维数组
    var dp = Array(repeating: Array(repeating: 0, count: str1.count), count: str2.count)
    
    // 最长公共子串， 用一个临时变量表示
    var resultLCS = 0
    // 为什么从 1 开始 - 去除无用的 x轴 y轴
    for i in 1..<str1.count {
        for j in 1..<str2.count {
            /// 以下是状态转移方程
            // 如果字符相同
            if (str1[i] == str2[j]) {//需要连续性
                // 二维数组对应值+1 以及 叠加上之前已计算过的上一位的数组值
                dp[i][j] = dp[i-1][j-1] + 1;
                // 对比上次最长值 得出目前最大的
                resultLCS = max(resultLCS, dp[i][j]);
            } else {
                // 置为0
                dp[i][j] = 0;
            }
        }
    }
    
    return resultLCS;
}



/**
 1143. 最长公共子序列
 
 给定两个字符串 text1 和 text2，返回这两个字符串的最长 公共子序列 的长度。如果不存在 公共子序列 ，返回 0 。

 一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。

 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。
 两个字符串的 公共子序列 是这两个字符串所共同拥有的子序列。

 */

//最长公共子序列(非连续)
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1Arr = Array(text1), text2Arr = Array(text2)
        var arr = Array(repeating: Array(repeating: 0, count: text2Arr.count + 1), count: text1Arr.count + 1)
        for i in 1...text1Arr.count {
            for j in 1...text2Arr.count {
                if text1Arr[i - 1] == text2Arr[j - 1] { // 因为从1开始需要判断字符串第一个字符
                    arr[i][j] = arr[i - 1][j - 1] + 1
                } else {
                    arr[i][j] = max(arr[i - 1][j], arr[i][j - 1])
                }
            }
        }
        return arr[text1Arr.count][text2Arr.count]
    }
}
