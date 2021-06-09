import UIKit

//5. 最长回文子串
/*
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 
 动态规划
 
 根据回文的特性，一个大回文按比例缩小后的字符串也必定是回文，比如ABCCBA，那BCCB肯定也是回文。所以我们 '可以根据动态规划的两个特点：
 （1）'把大问题拆解为小问题
 （2）'重复利用之前的计算结果
     这道题。如何划分小问题，我们可以先把所有长度最短为1的子字符串计算出来，根据起始位置从左向右，这些必定是回文。然后计算所有长度为2的子字符串，再根据起始位置从左向右。到长度为3的时候，我们就可以利用上次的计算结果：如果中心对称的短字符串不是回文，那长字符串也不是，如果短字符串是回文，那就要看长字符串两头是否一样。这样，一直到长度最大的子字符串，我们就把整个字符串集穷举完了。

 '基于动态规划的三要素对问题进行分析，可确定以下的状态转换方程：
  ' 最小子问题 // 最优子结果
 单个字符独立成为一个回文字符串
 相邻的两个相同字符，是一个回文字符串

  ' 递推方程
    设置一个 L*L 的矩阵 D，D[i][j] 的值为 ture 或 false， 表示从 i 起始 j 终止的字符串是否为回文。

  Di = (D[i] === D[j]) && Di+1

 （若第 i 个字符与第 j 个字符相同，且从 i+1 起始 j-1 终止的字符串为回文，则有从 i 起始 j 终止的字符串也为回文）
 */
func longestPalindrome(_ s: String) -> String {
       var dp:[[Bool]] = [];
       if s.count <= 1{
           return s;
       }
       
       var longest:Int = 1;
       var left:Int = 0;
       var right:Int = 0;
       //创建 DP 二维数组
       for i in 0...s.count - 1{
           var eachRow:[Bool] = [];
        for j in 0...s.count - 1{
               if i == j{
                   eachRow.append(true);
               }else{
                   eachRow.append(false);
               }
           }
           dp.append(eachRow);
       }
    
      print(dp)
       
       var i:Int = 0;
       var j:Int = 0;
    for character_j in s {
           if j == 0 {
               j += 1;
               continue;
           }
           i = 0;
        for character_i in s {
               if character_i == character_j {
                   dp[i][j] = dp[i + 1][j - 1] || j - i <= 1;
                   if dp[i][j] && j - i + 1 > longest{
                       longest = j - i + 1;
                       left = i;
                       right = j;
                   }
               }else{
                   dp[i][j] = false;
               }
               i += 1;
               if i >= j{
                   break;
               }
           }
           j += 1;
       }
       let leftIndex = s.index(s.startIndex, offsetBy: left);
       let rightIndex = s.index(s.startIndex, offsetBy: right);
       return String(s[leftIndex...rightIndex]);
}

longestPalindrome("11234aba")


