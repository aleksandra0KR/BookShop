import SwiftUI

struct RegisterView: View {
    var onRegister: ((User) -> Void)?

    var body: some View {
        RegisterFormView(onRegister: onRegister)
    }
}
