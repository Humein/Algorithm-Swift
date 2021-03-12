import UIKit
/**剑指 Offer 57 - II. 和为s的连续正数序列
 输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。

 序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。

 示例 1：

 输入：target = 9
 输出：[[2,3,4],[4,5]]

 */

/* 思想
 什么是滑动窗口
 滑动窗口可以看成数组中框起来的一个部分。在一些数组类题目中，我们可以用滑动窗口来观察可能的候选结果。当滑动窗口从数组的左边滑到了右边，我们就可以从所有的候选结果中找到最优的结果。

 滑动窗口只有 右边界向右移动（扩大窗口） 和 左边界向右移动（缩小窗口） 两个操作
 */

func findContinuousSequence(_ target: Int) -> [[Int]] {
    var i = 1, j = 1  // 滑动窗口的左右边界 i j 代表数组第一位的值：1
    var curSum = 0 // 滑动窗口中数字的和
    var res = [[Int]]() // 二维数组
    
    while i <= target / 2 { //剪枝：因为 右边界一定大于左边界，因此，当 左边界到达目标值的一半后，就不需要再向后查找了
        if curSum < target {
            // 若 当前和 < 目标值，则：右边界右移
            curSum += j
            j += 1
        }else if curSum > target {
            // 若 当前和 > 目标值，则：左边界右移
            curSum -= i
            i += 1
        }else {
            /*
             若 相等，则：
                 1、将当前区间数，当做一个结果，存储为数组
                 2、将 目标数组，存入结果数组
                 3、左边界 右移，查找 之后的结果
             */

            // 一个类型为 Int ，数量为 j - i，初始值为 0 的空数组：
            var subRes = [Int](repeating: 0, count: j - i)
            for k in i ..< j {
                subRes[k - i] = k
            }
            res.append(subRes)
            curSum -= i
            i += 1
            
        }
    }

    return res
}
findContinuousSequence(9)
