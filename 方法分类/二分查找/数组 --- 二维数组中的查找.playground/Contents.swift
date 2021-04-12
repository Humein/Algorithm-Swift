import UIKit
/**
 面试题04. 二维数组中的查找
 在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

 示例:

 现有矩阵 matrix 如下：

 [
   [1,   4,  7, 11, 15],
   [2,   5,  8, 12, 19],
   [3,   6,  9, 16, 22],
   [10, 13, 14, 17, 24],
   [18, 21, 23, 26, 30]
 ]
 给定 target = 5，返回 true。

 给定 target = 20，返回 false。
 
 */

/**
 思路:

 1:第一反应都是二分查找。对于每一行进行二分查找，然后查找过程可以把某些列排除掉，这是大家都能想到的基本的思路。

 2:    首先选取数组右上角的数字，如果该数字等于要查找的数字，则查找结束；
    如果该数字大于要查找的数字，剔除这个数字所在的列，
    如果该数字小于要查找的数字，剔除这个数字所在的行。
    这样每一步都可以剔除一行或一列，查找的速度比较快。
 */

func findNumberIn2DArray(data: [[Int]],number: NSInteger) -> Bool{
    if data.count == 0 || data.isEmpty{
        return  false
    }
    var row :Int = 0, col :Int = data[0].count - 1

    while row < data.count && col >= 0 {
        let rightVal = data[row][col]
        if rightVal == number {
            return true
        }else if rightVal > number{
            col -= 1
        }else{
            row += 1
        }
    }
    return false
}



