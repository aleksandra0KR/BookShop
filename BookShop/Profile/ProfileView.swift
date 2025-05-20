import SwiftUI

struct ProfileView: View {
    @Binding var showingRegister: Bool
    let currentUser: User?
    let onLogout: () -> Void

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)

                if let user = currentUser {
                    UserProfileView(user: user, onLogout: onLogout)

                    if user.orders.isEmpty {
                        Text("You have no orders yet.")
                            .foregroundColor(.gray)
                            .padding(.top)
                    } else {
                        OrderHistoryListView(orders: user.orders)
                    }
                } else {
                    Text("You are not logged in to your account")
                        .foregroundColor(.gray)

                    CustomButton(title: "Register / Login", backgroundColor: .blue) {
                        showingRegister = true
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}
