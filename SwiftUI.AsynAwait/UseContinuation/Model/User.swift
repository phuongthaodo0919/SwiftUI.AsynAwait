//
//  Post.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/21/23.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
}

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
}
