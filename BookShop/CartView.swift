import SwiftUI
import SwiftData

struct CartView: View {
    @Binding var cart: [Book]
    @Environment(\.modelContext) private var context
    @State private var showingCheckout = false
    var currentUser: User?
    @State private var cardNumber = ""
    @State private var deliveryAddress = ""
    @State private var showingConfirmation = false

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
                        TextField("Card Number", text: $cardNumber)
                                              .keyboardType(.numberPad)
                                              .textFieldStyle(RoundedBorderTextFieldStyle())
                                              .padding(.horizontal)

                       TextField("Delivery Address", text: $deliveryAddress)
                                              .textFieldStyle(RoundedBorderTextFieldStyle())
                                              .padding(.horizontal)
                        
                        HStack {
                            Text("Total:")
                                .font(.headline)
                            Spacer()
                            Text("$\(totalPrice, specifier: "%.2f")")
                                .font(.headline)
                        }
                        .padding(.horizontal)

                        Button(action: {
                            placeOrder()
                        }) {
                            Text("Place an order")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(cardNumber.isEmpty || deliveryAddress.isEmpty ? Color.gray : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .disabled(cardNumber.isEmpty || deliveryAddress.isEmpty)
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Cart")
            .alert("Order placed!", isPresented: $showingConfirmation) {
                Button("OK", role: .cancel) { }
            }
        }
    }


    func placeOrder() {
        guard !cardNumber.isEmpty, !deliveryAddress.isEmpty else {
            return
        }
        let user = currentUser ?? User(username: "Guest", email: "", password: "")
        let order = Order(books: cart, user: user, cardNumber: cardNumber, deliveryAddress: deliveryAddress)
        context.insert(order)
        do {
            try context.save()
            cart.removeAll()
            cardNumber = ""
            deliveryAddress = ""
            showingConfirmation = true
        } catch {
            print("Failed to save order: \(error)")
        }
    }


}
