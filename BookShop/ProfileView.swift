import Foundation
import SwiftData
import SwiftUI


struct ProfileView: View {
    @Binding var showingRegister: Bool
    @State private var isLoggedIn = true
    @State private var currentUser: User? = User(username: "TestUser", email: "test@example.com", password: "123456")

    let userOrders: [Order] = [
        Order(books: [Book(title: "Book 1", author: "Author 1",bookDescription: "ere",price: 10)], user: User(username: "TestUser", email: "test@example.com", password: "123456"), cardNumber: "1", deliveryAddress: "we"),
        Order(books: [Book(title: "Book 3", author: "Author 3",bookDescription: "ere", price: 20)], user: User(username: "TestUser", email: "test@example.com", password: "123456"), cardNumber: "1", deliveryAddress: "we")
    ]
    
   /* var userOrders: [Order] {
        guard let user = currentUser else { return [] }
        return allOrders.filter { $0.user?.id == user.id }
    }*/

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)

                if isLoggedIn, let user = currentUser {
                    VStack(spacing: 6) {
                        Text(user.username)
                            .font(.title2)
                            .bold()
                        Text(user.email)
                            .foregroundColor(.gray)
                    }

                    Button("LogOut") {
                        isLoggedIn = false
                        currentUser = nil
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)

                    if userOrders.isEmpty {
                        Text("You have no orders yet.")
                            .foregroundColor(.gray)
                            .padding(.top)
                    } else {
                        List {
                            Section(header: Text("Order History")) {
                                ForEach(userOrders) { order in
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

                } else {
                    Text("You are not logged in to your account")
                        .foregroundColor(.gray)

                    Button("Register / Login") {
                        showingRegister = true
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}
