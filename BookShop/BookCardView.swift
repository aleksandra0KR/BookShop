import SwiftUI

struct BookCardView: View {
    let book: Book
    let onBuy: () -> Void

    @State private var showAdded = false

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

            VStack {
                Button(action: {
                    onBuy()
                    showAdded = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        showAdded = false
                    }
                }) {
                    Image(systemName: showAdded ? "checkmark.circle.fill" : "cart.badge.plus")
                        .foregroundColor(showAdded ? .green : .blue)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }

                if showAdded {
                    Text("Добавлено")
                        .font(.caption2)
                        .foregroundColor(.green)
                        .padding(.top, 4)
                }
            }
            .padding(12)
        }
    }
}
