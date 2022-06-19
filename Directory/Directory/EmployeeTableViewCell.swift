import SDWebImage
import UIKit

class EmployeeTableViewCell: UITableViewCell {

    var employee: Employee? {
        didSet {
            reloadUi()
        }
    }

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "unavailable")
        imageView.widthAnchor.constraint(equalToConstant: DesignConstants.imageSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: DesignConstants.imageSize).isActive = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .darkText
        label.text = "First Last"
        return label
    }()

    private lazy var teamLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Team Name"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }

    public override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        nameLabel.text = ""
        teamLabel.text = ""
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding is not supported")
    }

    private func setupViews() {
        contentView.addSubviews([photoImageView, nameLabel, teamLabel])
    }

    private func setupConstraints() {
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: DesignConstants.margin2x).isActive = true
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DesignConstants.margin2x).isActive = true

        nameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: DesignConstants.margin2x).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DesignConstants.margin4x).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -DesignConstants.margin2x).isActive = true

        teamLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        teamLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: DesignConstants.spacing1x).isActive = true
    }

    private func reloadUi() {
        guard let data = employee else { return }
        nameLabel.text = data.name
        teamLabel.text = data.team

        if let smallImageURL = data.imageSmall, let imageURL = URL(string: smallImageURL) {
            photoImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "nophoto"))
            photoImageView.layer.cornerRadius = DesignConstants.imageSize / 2
            photoImageView.layer.masksToBounds = true
        }
    }
}

private extension DesignConstants {
    static let margin1x: CGFloat = 6.0
    static let margin2x: CGFloat = 12.0
    static let margin3x: CGFloat = 18.0
    static let margin4x: CGFloat = 24.0
    static let spacing1x: CGFloat = 2.0
    static let imageSize: CGFloat = 70.0
}
