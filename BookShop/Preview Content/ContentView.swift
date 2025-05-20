import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context

    @State private var cart: [Book] = []
    @State private var showingRegister = false

    @AppStorage("currentUserEmail") private var currentUserEmail: String?
    @Query private var users: [User]

    var currentUser: User? {
        users.first(where: { $0.email == currentUserEmail })
    }

    var body: some View {
        TabView {
            HomeView(cart: $cart)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            CartView(cart: $cart, currentUser: currentUser)
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }

            NewBooksView(cart: $cart)
                .tabItem {
                    Label("New", systemImage: "sparkles")
                }

            ProfileView(
                showingRegister: $showingRegister,
                currentUser: currentUser,
                onLogout: {
                    currentUserEmail = nil
                }
            )
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle.fill")
            }
        }
        .sheet(isPresented: $showingRegister) {
            AuthView(
                onLogin: { user in
                    context.insert(user)
                    try? context.save()
                    currentUserEmail = user.email
                    showingRegister = false
                },
                onRegister: { user in
                    context.insert(user)
                    try? context.save()
                    currentUserEmail = user.email
                    showingRegister = false
                }
            )
        }

    }
}
