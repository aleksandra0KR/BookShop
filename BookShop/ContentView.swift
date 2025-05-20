import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @State private var cart: [Book] = []
    @State private var showingRegister = false
    // @State private var currentUser: User? = nil
    @State private var currentUser: User? = User(username: "TestUser", email: "test@example.com", password: "123456")



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
            
            ProfileView(showingRegister: $showingRegister)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
        .accentColor(.blue)
        .sheet(isPresented: $showingRegister) {
            RegisterView()
        } .onAppear {
            if let user = currentUser {
                context.insert(user)
                try? context.save()
            }
        }
        .accentColor(.blue)
        .sheet(isPresented: $showingRegister) {
            RegisterView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
