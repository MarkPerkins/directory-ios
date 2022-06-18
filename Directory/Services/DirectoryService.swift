import Foundation

class DirectoryService: DirectoryAPI {

    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        return URLSession(configuration: configuration)
    }()

    func fetchEmployees(completion: @escaping (Result<[Employee], DirectoryServiceError>) -> Void) {
        guard let url = URL(string: Constants.Network.directoryEndpoint) else {
            return
        }

        let request = URLRequest(url: url)
        session.dataTask(with: request) { data, request, error in
            if let data = data, let directory = try? data.decoded() as Directory {
                completion(.success(directory.employees))
            }
        }.resume()
    }
}
