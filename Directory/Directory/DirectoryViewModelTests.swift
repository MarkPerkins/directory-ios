@testable import Directory
import XCTest

class DirectoryViewModelTests: XCTestCase {

    func testValidResponseStoresEmployees() {
        let successService = SuccessfulMockDirectoryService()
        let viewModel = DirectoryViewModel(directoryService: successService)
        let expectation = expectation(description: "loademployees_completed")
        viewModel.loadEmployees { success in
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
        XCTAssertNotNil(viewModel.employees)
    }
}

class SuccessfulMockDirectoryService: DirectoryAPI {

    func fetchEmployees(sortedBy: DirectorySort, completion: @escaping (Result<[Employee], DirectoryServiceError>) -> Void) {
        let json = loadJsonFile("success")
        let result = try! JSONDecoder().decode(Directory.self, from: json!)
        completion(.success(result.employees))
    }

    private func loadJsonFile(_ fileName: String) -> Data? {
        let bundle = Bundle(for: SuccessfulMockDirectoryService.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            return try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        }
        return nil
    }
}
