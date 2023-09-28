//
//  ContentView.swift
//  tabnoticias
//
//  Created by Wilsley Germano on 18/09/23.
//

import SwiftUI

struct HomePageView: View {
    
    @StateObject var nm = NewsModel()
    
    
    private let appColors = AppColors()
    let alignment: HorizontalAlignment = .leading
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(nm.newsList, id: \.id) {
                    news in Section{
                        NewsContainer(
                            title: news.title, newsBody: nil, autor: news.ownerUsername, coins: news.tabCount, comments: news.comments, createdAt: news.creationDate)
                        .task {
                            if nm.checkIfItIsTheLastNews(news: news) {
                                await nm.get()
                            }
                        }
                    }
                }
                if nm.isLoading == true {
                    ProgressView()
                }
            }
            .task {
                await nm.get()
            }
        }
        .background(appColors.babyPowder)
        .preferredColorScheme(.light)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
