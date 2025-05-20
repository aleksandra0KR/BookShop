import SwiftUI
import SwiftData

struct OrderHistoryView: View {
    @Query var orders: [Order]

    var body: some View {
        NavigationView {
            List {
                ForEach(orders.reversed(), id: \.id) { order in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Order Date \(order.date.formatted(date: .abbreviated, time: .shortened))")
                            .font(.headline)
                        ForEach(order.books, id: \.id) { book in
                            Text("\(book.title)")
                                .font(.subheadline)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Order History")
        }
    }
}
