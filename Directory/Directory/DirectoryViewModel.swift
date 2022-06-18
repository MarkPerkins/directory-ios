import Foundation

class DirectoryViewModel {

    private let directoryService: DirectoryAPI

    var employees: [Employee] = [Employee]()

    init(directoryService: DirectoryAPI = DirectoryService()) {
        self.directoryService = directoryService
    }

    func loadEmployees(completion: (() -> Void)?) {
        directoryService.fetchEmployees { [weak self] result in
            switch result {
            case .success(let employeeList):
                self?.employees = employeeList
            case .failure(let error):
                print("error occured: \(error.localizedDescription)")
                // handle error
            }
            completion?()
        }
    }
}
