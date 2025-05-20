import Foundation
import SwiftData

@Model
final class User: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var username: String
    var email: String
    var password: String

    @Relationship var orders: [Order]  = []

    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = password
    }
}
