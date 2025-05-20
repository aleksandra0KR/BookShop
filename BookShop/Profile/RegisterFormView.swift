import SwiftUI
import SwiftData

struct RegisterFormView: View {
    @Environment(\.modelContext) private var modelContext
    @AppStorage("currentUserEmail") private var currentUserEmail: String?

    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var registered = false

    var onRegister: ((User) -> Void)?

    var body: some View {
        VStack(spacing: 20) {
            Text("Registration")
                .font(.largeTitle)
                .bold()

            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.words)

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            CustomButton(title: "Register", backgroundColor: .blue) {
                let newUser = User(username: username, email: email, password: password)
                modelContext.insert(newUser)
                try? modelContext.save()
                currentUserEmail = newUser.email
                onRegister?(newUser)
                registered = true
            }

            if registered {
                Text("Registration was successful!")
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding()
    }
}
