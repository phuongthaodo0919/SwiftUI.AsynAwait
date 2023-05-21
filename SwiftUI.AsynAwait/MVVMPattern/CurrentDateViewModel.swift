//
//  CurrentDateViewModel.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/20/23.
//

import Foundation

struct CurrentDateViewModel {
    let currentDate: CurrentDate
    
    var id: UUID {
        currentDate.id
    }
    
    var date: String {
        currentDate.date
    }
}
