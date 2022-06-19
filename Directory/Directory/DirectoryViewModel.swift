import Foundation

class DirectoryViewModel {

    private let directoryService: DirectoryAPI

    var employees: [Employee] = [Employee]()

    init(directoryService: DirectoryAPI = DirectoryService()) {
        self.directoryService = directoryService
    }

    func loadEmployees(completion: @escaping (_ success: Bool) -> Void) {
        directoryService.fetchEmployees(sortedBy: .firstName) { [weak self] result in
            switch result {
            case .success(let employeeList):
                self?.employees = employeeList
            case .failure(let error):
                switch error {
                case .malformed, .empty:
                    print("response malformed or empty")
                    completion(false)
                    return
                }
            }
            completion(true)
        }
    }
}
