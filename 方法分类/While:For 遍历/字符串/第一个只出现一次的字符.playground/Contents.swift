import UIKit
/** 剑指 Offer 50. 第一个只出现一次的字符
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。

 思路：
 hashMap + 两次循环
 第一次将出现次数插入
 第二次遍历字符串从hashMap查询出第一个
 */

func firstUniqChar(_ s: String) -> Character {
    guard s.count > 0 else {
        return " "
    }
    var map = [Character: Int]()
    for char in s {
        map[char, default: 0] += 1
    }
    for char in s {
         if map[char] == 1 {
             return char
         }
     }
    return " "
}
