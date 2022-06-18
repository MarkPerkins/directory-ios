import Foundation
import Codextended

struct Employee: Codable {
    var uuid: String
    var name: String
    var phone: String?
    var email: String
    var bio: String?
    var imageSmall: String?
    var imageLarge: String?
    var team: String
    var type: String

    init(from decoder: Decoder) throws {
        uuid = try decoder.decode("uuid")
        name = try decoder.decode("full_name")
        phone = try decoder.decodeIfPresent("phone_number")
        email = try decoder.decode("email_address")
        bio = try decoder.decodeIfPresent("biography")
        imageSmall = try decoder.decodeIfPresent("photo_url_small")
        imageLarge = try decoder.decodeIfPresent("photo_url_large")
        team = try decoder.decode("team")
        type = try decoder.decode("employee_type")
    }
}
