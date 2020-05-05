import UIKit

/**
怎么查找两个view的公共父视图 --- 其实就是两个链表相交

用两个「指针」，分别指向两个路径的根节点，
 然后从根节点(最后的)开始，找最近的相同的节点，就可以
*/
func findRecentRoot(_ viewA: UIView?,_ viewB: UIView?) -> UIView? {
    let aArray = findSuperViewsw(viewA)
    let bArray = findSuperViewsw(viewB)
    var p1 = aArray.count - 1, p2 = bArray.count - 1
    var rootView :UIView?
    while p1 >= 0 && p2 >= 0 {
        if aArray[p1] == bArray[p2] {
            rootView = aArray[p1]
        }
        p1 -= 1
        p2 -= 1
    }
    return rootView
}

// 查找父视图 迭代 这个好用
func findSuperViewsw(_ view: UIView?) -> [UIView] {
    var view = view
    var resultArray = [UIView]()
    while view != nil {
        resultArray.append(view!)
         // while next
        view = view?.superview
    }
    return resultArray
}


let viewA = UIButton()
let viewB = UIView()
let viewC = UIView()
let viewD = UIView()
viewA.addSubview(viewB)
viewB.addSubview(viewC)
viewA.addSubview(viewD)
findSuperViewsw(viewC)
findSuperViewsw(viewD)

findRecentRoot(viewC, viewD)






// 递归  不过容器每次都初始化
func findSuperViews(_ v: UIView?) -> [UIView] {
    var vArray = [UIView]()
    if let sView = v?.superview {
        vArray.append(sView)
        findSuperViews(sView)
    }
    return vArray
}
