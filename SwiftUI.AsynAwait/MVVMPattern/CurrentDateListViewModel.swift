//
//  CurrentDateListViewModel.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/20/23.
//

import Foundation

class CurrentDateListViewModel : ObservableObject {
    @Published var currentDates: [CurrentDateViewModel] = []
    private var webservice = Webservice()
    
    func populateDates() async {
        do {
            guard let currentDate = try await webservice.getDate() else { return }
            
            DispatchQueue.main.async {
                self.currentDates.append(CurrentDateViewModel(currentDate: currentDate))
            }

        } catch {
            print(error)
        }
    }
    
}
