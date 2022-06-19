import UIKit
import SwiftUI

class DirectoryViewController: UIViewController {

    let viewModel: DirectoryViewModel

    private var fetchFailed: Bool = false {
        didSet {
            view.setNeedsLayout()
            view.layoutIfNeeded()
        }
    }

    init(viewModel: DirectoryViewModel = DirectoryViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Employee Directory"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.refreshControl = refreshControl
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.defaultReuseIdentifier)
        return tableView
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(fetchDataAndReload), for: .valueChanged)
        return control
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchDataAndReload()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTableHeader()
    }

    private func setupViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(tableView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        NSLayoutConstraint.activate(constraints)
    }

    @objc private func fetchDataAndReload() {
        viewModel.loadEmployees { [weak self] success in
            DispatchQueue.main.async {
                self?.fetchFailed = !success
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
            }
        }
    }

    private func setupTableHeader() {
        if fetchFailed {
            tableView.tableHeaderView = ErrorView()
        } else {
            tableView.tableHeaderView = nil
        }
    }
}

extension DirectoryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.employees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.defaultReuseIdentifier, for: indexPath) as! EmployeeTableViewCell
        cell.employee = viewModel.employees.subscriptSafe(indexPath.row)
        return cell
    }
}

extension DirectoryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
}
