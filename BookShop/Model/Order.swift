import Foundation
import SwiftData

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
