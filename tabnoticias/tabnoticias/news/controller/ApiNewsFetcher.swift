//
//  ApiNewsFetcher.swift
//  tabnoticias
//
//  Created by Wilsley Germano on 18/09/23.
//

import Foundation

struct ApiNewsFetcher{
    private var errorMessage = "Não é possível obter novas notícias. Tente novamente mais tarde."

    func call(page: Int? = nil, strategy: NewsStrategy? = nil) async throws -> (news: [NewsItem]?, error: Error?) {
        var results: [NewsItem]?
        guard let url = URL(string: "\(ApiConstants().baseUrl)/contents?page=\(page ?? 1)&strategy=\(strategy ?? NewsStrategy.relevant)") else {
            debugPrint("[API NEWS FETCHER ERROR] - Base API is Empty")
            return (news: nil, error: NSError(domain: "APIFetchError", code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessage]))
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([NewsItem].self, from: data)
            results = decodedResponse
            return (news: results, error: nil)
        } catch {
            debugPrint("[API NEWS FETCHER ERROR] - Error Trying to Call For News: \(error)")
            return (news: nil, error: error)
        }
    }
    
}
