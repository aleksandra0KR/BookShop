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


let books = [
    Book(title: "book1", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book2", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book3", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book4", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book5", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book6", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book7", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book8", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book9", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book10", author: "wedfwed", bookDescription: "edwedwed", price: 1.11),
    Book(title: "book11", author: "wedfwed", bookDescription: "edwedwed", price: 1.11)
]
