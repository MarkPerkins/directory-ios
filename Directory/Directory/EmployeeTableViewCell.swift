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
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
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
        translatesAutoresizingMaskIntoConstraints = false
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
        
    }

    private func reloadUi() {
        guard let data = employee else { return }
        nameLabel.text = data.name
        teamLabel.text = data.team
        photoImageView.image = UIImage(named: "yeah")
    }
}
