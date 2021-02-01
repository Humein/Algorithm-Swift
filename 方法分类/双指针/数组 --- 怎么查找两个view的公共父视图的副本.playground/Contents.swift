import UIKit

/**
 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面
 
 快慢双指针
 定义快慢双指针 fast 和 low ，fast 在前， low 在后 .
 fast 的作用是向前搜索奇数位置，low 的作用是指向下一个奇数应当存放的位置
 fast 向前移动，当它搜索到奇数时，将它和 nums[low] 交换，此时 low 向前移动一个位置 .
 重复上述操作，直到 fast 指向数组末尾 .
 
*/

