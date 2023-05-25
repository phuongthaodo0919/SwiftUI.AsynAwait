//
//  SourceListView.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/24/23.
//

import SwiftUI

struct SourceListView: View {
    @ObservedObject var sourceListVM = SourceListViewModel()
    var body: some View {
        NavigationView {
            List{
                ForEach(sourceListVM.sources, id: \.id) { item in
                    NavigationLink {
                        SourceDetailView(sourceName: item.name)
                    } label: {
                    VStack {
                        Text(item.name).font(.title)
                        Text(item.description).font(.body)
                    }
                }
                }

            }
            
        }
        .task {
            await sourceListVM.fetchSourceAsync()
        }
//        .onAppear(){
//            sourceListVM.fetchSource()
//        }
    }
}

struct SourceListView_Previews: PreviewProvider {
    static var previews: some View {
        SourceListView()
    }
}
