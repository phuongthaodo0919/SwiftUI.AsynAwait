//
//  UserViewModel.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/21/23.
//

import Foundation

struct UserViewModel {
    private let user: User
    init(user: User) {
        self.user = user
    }
    
    var id: Int {
        user.id
    }
    var name: String {
        user.name
    }
    var username: String {
        user.username
    }
    var email: String {
        user.email
    }
    var phone: String {
        user.phone
    }
    var street: String {
        user.address.street
    }
    var suite: String {
        user.address.suite
    }
    var city: String {
        user.address.city
    }
}
