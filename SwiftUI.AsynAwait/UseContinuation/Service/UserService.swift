//
//  AwaiGetPost.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/21/23.
//

import Foundation

struct UserService {
    func getUser(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlInvalid))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([User].self, from: data)
                completion(.success(decodedData))
            } catch{
                completion(.failure(.decodedFailed))
            }
        }.resume()
    }
}
