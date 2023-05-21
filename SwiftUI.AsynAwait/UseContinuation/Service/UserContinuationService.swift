//
//  UserContinuationService.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/21/23.
//

import Foundation

struct UserContinuationService {
    private let userService = UserService()
    
    func getUsers() async throws -> [User] {
        return try await withCheckedThrowingContinuation({ continuation in
            userService.getUser { result in
                switch result {
                case .success(let users):
                    continuation.resume(returning: users)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
    
    func getU() async throws -> [User] {
        return try await withCheckedThrowingContinuation({ continuation in
            userService.getUser { result in
                switch result {
                case .failure(let err):
                    continuation.resume(throwing: err)
                case .success(let users):
                    continuation.resume(returning: users)
                }
            }
        })
    }
}
