import SwiftUI

struct BuyButton: View {
    let isAdded: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isAdded ? "checkmark.circle.fill" : "cart.badge.plus")
                .foregroundColor(isAdded ? .green : .blue)
                .padding(8)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
    }
}
