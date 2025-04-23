import SwiftUI

struct ProfileView: View {
    @Binding var showingRegister: Bool
    @State private var isLoggedIn = false // for simulation 2 modes

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)

                if isLoggedIn {
                    VStack(spacing: 6) {
                        Text("Jane Doe")
                            .font(.title2)
                            .bold()
                        Text("janeDoe@example.com")
                            .foregroundColor(.gray)
                    }

                    Button("LogOut") {
                        isLoggedIn = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)

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
