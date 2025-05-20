import SwiftUI

struct NewBooksView: View {
    @Binding var cart: [Book]
    @StateObject private var bookAPIFetcher = BookAPIFetcher()

    var body: some View {
        NavigationView {
            if let newReleases = bookAPIFetcher.newReleases {
                BookListView(books: newReleases.books) { book in
                    cart.append(Book(title: book.title, author: book.author, bookDescription: book.bookDescription, price: Double(book.price)))
                }
                .navigationTitle("New")
            } else {
                Text("Loading...")
                    .foregroundColor(.gray)
                    .onAppear {
                        Task {
                            try await bookAPIFetcher.fetchNewReleases()
                        }
                    }
            }
        }
    }
}
