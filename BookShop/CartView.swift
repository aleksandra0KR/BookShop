import SwiftUI

struct CartView: View {
    @Binding var cart: [Book]
    @State private var showingCheckout = false

    var totalPrice: Double {
        cart.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        NavigationView {
            VStack {
                if cart.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray.opacity(0.5))

                        Text("The cart is empty")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 100)

                } else {
                    List {
                        ForEach(cart, id: \.id) { book in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(book.title)
                                        .font(.headline)
                                    Text("$\(book.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                Button(action: {
                                    if let index = cart.firstIndex(of: book) {
                                        cart.remove(at: index)
                                    }
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }

                    VStack(spacing: 12) {
                        HStack {
                            Text("Total:")
                                .font(.headline)
                            Spacer()
                            Text("$\(totalPrice, specifier: "%.2f")")
                                .font(.headline)
                        }

                        Button(action: {
                            showingCheckout = true
                        }) {
                            Text("Place an order")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Cart")
            .sheet(isPresented: $showingCheckout) {
                CheckoutView(cart: cart, isPresented: $showingCheckout)
            }
        }
    }
}
