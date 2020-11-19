import UIKit

// 数组中重复的数据

func findDuplicates(_ nums :[Int]) -> [Int] {
    guard nums.count > 1 else {
        return []
    }
    var set = Set<Int>()
    var arr = [Int]()
    
    for i in nums {
        if set.contains(i) {
            arr.append(i)
        }else{
            set.insert(i)
        }
    }
    
    return arr
}

