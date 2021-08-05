import UIKit
/**
 46. 全排列
 给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。

 示例 1：

 输入：nums = [1,2,3]
 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 
 
 预备知识
 回溯法：一种通过探索所有可能的候选解来找出所有的解的算法。如果候选解被确认不是一个解（或者至少不是最后一个解），回溯算法会通过在上一步进行一些变化抛弃该解，即回溯并且再次尝试。

 思路和算法

 这个问题可以看作有 n 个排列成一行的空格，我们需要从左往右依此填入题目给定的 n 个数，每个数只能使用一次。那么很直接的可以想到一种穷举的算法，即从左往右每一个位置都依此尝试填入一个数，看能不能填完这 n 个空格，在程序中我们可以用「回溯法」来模拟这个过程。


 
*/

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var nums = nums
        recurPermute(&nums, &ans, 0, nums.count-1)
        return ans
    }

    func recurPermute(_ nums: inout [Int],_ ans: inout [[Int]], _ k: Int, _ m: Int) {
        if k == m {
            ans.append(nums)
        } else {
            for i in k...m {
                nums.swapAt(i, k)
                recurPermute(&nums, &ans, k+1, m)
                nums.swapAt(i, k)
            }
        }
    }
}
