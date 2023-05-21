//
//  NetworkError.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/21/23.
//

import Foundation

enum NetworkError: Error {
    case urlInvalid
    case noData
    case decodedFailed
}
