//
//  ArticleResponse.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/24/23.
//

import Foundation

struct ActicleResponse: Decodable {
    let articles: [Article]
    
    
    private enum ActicleKeys: String, CodingKey {
        case articlesKey = "articles"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ActicleKeys.self)
        articles = try container.decode([Article].self, forKey: ActicleKeys.articlesKey)
    }
    
}
