import UIKit

//14. 最长公共前缀
/*
 取出第一个字符串，使用后面的字符串判断第一个字符串是否是他们的前缀，不是则将第一个字符串长度减一，继续判断
 */

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    var result = strs.first!
    
    for i in 1..<strs.count {
        while !strs[i].hasPrefix(result) {
            result = String(result.prefix(result.count - 1))
            if result.count == 0{
               return ""
            }
        }
    }
    return result
}
