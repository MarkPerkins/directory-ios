import UIKit

class ErrorHeaderView: UIView {

    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 48
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var errorText: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkText
        label.text = "Directory unavailable"
        return label
    }()

    init() {
        super.init(frame: CGRect.zero)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(errorText)
    }

    private func setupConstraints() {
        mainStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

}
