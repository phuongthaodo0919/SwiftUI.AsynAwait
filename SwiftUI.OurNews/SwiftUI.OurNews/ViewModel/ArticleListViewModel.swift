//
//  ArticleListViewModel.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/24/23.
//

import Foundation

class ArticleListViewModel: ObservableObject {
    @Published var articles: [ArticleViewModel] = []
    private var newsService = NewsService()
    
    func fetArticles(sourceName: String) {
        newsService.fetchNewsBySource(sourceName: sourceName) { result in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles.map(ArticleViewModel.init)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func fetchArticlesAsync(sourceName: String) async {
        do
        {
            let articles = try await newsService.fetchNewsBySourceAsync(sourceName: sourceName)
            DispatchQueue.main.async {
                self.articles = articles.map(ArticleViewModel.init)
                print( self.articles)
            }
            
        } catch {
            print(error)
        }
    }
}
