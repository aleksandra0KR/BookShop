import SwiftUI

struct ContentView: View {
    @State private var cart: [Book] = []
    @State private var showingRegister = false

    var body: some View {
        TabView {
            HomeView(cart: $cart)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            CartView(cart: $cart)
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }

            ProfileView(showingRegister: $showingRegister)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
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
