import SwiftUI

struct BookDetailView: View {
    var book: Book

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: "book.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.bottom)
                
                Text(book.title)
                    .font(.largeTitle)
                    .bold()
                Text("Author: \(book.author)")
                    .font(.title2)
                    .foregroundColor(.gray)
                Divider()
                Text(book.bookDescription)
                    .font(.body)
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding()
        }
        .navigationTitle("\(book.title)")
        .navigationBarTitleDisplayMode(.inline)
    }
}
