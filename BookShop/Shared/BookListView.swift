import SwiftUI

struct BookListView: View {
    let books: [BookSearchResponse.BookAPI]
    let onAddToCart: (Book) -> Void

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(books, id: \.isbn13) { book in
                    BookCardView(book: book) {
                        onAddToCart(Book(title: book.title, author: book.subtitle, bookDescription: book.subtitle, price: Double(book.price.filter { $0.isNumber }) ?? 0))
                    }
                }
            }
            .padding()
        }
    }
}
