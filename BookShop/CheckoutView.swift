import SwiftUI

struct CheckoutView: View {
    let cart: [Book]
    @Binding var isPresented: Bool
    @State private var address = ""
    @State private var paymentInfo = ""
    @State private var orderPlaced = false

    var totalPrice: Double {
        cart.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Delivery Address")) {
                    TextField("Enter the address", text: $address)
                }

                Section(header: Text("Payment information")) {
                    TextField("Card number", text: $paymentInfo)
                }

                Section(header: Text("Your order")) {
                    ForEach(cart) { book in
                        HStack {
                            Text(book.title)
                            Spacer()
                            Text("$\(book.price, specifier: "%.2f")")
                        }
                    }

                    HStack {
                        Text("Total")
                        Spacer()
                        Text("$\(totalPrice, specifier: "%.2f")")
                            .bold()
                    }
                }

                if orderPlaced {
                    Text("The order has been placed!")
                        .foregroundColor(.green)
                }

                Button("Place an order") {
                    orderPlaced = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isPresented = false
                    }
                }
            }
            .navigationTitle("Place an order")
            .navigationBarItems(trailing: Button("Close") {
                isPresented = false
            })
        }
    }
}

