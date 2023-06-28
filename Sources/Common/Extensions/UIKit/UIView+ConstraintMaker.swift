import UIKit

extension UIView {
    func makeConstraints(_ closure: (ConstraintMaker) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = ConstraintMaker(self)
        closure(constraints)
        constraints.activate()
    }
}
