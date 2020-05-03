import UIKit
// 1-100 相加
func recursion100(_ n: Int) -> Int{
    if n == 1 {
        return 1
    }
    return n + recursion100(n-1)
}
