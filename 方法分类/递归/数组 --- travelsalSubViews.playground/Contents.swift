import UIKit
/// 遍历子view
func recursionSubView(_ view :UIView){
    if view.subviews.count > 0 {
        for item in view.subviews{
            print(item)
            recursionSubView(item)
        }
    }
}
let view = UIView()
view.addSubview(UIButton())
recursionSubView(view)

func recursionSubViews(_ view: UIView){
    if view.subviews.count > 0 {
        for v in view.subviews {
            recursionSubViews(v)
        }
    }
}


// 查找当前view所在VC
extension UIView {
    func findViewController() -> UIViewController?{
        var res: UIResponder? = self
        while res != nil {
            if res!.isKind(of: UIViewController.self) {
                return (res as! UIViewController)
            }
            res = res?.next
        }
        return nil
    }
}

func findTheVC(_ view: UIView) -> UIViewController? {
    var temp = view.next
    if temp != nil {
        if temp!.isKind(of: UIViewController.self) {
            return (temp as! UIViewController)
        }
        temp = temp?.next
    }
    return nil
}

func findNextRespoder(_ view: UIView) -> UIViewController?{
    while view.next != nil {
        if view.next!.isKind(of: UIView.classForCoder()){
            findNextRespoder(view.next as! UIView)
        }
    }
    return nil
}


























