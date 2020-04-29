import UIKit
//344. 反转字符串
/*
双指针 迭代方式
*/
func reverseStr(_ s: String) -> String{
    if s.count < 2 {
        return s
    }
    var schar = Array(s)
    var p1  = 0
    var p2 = schar.count - 1
    while p1 < p2 {
        let temp = schar[p1]
        schar[p1] = schar[p2]
        schar[p2] = temp
        p1 += 1
        p2 -= 1
    }
    return String(schar)
}

print(reverseStr("12345"))
