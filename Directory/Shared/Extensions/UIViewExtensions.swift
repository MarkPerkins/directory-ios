import UIKit   

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for subview in views {
            addSubview(subview)
        }
    }
}
