import SwiftUI

struct NewBooksView: View {
    @Binding var cart: [Book]
    
    let newBooks: [Book] = [
        Book(title: "Meow", author: "Cat1",bookDescription: "Meow Meow Meow",  price: 99.99),
        Book( title: "Meow Meow Meow", author: "Cat2", bookDescription: "Meow, best Meow", price: 29.99)
    ]

    var body: some View {
            NavigationView {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(newBooks) { book in
                            BookCardView(book: book) {
                                cart.append(book)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("New")
            }
        }
    }
