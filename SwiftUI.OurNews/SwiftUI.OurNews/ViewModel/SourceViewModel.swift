//
//  SourceViewModel.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/24/23.
//

import Foundation

struct SourceViewModel {
    let source: Source
    var id: String {
        source.id
    }
    var name: String {
        source.name
    }
    var description: String{
        source.description
    }
}
