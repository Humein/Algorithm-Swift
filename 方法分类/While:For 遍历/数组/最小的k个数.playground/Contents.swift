import UIKit
/**
 剑指 Offer 40. 最小的k个数
 输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。


 */



//MARK: -  1. 排序
func getLeastNumbers0(_ arr: [Int], _ k: Int) -> [Int] {
   let arry = arr.sorted()
   return Array(arry[0..<k])
 }


//MARK: - 2. 最小堆实现
// [使用 Swift 实现基于堆的优先级队列](https://swift.gg/2019/05/06/implementing-a-heap-based-priority-queue-using-swift/)
/*
 堆的性质(以最小堆为例)
 所有节点的子节点大于该节点, 即最小的节点在树的根上
 堆是一棵满二叉树
 
 基本操作: 向下调整一个节点使该二叉树符合堆的性质(其他节点均满足二叉树的性质), 时间复杂度 O(logn)

 构建一个大顶堆，保存最小的 k 个数， 如果 比 堆顶 还大，我们就不需要操作，如果比堆顶小，则 替换 堆顶，进行堆化
 */



//MARK: - 3. 快排
/*
 快速排序 是利用 男左女右 这样的思想， 一点一点 将 小于锚点的值 放在左边， 大于锚点的值，放在右边，最后排序成功。
 但我们不需要完全有序，我们只需要让 锚点 的左边元素 个数等于 k 个即可
 */
class Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
      var array = arr
      randomized_selected(&array, 0, arr.count-1, k)
      return Array(array[0..<k])
    }
  
  
    //! 进行快排的入口
    func randomized_selected(_ arr:inout [Int], _ left:Int,_ right:Int,_ k:Int) {
      if left >= right {
        return
      }
    
      //! 获取锚点的坐标，锚点左边都是比锚点小的元素
      let pos = randomized_partition(&arr,left,right)
      let num = pos-left+1
      if k == num {
        return
      } else if k < num {
        randomized_selected(&arr, left, pos-1, k)
      } else {
        randomized_selected(&arr, pos+1, right, k-num)
      }
    
    }
  
    //! 进行交换，返回锚点
    func randomized_partition(_ arr:inout [Int], _ l:Int,_ r:Int) -> Int {
      //! 选择最后一个值 为锚点，
      let pivot = arr[r]
      var left = l-1

      for j in l...r-1 {
        if arr[j] <= pivot {
          left += 1
          arr.swapAt(left, j)
        }
      }

      arr.swapAt(left+1, r)
      return left+1
  }
    
}





/**
 215. 数组中的第K个最大元素
 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

 输入: [3,2,1,5,6,4] 和 k = 2
 输出: 5
 */
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    return 0
}
