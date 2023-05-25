//
//  AriticleCellView.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/25/23.
//

import SwiftUI

struct AriticleCellView: View {
    let articleVM: ArticleViewModel
    
    var body: some View {
        HStack{
            AsyncImageView(imageUrl: articleVM.urlToImage)
                .frame(maxWidth: 100, maxHeight: 100)
            VStack (alignment: .leading) {
                Text(articleVM.author).font(.caption)
                Text(articleVM.title).font(.body).fontWeight(.medium)
                HStack {
                    Spacer()
                    Text(articleVM.publishedAt).font(.footnote).italic()
                }
            }.padding(.leading, 1)
        }
    }
}

struct AriticleCellView_Previews: PreviewProvider {
    static var previews: some View {
        AriticleCellView(articleVM: ArticleViewModel(article: Article(author: "Author", title: "Title", description: "Description", urlToImage: "", publishedAt: "2023-04-03T00:40:54Z")))
    }
}
