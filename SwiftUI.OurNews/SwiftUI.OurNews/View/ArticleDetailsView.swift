//
//  ArticleDetailsView.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/25/23.
//

import SwiftUI

struct ArticleDetailsView: View {
    let articleVM: ArticleViewModel
    
    var body: some View {
            VStack {
                Text(articleVM.title)
                    .font(.custom("Arial", size: 30))
                    .fontWeight(.heavy)
                AsyncImageView(imageUrl: articleVM.urlToImage)
                    .frame(maxWidth: 200, maxHeight: 200)
                HStack {
                    Spacer()
                    Text(articleVM.author).font(.caption)
                }
                Text(articleVM.description).font(.body)
                HStack {
                    Spacer()
                    Text(articleVM.publishedAt).font(.footnote).italic()
                }
                Spacer()
            }.padding()
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(articleVM: ArticleViewModel(article: Article(author: "Author", title: "Title", description: "Description", urlToImage: "", publishedAt: "2023-04-03T00:40:54Z")))
    }
}
