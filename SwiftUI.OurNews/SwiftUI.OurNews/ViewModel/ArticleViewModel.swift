//
//  ArticleViewModel.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/24/23.
//

import Foundation

struct ArticleViewModel: Identifiable {
    
    let id = UUID()
    
    let article: Article
    
    var  author: String {
        article.author
    }
    var  title: String {
        article.title
    }
    var  description: String {
        article.description
    }
    var  urlToImage: String {
        article.urlToImage
    }
    var  publishedAt: String {
        article.publishedAt
        
        
    }
}
