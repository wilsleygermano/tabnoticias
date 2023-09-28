//
//  NewsListModel.swift
//  tabnoticias
//
//  Created by Wilsley Germano on 21/09/23.
//

import Foundation

@MainActor
class NewsModel: ObservableObject {
    
    @Published var newsList: [NewsItem] = []
    @Published var errorMessage = ""
    @Published var hasError = false
    @Published var isLoading = false
    
    var pageNumber: Int = 1
    
    let pageContent: Int = 30
    

    func get(strategy: NewsStrategy? = nil) async {
        do {
            self.isLoading = true
            let data = try await ApiNewsFetcher().call(page: pageNumber, strategy: strategy)
            if let news = data.news {
                self.newsList.append(contentsOf: news)
                if news.count == pageContent {
                    self.pageNumber += 1
                }
            }
            self.isLoading = false
            return
        } catch {
            hasError = true
            self.errorMessage = "Não é possível obter novas notícias. Tente novamente mais tarde."
            self.isLoading = false
            return
        }
            
    }
    
    func checkIfItIsTheLastNews(news: NewsItem) -> Bool{
        return self.newsList.last?.id == news.id
    }
    
    
}
