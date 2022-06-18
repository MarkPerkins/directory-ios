import Foundation
import Codextended

struct Directory: Codable {
    var employees: [Employee]

    init(from decoder: Decoder) throws {
        employees = try decoder.decode("employees")
    }
}
