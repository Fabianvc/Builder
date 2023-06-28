import UIKit

final class ConstraintMaker {
    private let view: UIView
    private var constraints: [NSLayoutConstraint] = []

    init(_ view: UIView) {
        self.view = view
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    @discardableResult
    func top(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        constraints.append(view.topAnchor.constraint(equalTo: anchor, constant: constant))
        return self
    }

    @discardableResult
    func leading(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        constraints.append(view.leadingAnchor.constraint(equalTo: anchor, constant: constant))
        return self
    }

    @discardableResult
    func trailing(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) -> Self {
        constraints.append(view.trailingAnchor.constraint(equalTo: anchor, constant: constant))
        return self
    }

    @discardableResult
    func bottom(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) -> Self {
        constraints.append(view.bottomAnchor.constraint(equalTo: anchor, constant: constant))
        return self
    }

    @discardableResult
    func equalSuperView(insets: UIEdgeInsets = .zero) -> Self {
        if let superview = view.superview {
            constraints.append(view.topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top))
            constraints.append(view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left))
            constraints.append(view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right))
            constraints.append(view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom))
        }
        return self
    }

    @discardableResult
    func equalSuperView(constant: CGFloat = .zero) -> Self {
        if let superview = view.superview {
            constraints.append(view.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant))
            constraints.append(view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant))
            constraints.append(view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -constant))
            constraints.append(view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant))
        }
        return self
    }

    @discardableResult
    func width(equalTo constant: CGFloat) -> Self {
        constraints.append(view.widthAnchor.constraint(equalToConstant: constant))
        return self
    }

     @discardableResult
    func height(equalTo constant: CGFloat) -> Self {
        constraints.append(view.heightAnchor.constraint(equalToConstant: constant))
        return self
    }

    @discardableResult
    func center() -> Self {
        guard let superview = view.superview else { return self }
        constraints.append(view.centerYAnchor.constraint(equalTo: superview.centerYAnchor))
        constraints.append(view.centerXAnchor.constraint(equalTo: superview.centerXAnchor))
        return self
    }

    @discardableResult
    func size(equalTo size: CGSize) -> Self {
        constraints.append(view.widthAnchor.constraint(equalToConstant: size.width))
        constraints.append(view.heightAnchor.constraint(equalToConstant: size.height))
        return self
    }

    @discardableResult
    func size(equalTo size: CGFloat) -> Self {
        constraints.append(view.widthAnchor.constraint(equalToConstant: size))
        constraints.append(view.heightAnchor.constraint(equalToConstant: size))
        return self
    }

    @discardableResult
    func aspectRatio(equalTo ratio: CGFloat) -> Self {
        constraints.append(view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: ratio))
        return self
    }

    @discardableResult
    func offset(_ constant: CGFloat) -> Self {
        constraints.forEach { $0.constant = constant }
        return self
    }

    func activate() {
        NSLayoutConstraint.activate(constraints)
    }
}
