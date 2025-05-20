import SwiftUI

struct OrderHistoryListView: View {
    let orders: [Order]

    var body: some View {
        List {
            Section(header: Text("Order History")) {
                ForEach(orders) { order in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Order date: \(order.date, style: .date)")
                            .font(.headline)
                        ForEach(order.books, id: \.id) { book in
                            Text(book.title)
                                .font(.subheadline)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
        .listStyle(.plain)
        .frame(maxHeight: 300)
    }
}
