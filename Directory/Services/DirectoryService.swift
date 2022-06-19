import Foundation

class DirectoryService: DirectoryAPI {

    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        return URLSession(configuration: configuration)
    }()

    func fetchEmployees(sortedBy: DirectorySort, completion: @escaping (Result<[Employee], DirectoryServiceError>) -> Void) {
        guard let url = URL(string: Constants.Network.directoryEndpoint) else {  //Constants.MockResponses.malformed) else { //
            return
        }

        let request = URLRequest(url: url)
        session.dataTask(with: request) { data, request, error in
            if let data = data, let directory = try? data.decoded() as Directory {

                if directory.employees.isEmpty {
                    completion(.failure(.empty))
                    return
                }

                let sorted = self.sort(employees: directory.employees, sortBy: sortedBy)
                completion(.success(sorted))
                return
            }

            completion(.failure(.malformed))
            return

        }.resume()
    }

    private func sort(employees: [Employee], sortBy: DirectorySort) -> [Employee] {
        switch sortBy {
        case .firstName:
            return employees.sorted { $0.name < $1.name }
        }
    }
}
