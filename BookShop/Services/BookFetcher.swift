import Foundation
import Combine

class BookAPIFetcher: ObservableObject {
    @Published var searchResults: BookSearchResponse?
    @Published var newReleases: BookSearchResponse?
    @Published var bookDetails: BookDetailsResponse?
  


    func searchBooks(query: String, page: Int = 1) async throws {
        let urlString = "https://api.itbook.store/1.0/search/\(query)/\(page)"
        guard let url = URL(string: urlString) else { return }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
         
            let result = try JSONDecoder().decode(BookSearchResponse.self, from: data)
            DispatchQueue.main.async { self.searchResults = result }
        } catch {
            print("Search error: \(error)")
        }
    }



    func fetchNewReleases() async throws{
        let urlString = "https://api.itbook.store/1.0/new"
        guard let url = URL(string: urlString) else { return }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
            
            let result = try JSONDecoder().decode(BookSearchResponse.self, from: data)
            DispatchQueue.main.async { self.newReleases = result }
        } catch {
            print("New releases error: \(error)")
        }
    }


    func fetchBookDetails(isbn13: String) async throws{
        let urlString = "https://api.itbook.store/1.0/books/\(isbn13)"
        guard let url = URL(string: urlString) else { return }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
            
            let result = try JSONDecoder().decode(BookDetailsResponse.self, from: data)
            DispatchQueue.main.async { self.bookDetails = result }
        } catch {
            print("Book detail error: \(error)")
        }
    }
}
