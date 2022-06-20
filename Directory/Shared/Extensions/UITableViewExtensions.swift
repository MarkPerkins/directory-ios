import UIKit

extension UITableView {
    func updateHeaderFooterViewHeight() {
        if let header = self.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            header.frame.size.height = newSize.height
            tableHeaderView = header
        }

        if let footer = self.tableFooterView {
            let newSize = footer.systemLayoutSizeFitting(CGSize(width: self.bounds.size.width,
                                                                height: UIView.layoutFittingCompressedSize.height))
            if footer.frame.size.height != newSize.height {
                footer.frame.size.height = newSize.height
            }
            tableFooterView = footer
        }
    }
}
