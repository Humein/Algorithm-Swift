import UIKit


func findKNums(_ nums: [Int]) -> [Int] {
    var p1 = 0, maxNum = nums[0]
    var result = [Int]()
    while p1 < nums.count {
        maxNum = max(maxNum,nums[p1])
        print(maxNum)
        if nums[p1] < maxNum {
            result.append(nums[p1])
        }
        p1 += 1
    }
    return result
}

findKNums([10,9,100,100,101,100,110,109])


/*
有一个整数的无序数组a[N],
对于其中的元素a[i],
如果其前面a[0]~a[i-1]中，
如果有且仅有一个元素比它大，
我们称之为独二元素。
设计一个函数，
输入一个数组a[N],
找出其中的独二元素，
并输出出来，
如果没有这种元素，
输出-1；要求时间复杂度是O(n).
[10,9,100,100,101,100,110,109]
9,100,109
*/
