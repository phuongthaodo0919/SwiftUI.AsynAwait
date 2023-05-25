//
//  SourceListViewModel.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/24/23.
//

import Foundation

class SourceListViewModel: ObservableObject {
    @Published var sources: [SourceViewModel] = []
    
    private let newsService = NewsService()
    
    func fetchSourceAsync() async {
        let result = await newsService.fetSourceAsync()
        switch result {
        case .success(let sources):
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    self.sources = sources.map(SourceViewModel.init)
                }
            }
        case .failure(let error):
            print(error)
        }
       
    }
    
    func fetchSource(){
        newsService.fetchSource { result in
            switch result {
            case .failure(let err):
                print(err)
            case .success(let sources):
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.sources = sources.map(SourceViewModel.init)
                    }
                }
               
                
            }
        }
    }
}
