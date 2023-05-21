//
//  UserListViewModel.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/21/23.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var userList: [UserViewModel] = []
    private let userContinuationService = UserContinuationService()
    
    func getUsers() async {
        do {
           let result = try await userContinuationService.getUsers()
            DispatchQueue.main.async {
                self.userList = result.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
    }
    
    
//    private let userService = UserService()
//
//    func getUsers(){
//        userService.getUser { result in
//            switch result {
//            case .success(let users):
//                DispatchQueue.main.async {
//                    self.userList = users.map(UserViewModel.init)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
    
}
