import UIKit
/**
 旋转数组的最小数字      把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。

 - 数组中的最后一个元素 x：在最小值右侧的元素，它们的值一定都小于等于 xx；而在最小值左侧的元素，它们的值一定都大于等于 x。因此，我们可以根据这一条性质，通过二分查找的方法找出最小值。
 - 在二分查找的每一步中，左边界为 low ，右边界为 high，区间的中点为 pivot，最小值就在该区间内。我们将中轴元素 numbers[pivot] 与右边界元素 numbers[high] 进行比较，可能会有以下的三种情况：
    1. 第一种情况是 numbers[pivot] < numbers[high]
        这说明numbers[pivot]是最小值右侧的元素，因此我们可以忽略二分查找区间的右半部分。
    2. 第二种情况是 numbers[pivot] > numbers[high]
        这说明numbers[pivot]是最小值左侧的元素，因此我们可以忽略二分查找区间的左半部分。
    3.    第三种情况是 numbers[pivot] == numbers[high],
        由于重复元素的存在，我们并不能确定numbers[pivot] 究竟在最小值的左侧还是右侧，因此我们不能莽撞地忽略某一部分的元素。我们唯一可以知道的是，由于它们的值相同，所以无论
        numbers[high] 是不是最小值，都有一个它的「替代品」 numbers[pivot] ,因此我们可以忽略二分查找区间的右端点
 
 
 * 算法流程：
 1. 初始化： 声明 ii, jj 双指针分别指向 numsnums 数组左右两端；
 2. 循环二分： 设 m = (j - i) / 2 + i 为每次二分的中点，可分为以下三种情况：
    2.1 当 nums[m] > nums[j] 时： m 一定在 左排序数组 中，即旋转点 x 一定在 [m + 1, j] 闭区间内，因此执行 i = m + 1；
    2.2  当 nums[m] < nums[j] 时： m 一定在 右排序数组 中，即旋转点 x 一定在[i, m] 闭区间内，因此执行 j = m；
    2.3 当 nums[m] = nums[j] 时： 无法判断 m 在哪个排序数组中，即无法判断旋转点 x 在 [i, m] 还是 [m + 1, j] 区间中。解决方案： 执行 j = j - 1 缩小判断范围，分析见下文。
 返回值： 当 i = j 时跳出二分循环，并返回 旋转点的值 nums[i] 即可。


 
 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof/solution/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-by-leetcode-s/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 */


// 旋转数组的最小数字 -- 变种二分（只有是有序都可以尝试使用二分）
func minArray(_ numbers: [Int]) -> Int {
    var i = 0, j = numbers.count - 1
    // 和二分的区别：
    while i < j {
        let mid = (j - i) / 2 + i
        if numbers[mid] < numbers[j] {
            j = mid
        }else if numbers[mid] > numbers[j] {
            i = mid + 1
        }else {
            j-=1
        }
    }
    return numbers[i]
}




// 标准的二分查找
func binarySearch(_ n: [Int], _ target: Int) -> Int {
    var p1 = 0, p2 = n.count - 1
    // <= 
    while p1 <= p2 {
        let mid = (p2 - p1)/2 + p1 // 记得加p1
        if n[mid] == target {
            return mid
        }else if (n[mid] > target){
            p2 = mid - 1
        }else if (n[mid] < target) {
            p1 = mid + 1
        }
    }
    return -1
}
