import UIKit
func findVC(_ view: UIView) -> UIViewController? {
    var responder :UIResponder? = view
    while responder != nil {
        if responder!.isKind(of: UIViewController.classForCoder()) {
            return (responder as! UIViewController)
        }
        responder = responder?.next
    }
    return nil
}
