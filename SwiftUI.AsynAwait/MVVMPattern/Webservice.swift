//
//  Webservice.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/20/23.
//

import Foundation

class Webservice {
    func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: "https://current-date.glitch.me/current-date") else {
            fatalError("Url is incorrect")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
}
