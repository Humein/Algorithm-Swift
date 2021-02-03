import UIKit
// 1-100 相加 <斐波那契数列>
func recursion100(_ n: Int) -> Int{
    if n == 1 {
        return 1
    }
    return n + recursion100(n-1)
}


func recursionNM(_ n: Int, _ m: Int)  ->Int{
    if m == n {
        return n
    }
    return n < m ? recursionNM(n, m - 1 ) + m  : recursionNM(n - 1,m) + n
}

recursionNM(2,6)


//int total = 0;// 总和
// // 非递归算法，时间复杂度O(n),空间复杂度O(1)
// public int addtion_0(int n) {
//     for (int i = 0; i <= n; i++) {
//         total += i;
//     }
//     return total;
// }
// // 递归算法，时间复杂度为O(n),空间复杂度为O(n)
// public int addtion(int n) {
//     if (n == 1)
//         return 1;
//     else {
//         return total = total + n + addtion(n - 1);
//     }
// }
// // 利用等差数列求和公式，时间复杂度为O(1),空间复杂度为O(1)
// public int addtion02(int n) {
//     return n * (1 + n) / 2;
// }

func recSum(_ n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return recSum(n - 1) + n
}
