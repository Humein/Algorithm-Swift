import UIKit
/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 滑动窗口<3个指针 一个临时结果>  左闭右开 向一个方向移动
 
我们为了要找最长的字串，就要j++，查看j+1元素是否与当前字串有重复字母。如果没有则继续j++，直到某一刻j+1的字符与当前字串中产生了重复字母，此时j无法继续向前拓展，记录当前长度，之后i++，直到将这个重复字符刨除出去，j又继续拓展...
 一个问题是：如何判定下一个字符与当前字串是否存在重复字符？
遍历字符串中的每一个元素。借助一个辅助键值对来存储某个元素最后一次出现的下标。用一个整形变量存储当前无重复字符的子串开始的下标。
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    // p1 p2 窗口左右边界
    // p 滑动遍历指针
    // result 临时窗口大小
    var p1 = 0, p2 = 0, p = 0, result = 0
    // 边界
    if s.count == 0 {
        return result
    }
    // 窗口
    result = p2 - p1
    // string转换数组
    let chars = Array(s)
    // 窗口滑动
    while p2 < chars.count {
        // 记录内部遍历指针
        p = p1
        // 窗口内部查重
        while p < p2 {
            if chars[p] == chars[p2] {
                //窗口左边移动条件
                p1 = p + 1
                break
            }
            p = p + 1
        }
        result = max(result,p2 - p1 + 1)
        //窗口右边移动条件
        p2 = p2 + 1
    }
    return result
}
lengthOfLongestSubstring("pwwkew")
