import SwiftUI

struct UserProfileView: View {
    let user: User
    let onLogout: () -> Void

    var body: some View {
        VStack(spacing: 6) {
            Text(user.username)
                .font(.title2)
                .bold()
            Text(user.email)
                .foregroundColor(.gray)

            Button("LogOut") {
                onLogout()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}
