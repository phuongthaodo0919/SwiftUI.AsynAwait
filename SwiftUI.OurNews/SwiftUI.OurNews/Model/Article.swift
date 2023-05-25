//
//  Article.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/24/23.
//

import Foundation

struct Article: Decodable {

    let author: String
    let title: String
    let description: String
    let urlToImage: String
    let publishedAt: String
}
