import Foundation

enum DirectoryServiceError: Error {
    case empty
    case malformed
}

protocol DirectoryAPI {
    func fetchEmployees(completion: @escaping (Result<[Employee], DirectoryServiceError>) -> Void)
}
