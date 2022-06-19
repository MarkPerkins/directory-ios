import UIKit

class ErrorView: UIView {

    private lazy var errorText: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkText
        label.text = "Results are empty"
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
        addSubview(errorText)
    }

    private func setupConstraints() {
        errorText.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        errorText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

}
