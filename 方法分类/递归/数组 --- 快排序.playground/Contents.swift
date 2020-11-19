import UIKit
/*
 时间 O (nlogn)
 空间 O (n) 最差情况(倒序)时，需要n次递归调用。因此需要O(n)的栈空间。
 */
func quickSort2(_ data: [Int]) -> [Int] {
    // 边界
    if data.count <= 1 {
        return data
    }
    // 初始化 左数组 右数组 以及pivot
    var left: [Int] = []
    var right: [Int] = []
    let pivot: Int = data[data.count - 1]
    
    // 遍历分别放到左右区域   注意：条件中排除了基准值
    for index in 0..<data.count - 1 {
        if data[index] < pivot {
            left.append(data[index])
        }else{
            right.append(data[index])
        }
    }
    // 递归处理 left 区域
    var result = quickSort2(left)
    // 拼接准基
    result.append(pivot)
    // 递归处理 right 区域
    let rightResult = quickSort2(right)
    // 拼接rightArray
    result.append(contentsOf: rightResult)
    
    return result
}

let nums = [5,1,1,2,0,0]
quickSort2(nums)
