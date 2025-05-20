import SwiftUI

struct HomeView: View {
    @Binding var cart: [Book]
    @StateObject private var bookAPIFetcher = BookAPIFetcher()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onSearch: {
                    Task {
                        try await loadBooks()
                    }
                })

                if let books = bookAPIFetcher.searchResults?.books ?? bookAPIFetcher.newReleases?.books {
                    BookListView(books: books, onAddToCart: { cart.append($0) })
                } else {
                    ProgressView("Loading...")
                        .onAppear {
                            Task {
                                try await loadBooks()
                            }
                        }
                }
            }
            .navigationTitle("Books")
        }
    }

    private func loadBooks() async throws{
        if !searchText.isEmpty {
            try await bookAPIFetcher.searchBooks(query: searchText)
        } else {
            try await bookAPIFetcher.fetchNewReleases()
        }
    }
}
