import SwiftUI

struct HomeView: View {
    @Binding var cart: [Book]
    @State private var searchText = ""

    var filteredBooks: [Book] {
        if searchText.isEmpty {
            return books
        } else {
            return books.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)

                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(filteredBooks) { book in
                            BookCardView(book: book) {
                                cart.append(book)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Books")
        }
    }
}

struct BookCardView: View {
    let book: Book
    let onBuy: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationLink(destination: BookDetailView(book: book)) {
                HStack(spacing: 16) {
                    Image(systemName: "book.closed.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(book.title)
                            .font(.headline)
                        Text(book.author)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("$\(book.price, specifier: "%.2f")")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(16)
                .shadow(color: .gray.opacity(0.2), radius: 6, x: 0, y: 4)
            }

            Button(action: onBuy) {
                Image(systemName: "cart.badge.plus")
                    .foregroundColor(.green)
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 3)
            }
            .padding(12)
        }
    }
}




struct Book: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let author: String
    let description: String
    let price: Double
}

let books = [
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11),
    Book(title: "book", author: "wedfwed", description: "edwedwed", price: 1.11)
]
