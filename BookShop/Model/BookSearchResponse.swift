struct BookSearchResponse: Decodable {
    let total: String
    let page: String? 
    let books: [BookAPI]

    struct BookAPI: Decodable {
        let title: String
        let subtitle: String
        let isbn13: String
        let price: String
        let image: String
        let url: String
    }
}
