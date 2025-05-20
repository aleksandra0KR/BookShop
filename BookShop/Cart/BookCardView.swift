import SwiftUI

struct BookCardView: View {
    let book: BookSearchResponse.BookAPI
    let onBuy: () -> Void

    @State private var showAdded = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationLink(destination: BookDetailView(book: Book(title: book.title, author: book.subtitle, bookDescription: "", price: Double(book.price.filter { $0.isNumber }) ?? 0))) {
                HStack(spacing: 16) {
                    AsyncImage(url: URL(string: book.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(book.title)
                            .font(.headline)
                        Text(book.subtitle)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text(book.price)
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

            BuyButton(isAdded: showAdded) {
                onBuy()
                showAdded = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    showAdded = false
                }
            }
            .padding(12)
        }
    }
}
