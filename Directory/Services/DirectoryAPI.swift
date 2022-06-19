import Foundation

enum DirectoryServiceError: Error {
    case empty
    case malformed
}

enum DirectorySort {
    case firstName
}

protocol DirectoryAPI {
    func fetchEmployees(sortedBy: DirectorySort, completion: @escaping (Result<[Employee], DirectoryServiceError>) -> Void)
}
