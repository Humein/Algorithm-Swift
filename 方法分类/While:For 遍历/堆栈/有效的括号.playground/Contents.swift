import UIKit

/*
 20. 有效的括号
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。

 示例 4：

 输入：s = "([)]"
 输出：false
 示例 5：

 输入：s = "{[]}"
 输出：true

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func isValid(_ s: String) -> Bool {
        // 利用栈特性
        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            }else if char == ")" {
                if stack.popLast() == "(" {
                    continue;
                }else {
                    return false
                }
            }else if char == "]" {
                if stack.popLast() == "[" {
                    continue;
                }else{
                    return false
                }
            }else if char == "}" {
                if stack.popLast() == "{" {
                    continue;
                }else{
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

Solution().isValid("(){}}{")
