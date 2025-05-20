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

@Model
class Order {
    @Attribute(.unique) var id: UUID
    var books: [Book]
    var user: User?
    var date: Date
    
     var cardNumber: String
      var deliveryAddress: String

    init(books: [Book], user: User,cardNumber: String, deliveryAddress: String) {
        self.id = UUID()
        self.books = books
        self.user = user
        self.date = Date()
        self.cardNumber = cardNumber
        self.deliveryAddress = deliveryAddress
    }
}
