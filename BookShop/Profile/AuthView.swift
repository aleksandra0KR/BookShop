import SwiftUI
import SwiftData
struct AuthView: View {
    @State private var isLogin = true
    @State private var showingAlert = false
    @State private var errorMessage = ""

    var onLogin: (User) -> Void
    var onRegister: (User) -> Void

    var body: some View {
        VStack {
            Picker("", selection: $isLogin) {
                Text("Login").tag(true)
                Text("Register").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if isLogin {
                LoginView(onLogin: { user in
                    onLogin(user)
                })
            } else {
                RegisterFormView(onRegister: { user in
                    onRegister(user)
                })
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}
