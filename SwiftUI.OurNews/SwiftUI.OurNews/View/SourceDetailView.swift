//
//  SourceDetailView.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/24/23.
//

import SwiftUI

struct SourceDetailView: View {
    @ObservedObject var articleListViewModel = ArticleListViewModel()
    var sourceName: String
    
    var body: some View {
        List {
            ForEach(articleListViewModel.articles, id: \.id) { article in
                NavigationLink(destination: {
                    ArticleDetailsView(articleVM: article)
                }, label: {
                    AriticleCellView(articleVM: article)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                })
                    
            }
        }
        .navigationTitle(Text("Details"))
     
        .task {
            await articleListViewModel.fetchArticlesAsync(sourceName: self.sourceName)
        }
//        .onAppear(){
//            articleListViewModel.fetArticles(sourceName: self.sourceName)
//        }
    }
}

struct SourceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SourceDetailView(sourceName: "abc-news-au")
    }
}
