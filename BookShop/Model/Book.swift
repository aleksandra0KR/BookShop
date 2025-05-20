import Foundation
import SwiftData

@Model
class Book: Identifiable, Hashable {
    var id: UUID
    var title: String
    var author: String
    var bookDescription: String
    var price: Double

    init(title: String, author: String, bookDescription: String, price: Double) {
        self.id = UUID()
        self.title = title
        self.author = author
        self.bookDescription = bookDescription
        self.price = price
    }

    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
