//
//  NetworkError.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/22/23.
//

import Foundation

enum NetworkError: Error {
    case urlIncorrect
    case noData
    case decodedFailed
}
