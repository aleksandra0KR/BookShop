import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var users: [User]

    @State private var email = ""
    @State private var password = ""
    @AppStorage("currentUserEmail") private var currentUserEmail: String?

    var onLogin: (User) -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                if let user = users.first(where: { $0.email == email && $0.password == password }) {
                    currentUserEmail = user.email
                    onLogin(user)
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
