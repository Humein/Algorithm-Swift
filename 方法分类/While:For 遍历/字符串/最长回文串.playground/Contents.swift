import UIKit

/**
 409. 最长回文串
 给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。
 在构造过程中，请注意区分大小写。比如 "Aa" 不能当做一个回文字符串。
 */

/**
 符合下面任意一个条件都可以组成回文串

  1. 每个字母出现的次数都是偶数
  2. 有一个字母出现次数是奇数，其它字母出现次数都是偶数
  所以可以用下面步骤求最长回文串

1. 字符串转换成字典，key是字母，value是字母出现的次数
2. 遍历字典
 2.1 如果value是偶数，加上value
 2.2 如果value是奇数，加上(value - 1)，并标记出现过奇数
 2.3 如果出现过奇数，就加上1
 得到的数字就是最长回文串的长度

 */

func longestPalindrome(_ s: String) -> Int {
    guard s.isEmpty == false else {
        return 0
    }

    var record = [Character: Int]()
    for c in s {
        record[c, default: 0] += 1
    }

    var count = 0
    var odd = 0
    for item in record.values {
        if item % 2 == 0 {
            count += item
        } else {
            count += item - 1
            odd = 1
        }
    }
    return count + odd
}


