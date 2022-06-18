import Foundation

extension Array {
    func subscriptSafe(_ index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
