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
