import UIKit
//冒泡排序 升序
/*
 O(n²) 时间
 O(1)  空间
 冒泡排序是一种稳定的排序
 */

func bubbleSort(_ uSortArray: inout [Int]){
    if uSortArray.count == 1 {
        return
    }
    
    for i in 0 ..< uSortArray.count - 1 {
        for j in 0 ..< uSortArray.count - i - 1 {
            if uSortArray[j] > uSortArray[j+1] {
                uSortArray.swapAt(j,j+1)
            }
        }
    }
}
var list = [2, 3, 5, 7, 4, 8, 6 ,10 ,1, 9]
bubbleSort(&list)
print(list)
