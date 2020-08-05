import UIKit
//70. 爬楼梯 本质就是 斐波拉切数列
/*
 题目：你正在爬楼梯。需要 n 步你才能到达顶部。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方式可以爬到楼顶呢？
 https://blog.csdn.net/moakun/article/details/79928067
 思路：一道经典的爬楼梯问题，直觉上第一个想到的就是采用递归，也就是要计算爬到第3层楼梯有几种方式，可以从第2层爬1级上来，也可以从第1层爬2级上来，所以爬到第3级有几种方式只需要将到第2层总共的种数，加上到第1层总共的种数就可以了。推广到一般，写出
 递推公式    stairs(n) = stairs(n-1) + stairs(n-2) ，
 只需要初始化好退出递归的条件就算写完了。
 
 动态规划  <自下而上分解成>
 */


// 递归法
func climbStairs(_ n: Int) -> Int{
    if n == 0 || n == 1 || n == 2{
        return n
    }
    
    return climbStairs(n-1) + climbStairs(n-2)
}
// 动态规划法
func climbStairsDp(_ n: Int) -> Int{
    if n == 0 || n == 1 || n == 2{
        return n
    }
    var dpArr = [1,1,2]
    for i in 3...n {
        dpArr.append(dpArr[i-1] + dpArr[i-2])
    }
    print(dpArr)
    return dpArr[n]
}

climbStairsDp(2)
